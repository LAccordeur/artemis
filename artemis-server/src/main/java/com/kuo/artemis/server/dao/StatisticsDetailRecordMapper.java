package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.StatisticsDetailRecord;

public interface StatisticsDetailRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StatisticsDetailRecord record);

    int insertSelective(StatisticsDetailRecord record);

    StatisticsDetailRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StatisticsDetailRecord record);

    int updateByPrimaryKey(StatisticsDetailRecord record);
}