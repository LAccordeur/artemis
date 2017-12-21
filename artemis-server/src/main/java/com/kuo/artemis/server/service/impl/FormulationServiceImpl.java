package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.formulation.FormulationParams;
import com.kuo.artemis.server.core.dto.formulation.FormulationResult;
import com.kuo.artemis.server.core.math.LinearProgramming;
import com.kuo.artemis.server.core.math.LinearProgrammingResult;
import com.kuo.artemis.server.dao.*;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.FormulationService;
import com.kuo.artemis.server.util.common.BeanUtil;
import com.kuo.artemis.server.util.common.UUIDUtil;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/20
 */
@Service
public class FormulationServiceImpl implements FormulationService {

    @Inject
    private FormulationMapper formulationMapper;

    @Inject
    private MaterialMapper materialMapper;

    @Inject
    private NutritionStandardMapper nutritionStandardMapper;

    @Inject
    private FormulationMaterialDetailMapper formulationMaterialDetailMapper;

    @Inject
    private FormulationMaterialMapper formulationMaterialMapper;
    /**
     * 获取配方简略信息
     * @param projectId
     * @return
     */
    public Response listFormulations(String projectId) {
        Response response = new Response();

        List<Formulation> formulationList = formulationMapper.selectByProjectId(Integer.valueOf(projectId));

        response.setData(formulationList);
        response.setCode(HttpStatus.OK.value());
        response.setMsg("获取配方列表成功");
        return response;
    }

    public Response getIdByFormulationName(String formulationName) {

        Integer formulationId = formulationMapper.selectIdByFormulationName(formulationName);

        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("formulationId", formulationId);

        return new Response(map, HttpStatus.OK.value(), "获取配方id成功");
    }

    public Response listFormulationNames(String projectId) {

        List<String> formulationNameList = formulationMapper.selectFormulationNamesByProjectId(projectId);

        return new Response(formulationNameList, HttpStatus.OK.value(), "获取配方名称列表成功");
    }

    public Response getFormulationDetail(String formulationId) {
        FormulationResult result = new FormulationResult();

        Formulation formulation = formulationMapper.selectByPrimaryKey(Integer.valueOf(formulationId));
        result.setFormulation(formulation);

        List<FormulationMaterial> formulationMaterialList = formulationMaterialMapper.selectByFormulationId(Integer.valueOf(formulationId));

        result.setFormulationMaterials(formulationMaterialList);

        return new Response(result, HttpStatus.OK.value(), "获取配方信息成功");
    }

    public Response updateFormulationBasic(Formulation formulation) {
        return null;
    }

