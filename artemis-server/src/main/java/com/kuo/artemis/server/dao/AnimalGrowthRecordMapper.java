package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalGrowthRecord;

public interface AnimalGrowthRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalGrowthRecord record);

    int insertSelective(AnimalGrowthRecord record);

    AnimalGrowthRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalGrowthRecord record);

    int updateByPrimaryKey(AnimalGrowthRecord record);
}