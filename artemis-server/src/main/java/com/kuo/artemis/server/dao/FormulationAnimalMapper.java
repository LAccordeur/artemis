package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FormulationAnimal;
import com.kuo.artemis.server.entity.FormulationAnimalKey;

public interface FormulationAnimalMapper {
    int deleteByPrimaryKey(FormulationAnimalKey key);

    int insert(FormulationAnimal record);

    int insertSelective(FormulationAnimal record);

    FormulationAnimal selectByPrimaryKey(FormulationAnimalKey key);

    int updateByPrimaryKeySelective(FormulationAnimal record);

    int updateByPrimaryKey(FormulationAnimal record);
}