package com.kuo.artemis.server.service;


import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.Material;

/**
 * @author guoyang  TODO
 * @Description
 */
public interface MaterialService {

    /**
     * 获取课题负责人的所有原料
     * @param userId
     * @return
     */
    Response listMaterials(String userId);


    /**
     * 获取某个原料的详细信息
     * @param materialId
     * @return
     */
    Response getMaterialDetail(String materialId);

    /**
     * 更新原料信息
     * @param material
     * @return
     */
    Response updateMaterialDetail(Material material);

    /**
     * 删除某个原料
     * @param materialId
     * @return
     */
    Response deleteMaterial(String materialId);


    /**
     * 生成一个新原料
     * @param material
     * @return
     */
    Response createNewMaterial(Material material);
}
