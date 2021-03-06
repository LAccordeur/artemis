package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FormulationAnimal;
import com.kuo.artemis.server.entity.FormulationAnimalKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FormulationAnimalMapper {
    int deleteByPrimaryKey(FormulationAnimalKey key);

    int insertBatch(List<FormulationAnimal> formulationAnimalList);

    int insert(FormulationAnimal record);

    int insertSelective(FormulationAnimal record);

    Integer selectAnimalIdByFormulationId(@Param("formulationId") Integer formulationId);

    FormulationAnimal selectByPrimaryKey(FormulationAnimalKey key);

    int updateByPrimaryKeySelective(FormulationAnimal record);

    int updateByPrimaryKey(FormulationAnimal record);
}