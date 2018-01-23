package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.ProjectDetail;
import org.apache.ibatis.annotations.Param;

public interface ProjectDetailMapper {
    ProjectDetail selectByProjectId(@Param("projectId") Integer projectId);

    int deleteByPrimaryKey(Integer id);

    int insert(ProjectDetail record);

    int insertSelective(ProjectDetail record);

    ProjectDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectDetail record);

    int updateByPrimaryKey(ProjectDetail record);

    int deleteByProjectId(@Param("projectId") Integer projectId);
}