    public Response deleteFormulation(String formulationId) {

        int result = formulationMapper.deleteByPrimaryKey(Integer.valueOf(formulationId));

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "删除配方成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "删除配方失败");
        }
    }

    public Response programNewFormulation(FormulationParams params) {

        //1.获取参数
        List<Integer> materialIdList = params.getMaterialIdList();
        String nutritionStandardId = params.getNutritionStandardId();
        String userId = params.getUserId();
        String projectId = params.getProjectId();
        List<Double> nutritionStandardLeftBoundList = params.getNutritionStandardLeftBoundList();
        List<Double> nutritionStandardRightBoundList = params.getNutritionStandardRightBoundList();
        List<Double> materialLeftBoundList = params.getMaterialLeftBoundList();
        List<Double> materialRightBoundList = params.getMaterialRightBoundList();

        //2.获取线性规划所需要的内容
        List<Material> materialList =  materialMapper.selectMaterialIndicators(materialIdList);
        NutritionStandard nutritionStandard = nutritionStandardMapper.selectByPrimaryKey(Integer.valueOf(nutritionStandardId));


        //3.构建线性规划的参数
        //目标函数系数
        List<Double> objectFunctionCoefficient = new ArrayList<Double>();
        for (int i = 0; i < materialList.size(); i++) {
            Material material = materialList.get(i);
            objectFunctionCoefficient.add(material.getMaterialPrice().doubleValue());
        }

        Field[] fields = nutritionStandard.getClass().getDeclaredFields();

        //约束函数的系数
        List<List<Double>> constraintLists = new ArrayList<List<Double>>();
        for (int i = 0; i < fields.length; i++) {

            //针对每一个营养标准指标构造约束方程
            Field field = fields[i];
            int materialSize = materialIdList.size();
            List<Double> coefficientList = new ArrayList<Double>();

            if (field.getType().equals(BigDecimal.class)) {

                for (int j = 0; j < materialSize; j++) {
                    Material material = materialList.get(j);
                    //Method method = material.getClass().getMethod("get" + field.getName(), BigDecimal.class);
                    Map<String, Object> map = BeanUtil.beanToMap(material);
                    Double coefficient = null;
                    if (map.get(field.getName()) != null) {
                        coefficient = ((BigDecimal) map.get(field.getName())).doubleValue();
                        coefficientList.add(coefficient);
                    } else {
                        coefficientList.add(0.0);
                    }


                }

                constraintLists.add(coefficientList);
            }

        }

        //约束函数的值
        /*List<Double> constraintValueList = new ArrayList<Double>();
        Map<String, Object> nutritionStandardMap = BeanUtil.beanToMap(nutritionStandard);
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];

            if (field.getType().equals(BigDecimal.class)) {
                Double value = null;
                if (nutritionStandardMap.get(field.getName()) != null) {
                    value = ((BigDecimal) nutritionStandardMap.get(field.getName())).doubleValue();
                } else {
                    value = 0.0;
                }
                constraintValueList.add(value);
            }
            //constraintValueList.remove(0.0);

        }*/

        LinearProgrammingResult result = LinearProgramming.getMinimize(objectFunctionCoefficient, constraintLists, nutritionStandardLeftBoundList, nutritionStandardRightBoundList, materialLeftBoundList, materialRightBoundList);

        //构造返回结果
        FormulationResult formulationResult = new FormulationResult();
        formulationResult.setUserId(params.getUserId());
        formulationResult.setProjectId(params.getProjectId());
        formulationResult.setFormulationCode(params.getFormulationCode());
        formulationResult.setFormulationName(params.getFormulationName());
        formulationResult.setFormulationMaterialCost(result.getResultValue());
        formulationResult.setProgrammingStatus(result.getStatus().toString());

        List<FormulationMaterial> formulationMaterialList = new ArrayList<FormulationMaterial>();
        List<Double> resultValue = result.getVariableValueList();
        for (int i = 0; i < resultValue.size(); i++) {
            FormulationMaterial formulationMaterial = new FormulationMaterial();
            Material material = materialList.get(i);
            formulationMaterial.setMaterialId(materialIdList.get(i));
            formulationMaterial.setOptimalRatio(BigDecimal.valueOf(resultValue.get(i)));
            formulationMaterial.setMaterialName(material.getMaterialName());
            formulationMaterial.setMaterialPrice(material.getMaterialPrice());
            formulationMaterialList.add(formulationMaterial);
        }
        formulationResult.setFormulationMaterials(formulationMaterialList);

        return new Response(formulationResult, HttpStatus.OK.value(), "配方规划结果");
    }


    @Transactional(rollbackFor = Exception.class)
    public Response createNewFormulation(FormulationResult result) {

        //1.新建配方信息
        Formulation formulation = new Formulation();
        formulation.setUserId(Integer.valueOf(result.getUserId()));
        formulation.setProjectId(Integer.valueOf(result.getProjectId()));
        formulation.setFormulationCode(result.getFormulationCode());
        formulation.setFormulationName(result.getFormulationName());
        formulation.setFormulationMaterialCost(BigDecimal.valueOf(result.getFormulationMaterialCost()));
        formulationMapper.insertSelective(formulation);

        //2.更新配方原料关系
        Integer formulationId = formulation.getId();
        List<FormulationMaterial> formulationMaterialList = result.getFormulationMaterials();

        for (int i = 0; i < formulationMaterialList.size(); i++) {
            FormulationMaterial formulationMaterial = formulationMaterialList.get(i);

            formulationMaterial.setId(UUIDUtil.get32UUIDLowerCase());
            formulationMaterial.setFormulationId(formulationId);
        }
        formulationMaterialMapper.insertBatch(formulationMaterialList);
        return new Response(HttpStatus.OK.value(), "新增配方成功");
    }
}
