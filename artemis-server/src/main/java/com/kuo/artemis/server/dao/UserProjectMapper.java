package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.UserProjectKey;
import org.springframework.stereotype.Component;

@Component
public interface UserProjectMapper {
    int deleteByPrimaryKey(UserProjectKey key);

    int insert(UserProjectKey record);

    int insertSelective(UserProjectKey record);
}