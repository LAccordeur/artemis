package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Formulation;
import org.apache.ibatis.annotations.Param;
import sun.misc.FormattedFloatingDecimal;

import java.util.List;

public interface FormulationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Formulation record);

    int insertSelective(Formulation record);

    List<Formulation> selectByProjectId(@Param("projectId") Integer projectId);

    Integer selectIdByFormulationName(@Param("formulationName") String formulationName);

    List<Formulation> selectFormulationNamesByProjectId(@Param("projectId") Integer projectId);

    Formulation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Formulation record);

    int updateByPrimaryKey(Formulation record);
}