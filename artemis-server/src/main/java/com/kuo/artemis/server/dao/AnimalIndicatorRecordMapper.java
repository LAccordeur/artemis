package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalIndicatorRecord;

import java.util.List;

public interface AnimalIndicatorRecordMapper {
    int insert(AnimalIndicatorRecord record);

    int insertSelective(AnimalIndicatorRecord record);

    List<AnimalIndicatorRecord> selectSelective(AnimalIndicatorRecord record);
}