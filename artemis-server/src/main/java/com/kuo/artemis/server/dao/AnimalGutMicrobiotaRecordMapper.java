package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalGutMicrobiotaRecord;

import java.util.List;

public interface AnimalGutMicrobiotaRecordMapper extends BaseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalGutMicrobiotaRecord record);

    int insertSelective(AnimalGutMicrobiotaRecord record);

    AnimalGutMicrobiotaRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalGutMicrobiotaRecord record);

    int updateByPrimaryKey(AnimalGutMicrobiotaRecord record);

    int insertBatch(List rows);

    int updateBatch(List rows);
}