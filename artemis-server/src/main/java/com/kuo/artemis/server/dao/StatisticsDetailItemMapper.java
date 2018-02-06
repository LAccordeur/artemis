package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.StatisticsDetailItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StatisticsDetailItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StatisticsDetailItem record);

    int insertSelective(StatisticsDetailItem record);

    StatisticsDetailItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StatisticsDetailItem record);

    int updateByPrimaryKey(StatisticsDetailItem record);

    Integer insertBatch(List<StatisticsDetailItem> statisticsDetailItemList);

    List<String> selectTreatmentCodes(@Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier, @Param("version") Integer version);

    List<Double> selectTreatmentData(@Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier, @Param("version") Integer version, @Param("treatmentCode") String treatmentCode, @Param("indicatorName") String indicatorName);

}