package com.kuo.artemis.server.dao;


import com.kuo.artemis.server.entity.AnimalRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalRecordMapper {
    int insert(AnimalRecord record);

    int insertSelective(AnimalRecord record);

    List<AnimalRecord> selectSelective(@Param("list") List<String> columns, @Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier, @Param("version") Integer version);


}