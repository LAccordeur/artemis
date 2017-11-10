package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.RolePermissionMapper;
import com.kuo.artemis.server.dao.UserPermissionMapper;
import com.kuo.artemis.server.entity.RolePermission;
import com.kuo.artemis.server.entity.UserPermission;
import com.kuo.artemis.server.service.UserPermissionService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :处理权限相关包括获取权限列表以及对权限的授予和收回
 * @Date : Created on 2017/10/28
 */
@Service
public class UserPermissionServiceImpl implements UserPermissionService {

    @Inject
    private UserPermissionMapper userPermissionMapper;

    @Inject
    private RolePermissionMapper rolePermissionMapper;

    /**
     * 获取某个用户在某个课题下的所有权限
     * @param userId
     * @param projectId
     * @return
     */
    public Response getUserPermissionByUserIdAndProjectId(String userId, String projectId) {

        Response<List<UserPermission>> response = new Response<List<UserPermission>>();

        try {
            List<UserPermission> permissions = null;
            if (userId != null && projectId != null) {
                permissions = userPermissionMapper.selectByUserIdAndProjectId(Integer.valueOf(userId), Integer.valueOf(projectId));
            }

            if (permissions != null) {
                response.setData(permissions);
                response.setCode(HttpStatus.OK.value());
                response.setMsg("权限列表");
            } else {
                response.setCode(HttpStatus.NO_CONTENT.value());
                response.setMsg("权限列表为空");
                response.setData(null);
            }
        } catch (Exception e) {
            return new Response(e);
        }
        return response;
    }

    /**
     * 获取某个课题下所有成员的所有权限
     * @param projectId
     * @return
     */
    public Response listUserPermissionsByProjectId(String projectId) {

        Response response = new Response();
        List<UserPermission> permissions = null;

        try {
            if (projectId != null) {
                permissions = userPermissionMapper.selectByProjectId(Integer.valueOf(projectId));
            }

            if (permissions != null) {
                response.setData(permissions);
                response.setCode(HttpStatus.OK.value());
                response.setMsg("权限列表");
            } else {
                response.setData(null);
                response.setCode(HttpStatus.NO_CONTENT.value());
                response.setMsg("权限列表为空");
            }
        } catch (Exception e) {
            return new Response(e);
        }

        return response;
    }

    /**
     * 授予权限
     * @param userId
     * @param projectId
     * @param roleId
     * @param permissionId
     * @return
     */
    public Response addPermission(String userId, String projectId, String roleId, String permissionId) {
        Response response = new Response();

        int result = 0;
        RolePermission rolePermission = new RolePermission();

        try {
            if (roleId != null && permissionId != null) {
                rolePermission.setRoleId(Integer.valueOf(roleId));
                rolePermission.setPermissionId(Integer.valueOf(permissionId));
                result = rolePermissionMapper.insertSelective(rolePermission);
            }

            if (result > 0) {
                response.setData(null);
                response.setCode(HttpStatus.OK.value());
                response.setMsg("添加权限成功");
            } else {
                response.setCode(HttpStatus.FORBIDDEN.value());
                response.setMsg("添加权限失败");
                response.setData(null);
            }
        } catch (Exception e) {
            return new Response(e);
        }

        return response;
    }

    public Response removePermission(String userId, String project, String roleId, String permissionId) {
        Response response = new Response();
        int result = 0;

        RolePermission rolePermission = new RolePermission();

        try {
            if (roleId != null && permissionId != null) {
                rolePermission.setRoleId(Integer.valueOf(roleId));
                rolePermission.setPermissionId(Integer.valueOf(permissionId));
                result = rolePermissionMapper.deleteByPrimaryKey(rolePermission);
            }

            if (result > 0) {
                response.setData(null);
                response.setCode(HttpStatus.OK.value());
                response.setMsg("删除权限成功");
            } else {
                response.setCode(HttpStatus.FORBIDDEN.value());
                response.setMsg("删除权限失败");
                response.setData(null);
            }
        } catch (Exception e) {
            return new Response(e);
        }

        return response;
    }

    public Response addPermissionList() {
        return null;
    }

    public Response removePermissionList() {
        return null;
    }
}
