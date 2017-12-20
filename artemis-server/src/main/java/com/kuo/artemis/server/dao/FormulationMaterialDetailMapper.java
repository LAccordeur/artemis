package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FormulationMaterialDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FormulationMaterialDetailMapper {

    List<FormulationMaterialDetail> selectByFormulationId(@Param("formulationId") String formulationId);

    int insert(FormulationMaterialDetail record);

    int insertSelective(FormulationMaterialDetail record);
}