package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.UserPermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserPermissionMapper {
    int insert(UserPermission record);

    int insertSelective(UserPermission record);

    List<UserPermission> selectByUserIdAndProjectId(@Param("userId") String userId, @Param("projectId") String projectId);
}