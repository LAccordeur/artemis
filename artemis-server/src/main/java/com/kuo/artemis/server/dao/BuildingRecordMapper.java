package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.BuildingRecord;

public interface BuildingRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BuildingRecord record);

    int insertSelective(BuildingRecord record);

    BuildingRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BuildingRecord record);

    int updateByPrimaryKey(BuildingRecord record);
}