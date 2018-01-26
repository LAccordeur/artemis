package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalBreedingIndicatorRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalBreedingIndicatorRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalBreedingIndicatorRecord record);

    int insertSelective(AnimalBreedingIndicatorRecord record);

    AnimalBreedingIndicatorRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalBreedingIndicatorRecord record);

    int updateByPrimaryKey(AnimalBreedingIndicatorRecord record);

    int insertBatch(List records);

    int updateBatch(List records);

    int deleteByProjectIdAndFileIdentifierAndVersion(@Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier, @Param("version") Integer version);
}