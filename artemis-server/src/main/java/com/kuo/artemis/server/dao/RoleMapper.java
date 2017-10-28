package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Role;
import org.springframework.stereotype.Component;

@Component
public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}