package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.RoleMapper;
import com.kuo.artemis.server.dao.RolePermissionMapper;
import com.kuo.artemis.server.dao.UserProjectMapper;
import com.kuo.artemis.server.dao.UserRoleMapper;
import com.kuo.artemis.server.entity.UserProject;
import com.kuo.artemis.server.entity.UserProjectKey;
import com.kuo.artemis.server.entity.UserRoleKey;
import com.kuo.artemis.server.service.UserProjectService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.List;

/**
 * @Author : guoyang
 * @Description : 处理获取用户课题列表以及课题下成员列表的相关任务
 * @Date : Created on 2017/10/30
 */
@Service
public class UserProjectServiceImpl implements UserProjectService {

    @Inject
    private UserProjectMapper userProjectMapper;

    @Inject
    private UserRoleMapper userRoleMapper;

    @Inject
    private RolePermissionMapper rolePermissionMapper;

    @Inject
    private RoleMapper roleMapper;


    /**
     * 获取某个用户参与的所有课题
     *
     * @param userId
     * @return
     */
    public Response listProjectsByUserId(String userId) {

        Response response = new Response();


        List<UserProject> projects = null;

        if (userId != null) {
            projects = userProjectMapper.selectProjectsByUserId(Integer.valueOf(userId));
        }

        if (projects != null) {
            response.setCode(HttpStatus.OK.value());
            response.setMsg("获取课题列表成功");
            response.setData(projects);
        } else {
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("课题列表为空");
            response.setData(null);
        }

        return response;
    }

    /**
     * 获取某个课题下的所有用户信息
     *
     * @param projectId
     * @return
     */
    public Response listProjectMembersById(String projectId) {
        Response response = new Response();


        List<UserProject> members = null;

        if (projectId != null) {
            members = userProjectMapper.selectMembersByProjectId(Integer.valueOf(projectId));
        }

        if (members != null) {
            response.setCode(HttpStatus.OK.value());
            response.setMsg("获取成员列表成功");
            response.setData(members);
        } else {
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("成员列表为空");
            response.setData(null);
        }

        return response;
    }

    public Response listAdminProjectByUserId(String userId) {
        Response response = new Response();


        List<UserProject> projects = null;

        if (userId != null) {
            projects = userProjectMapper.selectAdminProject(Integer.valueOf(userId));
        }

        if (projects != null) {
            response.setCode(HttpStatus.OK.value());
            response.setMsg("课题列表");
            response.setData(projects);
        } else {
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("课题列表为空");
            response.setData(null);
        }

        return response;
    }

    /**
     * 用户退出课题
     *
     * @param userProjectKey
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response exitProject(UserProjectKey userProjectKey) {
        Response response = new Response();


        //退出课题会触发一系列的级联操作
        //1.获取用户在课题中的角色id
        Integer roleId = userProjectMapper.selectRoleId(userProjectKey);
        if (roleId == null) {
            //该人员已不再课题之中
            response.setCode(HttpStatus.FORBIDDEN.value());
            response.setMsg("成员已不在课题之中");
            response.setData(null);
            return response;
        }

        //2.删除用户课题关系
        userProjectMapper.deleteUserProject(userProjectKey);
        //3.删除用户角色关系
        UserRoleKey userRoleKey = new UserRoleKey(userProjectKey.getUserId(), roleId);
        userRoleMapper.deleteByPrimaryKey(userRoleKey);
        //4.删除角色权限关系
        rolePermissionMapper.deleteByRoleId(roleId);
        //5.删除角色
        int result = roleMapper.deleteByPrimaryKey(roleId);

        if (result > 0) {
            response.setCode(HttpStatus.OK.value());
            response.setMsg("删除成员成功");
            response.setData(null);
        } else {
            response.setCode(HttpStatus.FORBIDDEN.value());
            response.setMsg("删除成员失败");
            response.setData(null);
        }


        return response;
    }


}
