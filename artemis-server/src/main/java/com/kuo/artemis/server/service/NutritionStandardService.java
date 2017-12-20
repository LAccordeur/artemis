package com.kuo.artemis.server.service;


import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.NutritionStandard;

/**
 * @author guoyang  TODO
 */
public interface NutritionStandardService {

    /**
     * 列出某个人建立的营养指标
     * @param userId
     * @return
     */
    Response listNutritionStandards(String userId);

    /**
     * 获取详细信息
     * @param nutritionStandardId
     * @return
     */
    Response getNutritionStandardDetail(String nutritionStandardId);

    /**
     * 更新指标详细信息
     * @param nutritionStandard
     * @return
     */
    Response updateNutritionStandardDetail(NutritionStandard nutritionStandard);

    /**
     * 删除某个营养指标
     * @param nutritionStandardId
     * @return
     */
    Response deleteNutritionStandard(String nutritionStandardId);

    /**
     * 创建一个新的营养指标
     * @param nutritionStandard
     * @return
     */
    Response createNewNutritionStandard(NutritionStandard nutritionStandard);
}