package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Authority;
import org.springframework.stereotype.Component;


@Component
public interface AuthorityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Authority record);

    int insertSelective(Authority record);

    Authority selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Authority record);

    int updateByPrimaryKey(Authority record);
}