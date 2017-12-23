package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.NutritionStandard;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NutritionStandardMapper {

    List<NutritionStandard> selectBaseNutritionStandards();

    int deleteByPrimaryKey(Integer id);

    int insert(NutritionStandard record);

    int insertSelective(NutritionStandard record);

    //int insertBatch(@Param("list") List<NutritionStandard> nutritionStandardList, @Param("userId") Integer userId);
    int insertBatch(@Param("list") List<NutritionStandard> nutritionStandardList);

    List<NutritionStandard> selectByUserId(@Param("userId") Integer userId);

    List<NutritionStandard> selectBriefByUserId(@Param("userId") Integer userId);

    NutritionStandard selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NutritionStandard record);

    int updateByPrimaryKey(NutritionStandard record);
}