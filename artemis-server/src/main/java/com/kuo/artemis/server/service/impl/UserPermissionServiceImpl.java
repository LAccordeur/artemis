package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.UserPermissionDTO;
import com.kuo.artemis.server.core.dto.command.UpdatePermissionCommend;
import com.kuo.artemis.server.dao.PermissionMapper;
import com.kuo.artemis.server.dao.RolePermissionMapper;
import com.kuo.artemis.server.dao.UserPermissionMapper;
import com.kuo.artemis.server.dao.UserProjectMapper;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.UserPermissionService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.ArrayList;
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

    @Inject
    private PermissionMapper permissionMapper;

    @Inject
    private UserProjectMapper userProjectMapper;

    /**
     * 获取某个用户在某个课题下的所有权限(只返回拥有的权限名)
     *
     * @param userId
     * @param projectId
     * @return
     */
    public Response listUserPermissionsByUserIdAndProjectId(String userId, String projectId) {

        Response response = new Response<List<UserPermission>>();
        UserPermissionDTO userPermissionDTO = new UserPermissionDTO();
        List<Permission> resultPermissions = new ArrayList<Permission>();
        userPermissionDTO.setPermissions(resultPermissions);


        List<UserPermission> permissions = null;
        if (userId != null && projectId != null) {
            permissions = userPermissionMapper.selectByUserIdAndProjectId(Integer.valueOf(userId), Integer.valueOf(projectId));
        }

        for (UserPermission userPermission : permissions) {
            userPermissionDTO.setUserId(String.valueOf(userPermission.getUserId()));
            userPermissionDTO.setUserName(userPermission.getUserName());
            userPermissionDTO.setProjectId(String.valueOf(userPermission.getProjectId()));
            userPermissionDTO.setRoleId(String.valueOf(userPermission.getRoleId()));
            userPermissionDTO.setRoleName(userPermission.getRoleName());

            Permission permission = new Permission();
            resultPermissions.add(permission);
            permission.setPermissionName(userPermission.getPermissionName());
            permission.setPermissionNameEnglish(userPermission.getPermissionNameEnglish());
            permission.setId(userPermission.getPermissionId());

        }


        response.setData(userPermissionDTO);
        response.setCode(HttpStatus.OK.value());
        response.setMsg("权限列表");

        return response;
    }

    /**
     * 返回某个用户在某个课题下的权限列表以boolean类型
     *
     * @param userId
     * @param projectId
     * @return
     */
    public Response listUserPermissionsByUserIdAndProjectIdWithBoolean(String userId, String projectId) {
        Response response = new Response();


        //根据用户名和课题名查找roleID
        UserProjectKey key = new UserProjectKey(Integer.valueOf(userId), Integer.valueOf(projectId));
        UserProject userProject = userProjectMapper.selectMemberByProjectIdAndUserId(key);
        UserPermissionDTO userPermissionDTO = getUserPermissionDTO(userProject);


        response.setData(userPermissionDTO);
        response.setCode(HttpStatus.OK.value());
        response.setMsg("成员权限信息");


        return response;
    }

    private UserPermissionDTO getUserPermissionDTO(UserProject userProject) {
        //根据id查找用户的权限
        List<RolePermission> permissions = rolePermissionMapper.selectPermissionsByRoleId(userProject.getRoleId());
        //组装
        UserPermissionDTO userPermissionDTO = new UserPermissionDTO();
        userPermissionDTO.setUserName(userProject.getUserName());
        userPermissionDTO.setUserId(String.valueOf(userProject.getUserId()));
        userPermissionDTO.setRoleId(String.valueOf(userProject.getRoleId()));
        userPermissionDTO.setRoleName(userProject.getRoleName());
        userPermissionDTO.setProjectId(String.valueOf(userProject.getProjectId()));
        userPermissionDTO.setPermissions(permissions);
        return userPermissionDTO;
    }


    /**
     * 获取某个课题下所有成员的所有权限（只返回拥有的权限名）
     *
     * @param projectId
     * @return
     */
    public Response listUserPermissionsByProjectId(String projectId) {

        Response response = new Response();
        List<UserPermission> permissions = null;
        List<UserPermissionDTO> results = new ArrayList<UserPermissionDTO>();


        if (projectId != null) {
            permissions = userPermissionMapper.selectByProjectId(Integer.valueOf(projectId));
        }

        List<List<UserPermission>> userLists = new ArrayList<List<UserPermission>>();
        List<Integer> indexList = new ArrayList<Integer>();

        //对返回的权限集按用户id进行分类
        //1.获取分界线处的索引
        indexList.add(0);
        for (int i = 0; i < permissions.size(); i++) {
            UserPermission userPermission = permissions.get(i);
            if (i < permissions.size() - 1) {
                if (userPermission.getUserId() != (permissions.get(i + 1)).getUserId()) {
                    indexList.add(i + 1);
                }
            }
        }
        indexList.add(permissions.size());

        //2.分成n个子List
        for (int i = 0; i < indexList.size() - 1; i++) {
            userLists.add(permissions.subList(indexList.get(i), indexList.get(i + 1)));
        }

        //3.组装子List
        for (List<UserPermission> userList : userLists) {
            UserPermissionDTO result = new UserPermissionDTO();
            List<Permission> permissionList = new ArrayList<Permission>();
            result.setPermissions(permissionList);
            result.setUserId(String.valueOf(userList.get(0).getUserId()));
            result.setUserName(userList.get(0).getUserName());
            result.setRoleId(String.valueOf(userList.get(0).getRoleId()));
            result.setRoleName(userList.get(0).getRoleName());
            result.setProjectId(String.valueOf(userList.get(0).getProjectId()));
            results.add(result);
            for (UserPermission userPermission : userList) {
                Permission permission = new Permission();
                permissionList.add(permission);
                permission.setId(userPermission.getPermissionId());
                permission.setPermissionName(userPermission.getPermissionName());
                permission.setPermissionNameEnglish(userPermission.getPermissionNameEnglish());

            }
        }


        if (permissions != null) {
            response.setData(results);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("权限列表");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("权限列表为空");
        }


        return response;
    }


    /**
     * 获取某个课题下所有成员的所有权限(以boolean形式)
     *
     * @param projectId
     * @return
     */
    public Response listUserPermissionsByProjectIdWithBoolean(String projectId) {
        Response response = new Response();
        List<UserPermissionDTO> data = new ArrayList<UserPermissionDTO>();
        response.setData(data);


        List<UserProject> userProjects = userProjectMapper.selectMembersByProjectId(Integer.valueOf(projectId));
        for (UserProject userProject : userProjects) {
            UserPermissionDTO userPermissionDTO = getUserPermissionDTO(userProject);
            data.add(userPermissionDTO);
        }

        response.setCode(HttpStatus.OK.value());
        response.setMsg("课题成员权限信息");


        return response;
    }


    /**
     * 根据用户Id获取权限列表
     * @param userId
     * @return
     */
    /*public Response listUserPermissionsByUserId(String userId) {
        Response response = new Response();
        List<UserPermission> permissions = null;

        try {
            if (userId != null) {
                permissions = userPermissionMapper.selectByUserId(Integer.valueOf(userId));
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
    }*/

    /**
     * 授予权限
     *
     * @param rolePermissionKey
     * @return
     */
    public Response addPermission(RolePermissionKey rolePermissionKey) {
        Response response = new Response();

        String roleId = String.valueOf(rolePermissionKey.getRoleId());
        String permissionId = String.valueOf(rolePermissionKey.getPermissionId());

        int result = 0;
        RolePermission rolePermission = new RolePermission();


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


        return response;
    }

    /**
     * 移除用户的某个权限
     *
     * @param rolePermissionKey
     * @return
     */
    public Response removePermission(RolePermissionKey rolePermissionKey) {
        Response response = new Response();
        int result = 0;
        String roleId = String.valueOf(rolePermissionKey.getRoleId());
        String permissionId = String.valueOf(rolePermissionKey.getPermissionId());

        RolePermission rolePermission = new RolePermission();


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


        return response;
    }


    /**
     * 批量更新用户的权限
     *
     * @param updatePermissionCommend
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response updatePermissionBatch(UpdatePermissionCommend updatePermissionCommend) {
        Response response = new Response();
        int result = 0;

        String roleId = updatePermissionCommend.getRoleId();
        List<Integer> permissionIds = updatePermissionCommend.getPermissionIds();


        Integer intRoleId;
        //1.删除当前的角色权限关系
        if (roleId != null) {
            intRoleId = Integer.valueOf(roleId);
            rolePermissionMapper.deleteByRoleId(intRoleId);
        } else {
            return new Response(null, HttpStatus.FORBIDDEN.value(), "缺少参数");
        }

        //2.插入新的权限关系
        List<RolePermissionKey> rolePermissionList = new ArrayList<RolePermissionKey>();
        for (Integer id : permissionIds) {
            RolePermissionKey rolePermissionKey = new RolePermissionKey();
            rolePermissionList.add(rolePermissionKey);
            rolePermissionKey.setRoleId(intRoleId);
            rolePermissionKey.setPermissionId(id);
        }
        result = rolePermissionMapper.insertBatch(rolePermissionList);

        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("权限更新成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.FORBIDDEN.value());
            response.setMsg("权限更新失败");
        }


        return response;
    }


    /**
     * 获取所有的权限列表
     *
     * @return
     */
    public Response listPermissions() {
        Response response = new Response();


        List<Permission> permissions = permissionMapper.selectPermissionList();

        if (permissions != null) {
            response.setData(permissions);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("权限列表获取成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("权限列表为空");
        }


        return response;
    }
}
