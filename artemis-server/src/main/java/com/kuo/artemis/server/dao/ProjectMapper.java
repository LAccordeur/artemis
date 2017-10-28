package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Project;
import org.springframework.stereotype.Component;


@Component
public interface ProjectMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);
}