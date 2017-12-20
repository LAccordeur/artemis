package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.BuildingRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BuildingRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BuildingRecord record);

    int insertSelective(BuildingRecord record);

    List<BuildingRecord> selectByProjectId(@Param("projectId") Integer projectId);

    BuildingRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BuildingRecord record);

    int updateByPrimaryKey(BuildingRecord record);
}