package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalBuilding;

public interface AnimalBuildingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalBuilding record);

    int insertSelective(AnimalBuilding record);

    AnimalBuilding selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalBuilding record);

    int updateByPrimaryKey(AnimalBuilding record);
}