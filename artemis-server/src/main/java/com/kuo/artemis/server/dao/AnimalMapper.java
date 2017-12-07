package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Animal;

public interface AnimalMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Animal record);

    int insertSelective(Animal record);

    Animal selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Animal record);

    int updateByPrimaryKey(Animal record);
}