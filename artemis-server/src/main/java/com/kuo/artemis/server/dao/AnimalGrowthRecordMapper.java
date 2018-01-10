package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalGrowthRecord;

import java.util.List;

public interface AnimalGrowthRecordMapper extends BaseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalGrowthRecord record);

    int insertSelective(AnimalGrowthRecord record);

    AnimalGrowthRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalGrowthRecord record);

    int updateByPrimaryKey(AnimalGrowthRecord record);

    int insertBatch(List rows);

    int updateBatch(List rows);
}