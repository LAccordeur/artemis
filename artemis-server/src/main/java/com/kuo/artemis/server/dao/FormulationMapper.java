package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Formulation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FormulationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Formulation record);

    int insertSelective(Formulation record);

    List<Formulation> selectByProjectId(@Param("projectId") Integer projectId);

    Integer selectIdByFormulationName(@Param("formulationName") String formulationName);

    List<String> selectFormulationNamesByProjectId(@Param("projectId") String projectId);

    Formulation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Formulation record);

    int updateByPrimaryKey(Formulation record);
}