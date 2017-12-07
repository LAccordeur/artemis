package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalGutMicrobiotaRecord;

public interface AnimalGutMicrobiotaRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalGutMicrobiotaRecord record);

    int insertSelective(AnimalGutMicrobiotaRecord record);

    AnimalGutMicrobiotaRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalGutMicrobiotaRecord record);

    int updateByPrimaryKey(AnimalGutMicrobiotaRecord record);
}