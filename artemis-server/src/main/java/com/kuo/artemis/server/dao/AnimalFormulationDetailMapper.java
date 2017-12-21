package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalFormulationDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimalFormulationDetailMapper {
    List<AnimalFormulationDetail> selectByProjectId(@Param("projectId") Integer projectId);

    List<AnimalFormulationDetail> selectAnimalByFormulationId(@Param("projectId") Integer formulationId);

    int insert(AnimalFormulationDetail record);

    int insertSelective(AnimalFormulationDetail record);
}