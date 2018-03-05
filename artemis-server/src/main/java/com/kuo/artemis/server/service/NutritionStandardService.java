package com.kuo.artemis.server.service;


import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.exception.DataException;
import com.kuo.artemis.server.entity.NutritionStandard;

import java.util.List;

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
     * 列出某个人建立的营养指标的简略信息
     * @param userId
     * @return
     */
    Response listNutritionStandardsBrief(String userId);

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
    Response updateNutritionStandardDetail(NutritionStandard nutritionStandard, String userId);

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
    Response createNewNutritionStandard(NutritionStandard nutritionStandard, String userId);

    /**
     * 批量导入数据
     * @param command
     * @return
     */
    Response createNutritionStandardsBatch(DataImportCommand command) throws DataException;
}
