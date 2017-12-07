package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FileRecord;

public interface FileRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FileRecord record);

    int insertSelective(FileRecord record);

    FileRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FileRecord record);

    int updateByPrimaryKey(FileRecord record);
}