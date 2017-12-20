package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.NutritionStandard;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NutritionStandardMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(NutritionStandard record);

    int insertSelective(NutritionStandard record);

    List<NutritionStandard> selectByUserId(@Param("userId") Integer userId);

    NutritionStandard selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NutritionStandard record);

    int updateByPrimaryKey(NutritionStandard record);
}