package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Permission;

import java.util.List;

public interface PermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);

    List<Integer> selectPermissionIdList();

    List<Integer> selectViewPermissionIdList();

    List<Permission> selectPermissionList();
}