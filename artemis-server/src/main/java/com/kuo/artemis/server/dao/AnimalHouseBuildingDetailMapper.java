package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalHouseBuildingDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalHouseBuildingDetailMapper {
    List<AnimalHouseBuildingDetail> selectByProjectId(@Param("projectId") Integer projectId);

    List<AnimalHouseBuildingDetail> selectByHouseId(@Param("houseId") Integer houseId);

    AnimalHouseBuildingDetail selectByAnimalId(@Param("animalId") String animalId);

    int insert(AnimalHouseBuildingDetail record);

    int insertSelective(AnimalHouseBuildingDetail record);
}