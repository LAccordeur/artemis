package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalHouse;

public interface AnimalHouseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalHouse record);

    int insertSelective(AnimalHouse record);

    AnimalHouse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalHouse record);

    int updateByPrimaryKey(AnimalHouse record);
}