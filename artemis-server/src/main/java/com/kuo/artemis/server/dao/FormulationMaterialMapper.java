package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FormulationMaterial;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FormulationMaterialMapper {
    int deleteByPrimaryKey(String id);

    int insert(FormulationMaterial record);

    int insertSelective(FormulationMaterial record);

    List<FormulationMaterial> selectByFormulationId(@Param("formulationId") Integer formulationId);

    FormulationMaterial selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(FormulationMaterial record);

    int updateByPrimaryKey(FormulationMaterial record);
}