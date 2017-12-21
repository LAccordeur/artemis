package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.*;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.ProjectService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :处理建立课题、更新课题、获取课题信息相关的任务
 * @Date : Created on 2017/10/30
 */
@Service
@Transactional
public class ProjectServiceImpl implements ProjectService {

    @Inject
    private ProjectMapper projectMapper;

    @Inject
    private UserProjectMapper userProjectMapper;

    @Inject
    private RoleMapper roleMapper;

    @Inject
    private RolePermissionMapper rolePermissionMapper;

    @Inject
    private PermissionMapper permissionMapper;

    @Inject
    private UserRoleMapper userRoleMapper;

    @Inject
    private UserMapper userMapper;


    /**
     * 创建一个课题
     * @param project
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response createProject(Project project) {

        Response response = new Response();


        Integer userId = project.getProjectAdminId();
        //创建课题以及一系列的级联操作
        //1.创建课题
        if (userId != null) {
            String adminName = userMapper.selectById(userId).getUserName();
            project.setProjectAdminName(adminName);
        }
        projectMapper.insertSelective(project);
        //2.创建用户课题关系
        Integer newProjectId = project.getId();
        userProjectMapper.insertUserProjectByCreate(new UserProjectKey(userId, newProjectId));
        //3.创建角色
        Role role = new Role(newProjectId, "课题负责人", 0);
        roleMapper.insertSelective(role);
        Integer newRoleId = role.getId();

        //4.创建角色权限关系
        List<Integer> permissionIdList = permissionMapper.selectPermissionIdList();
        List<RolePermissionKey> rolePermissionList = new ArrayList<RolePermissionKey>();
        for (Integer id : permissionIdList) {
            RolePermissionKey rolePermissionKey = new RolePermissionKey();
            rolePermissionList.add(rolePermissionKey);
            rolePermissionKey.setRoleId(newRoleId);
            rolePermissionKey.setPermissionId(id);
        }

        /*RolePermission rolePermission = new RolePermission();
        rolePermission.setPermissionId(1);
        rolePermission.setRoleId(1);
        rolePermissionMapper.insertSelective(rolePermission);*/


        rolePermissionMapper.insertBatch(rolePermissionList);
        //5.创建用户角色关系
        int result = userRoleMapper.insertSelective(new UserRole(userId, newRoleId));


        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("创建课题成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.FORBIDDEN.value());
            response.setMsg("创建课题失败");
        }



        return response;
    }


    /**
     * 通过课题id获取课题的详细信息
     * @param projectId
     * @return
     */
    public Response getProjectInfoById(String projectId) {

        Response response = new Response();


        Project data = projectMapper.selectByPrimaryKey(Integer.parseInt(projectId));

        if (data != null) {
            response.setData(data);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("获取课题信息成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.FORBIDDEN.value());
            response.setMsg("获取课题信息失败");
        }


        return response;
    }

    /**
     * 更新课题信息
     * @param project
     * @return
     */
    public Response updateProjectInfoById(Project project) {
        Response response = new Response();


        int result = projectMapper.updateByPrimaryKeySelective(project);

        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("更新课题信息成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.FORBIDDEN.value());
            response.setMsg("更新课题信息失败");
        }

        return response;
    }


}
