package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.StatisticsRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StatisticsRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StatisticsRecord record);

    int insertSelective(StatisticsRecord record);

    StatisticsRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StatisticsRecord record);

    int updateByPrimaryKey(StatisticsRecord record);

    List<StatisticsRecord> selectStatisticsRecordByProjectId(@Param("projectId") Integer projectId);

    StatisticsRecord selectStatisticsRecordDetailByRecordId(@Param("statisticsRecordId") Integer staticsRecordId);

    Integer deleteRecordById(@Param("recordId") Integer recordId);
}