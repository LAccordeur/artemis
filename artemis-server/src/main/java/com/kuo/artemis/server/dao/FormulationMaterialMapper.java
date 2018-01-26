package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FormulationMaterial;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FormulationMaterialMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteByFormulationId(@Param("formulationId") Integer formulationId);

    int insert(FormulationMaterial record);

    int insertSelective(FormulationMaterial record);

    List<FormulationMaterial> selectByFormulationId(@Param("formulationId") Integer formulationId);

    int insertBatch(List<FormulationMaterial> formulationMaterials);

    FormulationMaterial selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FormulationMaterial record);

    int updateByPrimaryKey(FormulationMaterial record);
}