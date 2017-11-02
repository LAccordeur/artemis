package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.RolePermission;
import com.kuo.artemis.server.entity.RolePermissionKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RolePermissionMapper {
    int deleteByPrimaryKey(RolePermissionKey key);

    int deleteByRoleId(@Param("roleId") Integer roleId);

    int insertBatch(List<RolePermissionKey> rolePermissionKeyList);

    int insert(RolePermission record);

    int insertSelective(RolePermission record);

    RolePermission selectByPrimaryKey(RolePermissionKey key);

    int updateByPrimaryKeySelective(RolePermission record);

    int updateByPrimaryKey(RolePermission record);
}