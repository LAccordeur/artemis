package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface UserMapper {


    User selectByEntity(User record);

    User selectByPhone(@Param("userPhone") String userPhone);

    int deleteByPrimaryKey(@Param("id") Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(@Param("id") Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}