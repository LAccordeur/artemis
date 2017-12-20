package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FormulationMaterial;

public interface FormulationMaterialMapper {
    int deleteByPrimaryKey(String id);

    int insert(FormulationMaterial record);

    int insertSelective(FormulationMaterial record);

    FormulationMaterial selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(FormulationMaterial record);

    int updateByPrimaryKey(FormulationMaterial record);
}