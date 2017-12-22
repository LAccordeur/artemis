package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalIndicator;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalIndicatorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AnimalIndicator record);

    int insertSelective(AnimalIndicator record);

    AnimalIndicator selectByPrimaryKey(Integer id);

    List<AnimalIndicator> selectByFields(List<String> indicatorEnglishNames);

    List<AnimalIndicator> selectByPrimaryKeys(List<String> ids);

    int updateByPrimaryKeySelective(AnimalIndicator record);

    int updateByPrimaryKey(AnimalIndicator record);
}