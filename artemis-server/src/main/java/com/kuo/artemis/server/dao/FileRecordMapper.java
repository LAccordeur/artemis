package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FileRecord;
import org.apache.ibatis.annotations.Param;

import java.io.File;
import java.util.List;

public interface FileRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FileRecord record);

    int insertSelective(FileRecord record);

    FileRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FileRecord record);

    int updateByPrimaryKey(FileRecord record);

    List<FileRecord> selectIndicatorRecordFiles(@Param("projectId") Integer projectId);

    List<FileRecord> selectIndicatorRecordFileVersions(@Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier);

    int selectLastestVersion(@Param("projectId") Integer projectId, @Param("fileIdentifier") String fileIdentifier);

    int selectIdByFileIdentifierAndVersion(@Param("fileIdentifier") String fileIdentifier, @Param("version") Integer version);
}