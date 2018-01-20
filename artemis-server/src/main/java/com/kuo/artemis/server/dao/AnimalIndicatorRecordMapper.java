package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalIndicatorRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalIndicatorRecordMapper {
    int insert(AnimalIndicatorRecord record);

    int insertSelective(AnimalIndicatorRecord record);

    int selectLastestVersion(@Param("projectId") String projectId);

    List<AnimalIndicatorRecord> selectSelective(@Param("list") List<String> columns, @Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier, @Param("version") Integer verison);

    List<AnimalIndicatorRecord> selectRecordsDetail(@Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifer, @Param("version") Integer version);
}