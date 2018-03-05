package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.dto.excel.DataImportDTO;
import com.kuo.artemis.server.core.exception.DataException;
import com.kuo.artemis.server.core.helper.DataHelper;
import com.kuo.artemis.server.dao.MaterialMapper;
import com.kuo.artemis.server.entity.Material;
import com.kuo.artemis.server.service.MaterialService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/20
 */
@Service
public class MaterialServiceImpl implements MaterialService {

    @Inject
    private MaterialMapper materialMapper;

    public Response listMaterials(String userId) {
        if (userId == null || "".equals(userId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        List<Material> materialList = materialMapper.selectByUserId(Integer.valueOf(userId));
        //List<List<String>> data = DataHelper.objectListToArrayList(materialList);
        if (materialList == null || materialList.size() == 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "原料列表为空");
        }
        return new Response(materialList, HttpStatus.OK.value(), "获取原料列表成功");
    }

    public Response listMaterialsBrief(String userId) {
        if (userId == null || "".equals(userId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        List<Material> materialList = materialMapper.selectBriefByUserId(Integer.valueOf(userId));
        if (materialList == null || materialList.size() == 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "原料列表为空");
        }

        return new Response(materialList, HttpStatus.OK.value(), "获取原料简略列表成功");
    }

    public Response getMaterialDetail(String materialId) {
        if (materialId == null || "".equals(materialId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        Material material = materialMapper.selectByPrimaryKey(Integer.valueOf(materialId));

        return new Response(material, HttpStatus.OK.value(), "获取原料成功");
    }

    public Response updateMaterialDetail(Material material, String userId) {
        if (userId == null || "".equals(userId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        material.setUserId(Integer.valueOf(userId));
        int result = materialMapper.updateByPrimaryKeySelective(material);

        Material newMaterial = materialMapper.selectByPrimaryKey(material.getId());
        if (result > 0) {
            return new Response(newMaterial, HttpStatus.OK.value(), "更新原料成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "更新原料失败");
        }
    }

    public Response deleteMaterial(String materialId) {
        if (materialId == null || "".equals(materialId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        int result = materialMapper.deleteByPrimaryKey(Integer.valueOf(materialId));

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "删除原料成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "删除原料失败");
        }
    }

    public Response createNewMaterial(Material material, String userId) {
        if (userId == null || "".equals(userId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        material.setUserId(Integer.valueOf(userId));
        int result = materialMapper.insert(material);


        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "创建新原料成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "创建新原料失败");
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public Response createNewMaterialBatch(DataImportCommand dataImportCommand) throws DataException {

        List<List<String>> materialList = dataImportCommand.getDataList();
        String userId = dataImportCommand.getUserId();

        //将二维数组类型的数据进行转换并组装
        DataImportDTO dataImportDTO = DataHelper.excelDataToBean(materialList, Material.class, 0, 1);
        List objectList = dataImportDTO.getCommonList();
        for (int i = 0; i < objectList.size(); i++) {
            Material material = (Material) objectList.get(i);
            material.setUserId(Integer.valueOf(userId));
        }

        //剔除重复数据并增加新添数据
        List<Material> dbMaterialList = materialMapper.selectByUserId(Integer.valueOf(userId));
        Boolean removeResult = objectList.removeAll(dbMaterialList);
        if (removeResult && objectList != null && objectList.size() == 0) {
            return new Response(dbMaterialList, HttpStatus.NO_CONTENT.value(), "请勿添加重复数据");
        }

        int result = materialMapper.insertBatch(objectList);

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "新增原料成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "新增原料失败");
        }

    }


}
