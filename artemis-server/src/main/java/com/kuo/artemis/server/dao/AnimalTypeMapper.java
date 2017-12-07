package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalType;

public interface AnimalTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalType record);

    int insertSelective(AnimalType record);

    AnimalType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalType record);

    int updateByPrimaryKey(AnimalType record);
}