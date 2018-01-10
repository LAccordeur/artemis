package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.common.NutritionIndicator;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.formulation.FormulationParams;
import com.kuo.artemis.server.core.dto.formulation.FormulationResult;
import com.kuo.artemis.server.core.factory.DecimalFormatFactory;
import com.kuo.artemis.server.core.math.LinearProgramming;
import com.kuo.artemis.server.core.math.LinearProgrammingResult;
import com.kuo.artemis.server.dao.*;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.FormulationService;
import com.kuo.artemis.server.util.common.BeanUtil;
import com.kuo.artemis.server.util.common.UUIDUtil;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.DecimalFormat;
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
    private FormulationNutritionMapper formulationNutritionMapper;

    @Inject
    private FormulationMaterialMapper formulationMaterialMapper;
    /**
     * 获取配方基本信息
     * @param projectId
     * @return
     */
    public Response listFormulations(String projectId) {
        Response response = new Response();
        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

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

        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        List<Formulation> formulationNameList = formulationMapper.selectFormulationNamesByProjectId(Integer.valueOf(projectId));

        return new Response(formulationNameList, HttpStatus.OK.value(), "获取配方名称列表成功");
    }

    public Response getFormulationDetail(String formulationId) {

        if (formulationId == null || "".equals(formulationId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        FormulationResult result = new FormulationResult();

        Formulation formulation = formulationMapper.selectByPrimaryKey(Integer.valueOf(formulationId));
        result.setFormulation(formulation);

        List<FormulationMaterial> formulationMaterialList = formulationMaterialMapper.selectByFormulationId(Integer.valueOf(formulationId));
        result.setFormulationMaterials(formulationMaterialList);

        List<FormulationNutrition> formulationNutritionList = formulationNutritionMapper.selectByFormulationId(Integer.valueOf(formulationId));
        result.setFormulationNutritions(formulationNutritionList);
        return new Response(result, HttpStatus.OK.value(), "获取配方信息成功");
    }

    public Response updateFormulationBasic(Formulation formulation) {
        return null;
    }

    @Transactional(rollbackFor = Exception.class)
    public Response deleteFormulation(String formulationId) {

        if (formulationId == null || "".equals(formulationId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        Integer id = Integer.valueOf(formulationId);

        int resultMaterial = formulationMaterialMapper.deleteByFormulationId(id);
        int resultNutrition = formulationNutritionMapper.deleteByFormulationId(id);

        int result = formulationMapper.deleteByPrimaryKey(id);

        if (resultMaterial > 0 && resultNutrition > 0 && result > 0) {
            return new Response(HttpStatus.OK.value(), "删除配方成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "删除配方失败");
        }
    }

    /**
     * TODO  ##BUG##  需保证原料营养指标的顺序符合Excel文件中 “营养指标设定” 那一页的顺序
     * @param params
     * @return
     */
    public Response programNewFormulation(FormulationParams params) {

        //1.获取参数
        List<Integer> materialIdList = params.getMaterialIdList();
        String nutritionStandardId = params.getNutritionStandardId();
        List<Double> nutritionStandardLeftBoundList = params.getNutritionStandardLeftBoundList();
        List<Double> nutritionStandardRightBoundList = params.getNutritionStandardRightBoundList();
        List<Double> materialLeftBoundList = params.getMaterialLeftBoundList();
        List<Double> materialRightBoundList = params.getMaterialRightBoundList();

        //2.获取线性规划所需要的内容
        List<Material> materialList =  materialMapper.selectMaterialIndicators(materialIdList);
        NutritionStandard nutritionStandard = nutritionStandardMapper.selectByPrimaryKey(Integer.valueOf(nutritionStandardId));

        if (materialIdList != null && nutritionStandard != null) {
            //do nothing continue
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(),"原料或指标数据无效");
        }

        //3.构建线性规划的参数
        //目标函数系数  即为各个原料的价格
        List<Double> objectFunctionCoefficient = new ArrayList<Double>();
        for (int i = 0; i < materialList.size(); i++) {
            Material material = materialList.get(i);
            objectFunctionCoefficient.add(material.getMaterialPrice().doubleValue());
        }

        Field[] fields = nutritionStandard.getClass().getDeclaredFields();  //TODO  可能存在field随机改变而产生的BUG
        //约束函数的系数
        List<List<Double>> constraintLists = new ArrayList<List<Double>>();
        getConstraintLists(materialList, fields, constraintLists);

        //4.执行规划
        LinearProgrammingResult result = LinearProgramming.getMinimize(objectFunctionCoefficient, constraintLists, nutritionStandardLeftBoundList, nutritionStandardRightBoundList, materialLeftBoundList, materialRightBoundList);
        if (result == null) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "线性规划参数不全");
        }

        //5.构造返回结果
        //构造基本参数
        FormulationResult formulationResult = new FormulationResult();
        formulationResult.setUserId(params.getUserId());
        formulationResult.setProjectId(params.getProjectId());
        formulationResult.setFormulationCode(params.getFormulationCode());
        formulationResult.setFormulationName(params.getFormulationName());
        formulationResult.setFormulationMaterialCost(result.getResultValue());
        formulationResult.setProgrammingStatus(result.getStatus().toString());
        //构造配方原料关系
        List<FormulationMaterial> formulationMaterialList = getFormulationMaterials(materialList, result);
        formulationResult.setFormulationMaterials(formulationMaterialList);
        //构造配方营养关系
        List<FormulationNutrition> formulationNutritionList = getFormulationNutritions(nutritionStandardLeftBoundList, nutritionStandardRightBoundList, nutritionStandard, fields, result);
        formulationResult.setFormulationNutritions(formulationNutritionList);

        return new Response(formulationResult, HttpStatus.OK.value(), "配方规划结果");
    }

    private void getConstraintLists(List<Material> materialList, Field[] fields, List<List<Double>> constraintLists) {
        for (int i = 0; i < fields.length; i++) {

            //针对每一个营养标准指标构造约束方程
            Field field = fields[i];
            int materialSize = materialList.size();

            if (field.isAnnotationPresent(NutritionIndicator.class)) {

                NutritionIndicator annotation = field.getAnnotation(NutritionIndicator.class);
                if (annotation.isIndicator() && BigDecimal.class.equals(field.getType())) {
                    List<Double> coefficientList = new ArrayList<Double>();
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
        }
    }

    private List<FormulationMaterial> getFormulationMaterials(List<Material> materialList, LinearProgrammingResult result) {
        List<FormulationMaterial> formulationMaterialList = new ArrayList<FormulationMaterial>();
        List<Double> resultValue = result.getVariableValueList();

        //TODO decimalFormat改为单例模式
        //DecimalFormat decimalFormat = new DecimalFormat("0.000000");
        DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();
        for (int i = 0; i < resultValue.size(); i++) {
            FormulationMaterial formulationMaterial = new FormulationMaterial();
            Material material = materialList.get(i);
            formulationMaterial.setMaterialId(material.getId());
            formulationMaterial.setOptimalRatio(BigDecimal.valueOf(resultValue.get(i)));
            formulationMaterial.setMaterialName(material.getMaterialName());
            formulationMaterial.setMaterialPrice(material.getMaterialPrice());
            String ponderanceTon = decimalFormat.format(resultValue.get(i) * 100 * 10);
            formulationMaterial.setPonderanceTon(new BigDecimal(ponderanceTon));
            formulationMaterialList.add(formulationMaterial);
        }
        return formulationMaterialList;
    }

    private List<FormulationNutrition> getFormulationNutritions(List<Double> nutritionStandardLeftBoundList, List<Double> nutritionStandardRightBoundList, NutritionStandard nutritionStandard, Field[] fields, LinearProgrammingResult result) {

        List<String> nutritionNameList = new ArrayList<String>();
        List<Double> nutritionContentIdealList = new ArrayList<Double>();
        Map map = BeanUtil.beanToMap(nutritionStandard);
        //从注解中获取指标名以及被注解的字段的值
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            if (field.isAnnotationPresent(NutritionIndicator.class)) {
                NutritionIndicator annotation = field.getAnnotation(NutritionIndicator.class);
                if (annotation.isIndicator() && BigDecimal.class.equals(field.getType())) {
                    nutritionNameList.add(field.getAnnotation(NutritionIndicator.class).name());
                    BigDecimal value = (BigDecimal) map.get(field.getName());
                    if (value != null) {
                        nutritionContentIdealList.add(value.doubleValue());
                    } else {
                        nutritionContentIdealList.add(-1D);
                    }
                }

            }
        }

        List<FormulationNutrition> formulationNutritionList = new ArrayList<FormulationNutrition>();
        List<Double> constraintFunctionValueList = result.getConstraintFunctionValueList();
        for (int i = 0; i < constraintFunctionValueList.size(); i++) {
            FormulationNutrition formulationNutrition = new FormulationNutrition();
            formulationNutrition.setNutritionIndicatorName(nutritionNameList.get(i));
            formulationNutrition.setNutritionContentActual(BigDecimal.valueOf(constraintFunctionValueList.get(i)));
            formulationNutrition.setNutritionContentIdeal(BigDecimal.valueOf(nutritionContentIdealList.get(i)));
            formulationNutrition.setNutritionContentLowBound(BigDecimal.valueOf(nutritionStandardLeftBoundList.get(i)));
            formulationNutrition.setNutritionContentHighBound(BigDecimal.valueOf(nutritionStandardRightBoundList.get(i)));

            formulationNutritionList.add(formulationNutrition);
        }
        return formulationNutritionList;
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
        int resultFormulation = formulationMapper.insertSelective(formulation);

        //2.更新配方原料关系
        Integer formulationId = formulation.getId();
        List<FormulationMaterial> formulationMaterialList = result.getFormulationMaterials();

        for (int i = 0; i < formulationMaterialList.size(); i++) {
            FormulationMaterial formulationMaterial = formulationMaterialList.get(i);

            formulationMaterial.setId(UUIDUtil.get32UUIDLowerCase());
            formulationMaterial.setFormulationId(formulationId);
        }
        int resultMaterial = formulationMaterialMapper.insertBatch(formulationMaterialList);

        //3.更新配方营养关系
        List<FormulationNutrition> formulationNutritionList = result.getFormulationNutritions();
        for (int i = 0; i < formulationNutritionList.size(); i++) {
            FormulationNutrition formulationNutrition = formulationNutritionList.get(i);

            formulationNutrition.setId(UUIDUtil.get32UUIDLowerCase());
            formulationNutrition.setFormulationId(formulationId);
        }
        int resultNutrition = formulationNutritionMapper.insertBatch(formulationNutritionList);
        if (resultFormulation > 0 && resultMaterial > 0 && resultNutrition > 0) {
            return new Response(HttpStatus.OK.value(), "新增配方成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "新增配方失败");
        }
    }
}
