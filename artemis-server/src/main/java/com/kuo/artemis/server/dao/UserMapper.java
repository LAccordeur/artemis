package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    User selectByEntity(User user);

    User selectByPhone(@Param("userPhone") String userPhone);

    User selectById(@Param("userId") Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}