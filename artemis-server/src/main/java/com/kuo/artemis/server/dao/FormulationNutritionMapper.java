package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FormulationNutrition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FormulationNutritionMapper {
    int deleteByFormulationId(@Param("formulationId") Integer formulationId);

    int deleteByPrimaryKey(Integer id);

    int insert(FormulationNutrition record);

    int insertSelective(FormulationNutrition record);

    int insertBatch(List<FormulationNutrition> formulationNutritionList);

    FormulationNutrition selectByPrimaryKey(Integer id);

    List<FormulationNutrition> selectByFormulationId(@Param("formulationId") Integer formulationId);

    int updateByPrimaryKeySelective(FormulationNutrition record);

    int updateByPrimaryKey(FormulationNutrition record);
}