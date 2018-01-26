package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalGrowthIndicatorRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalGrowthIndicatorRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalGrowthIndicatorRecord record);

    int insertSelective(AnimalGrowthIndicatorRecord record);

    AnimalGrowthIndicatorRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalGrowthIndicatorRecord record);

    int updateByPrimaryKey(AnimalGrowthIndicatorRecord record);

    int insertBatch(List records);

    int updateBatch(List records);

    int deleteByProjectIdAndFileIdentifierAndVersion(@Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier, @Param("version") Integer version);
}