package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalHouseRelation;

public interface AnimalHouseRelationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalHouseRelation record);

    int insertSelective(AnimalHouseRelation record);

    AnimalHouseRelation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalHouseRelation record);

    int updateByPrimaryKey(AnimalHouseRelation record);
}