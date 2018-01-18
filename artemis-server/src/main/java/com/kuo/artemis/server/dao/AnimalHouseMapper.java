package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalHouse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalHouseMapper {
    int deleteByPrimaryKey(Integer id);

    int insertBatch(List<AnimalHouse> animalHouseList);

    int insert(AnimalHouse record);

    int insertSelective(AnimalHouse record);

    List<AnimalHouse> selectByProjectId(@Param("projectId") Integer projectId);

    AnimalHouse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AnimalHouse record);

    int updateByPrimaryKey(AnimalHouse record);
}