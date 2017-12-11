package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Animal;

import java.util.List;

public interface AnimalMapper extends BaseMapper {
    int deleteByPrimaryKey(String id);

    int insert(Animal record);

    int insertSelective(Animal record);

    Animal selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Animal record);

    int updateByPrimaryKey(Animal record);

    int insertBatch(List rows);
}