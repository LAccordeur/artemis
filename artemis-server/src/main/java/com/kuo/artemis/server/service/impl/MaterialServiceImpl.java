package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.MaterialMapper;
import com.kuo.artemis.server.entity.Material;
import com.kuo.artemis.server.service.MaterialService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

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
        List<Material> materialList = materialMapper.selectByUserId(Integer.valueOf(userId));

        return new Response(materialList, HttpStatus.OK.value(), "获取原料列表成功");
    }

    public Response listMaterialsBrief(String userId) {
        List<Material> materialList = materialMapper.selectBriefByUserId(Integer.valueOf(userId));

        return new Response(materialList, HttpStatus.OK.value(), "获取原料简略列表成功");
    }

    public Response getMaterialDetail(String materialId) {
        Material material = materialMapper.selectByPrimaryKey(Integer.valueOf(materialId));

        return new Response(material, HttpStatus.OK.value(), "获取原料成功");
    }

    public Response updateMaterialDetail(Material material, String userId) {

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
        int result = materialMapper.deleteByPrimaryKey(Integer.valueOf(materialId));

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "删除原料成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "删除原料失败");
        }
    }

    public Response createNewMaterial(Material material, String userId) {

        material.setUserId(Integer.valueOf(userId));
        int result = materialMapper.insert(material);

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "创建新原料成功");
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "创建新原料失败");
        }
    }
}
