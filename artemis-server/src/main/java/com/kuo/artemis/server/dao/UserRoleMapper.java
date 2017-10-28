package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.UserRoleKey;
import org.springframework.stereotype.Component;


@Component
public interface UserRoleMapper {
    int deleteByPrimaryKey(UserRoleKey key);

    int insert(UserRoleKey record);

    int insertSelective(UserRoleKey record);
}