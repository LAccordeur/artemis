package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.RoleMapper;
import com.kuo.artemis.server.dao.RolePermissionMapper;
import com.kuo.artemis.server.dao.UserInvitationApplicationMapper;
import com.kuo.artemis.server.dao.UserRoleMapper;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.UserInvitationApplicationService;
import com.kuo.artemis.server.util.assembler.UserProjectAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author : guoyang
 * @Description : 用以处理用户邀请申请课题相关的操作
 * @Date : Created on 2017/11/2
 */
@Service
public class UserInvitationApplicationServiceImpl implements UserInvitationApplicationService {

    @Inject
    private UserInvitationApplicationMapper userInvitationApplicationMapper;

    @Inject
    private RoleMapper roleMapper;

    @Inject
    private UserRoleMapper userRoleMapper;

    @Inject
    private RolePermissionMapper rolePermissionMapper;


    public Response applyToJoinProject(UserProjectKey userProjectKey) {

        Response response = new Response();

        int result = userInvitationApplicationMapper.insertUserProjectByApplication(UserProjectAssembler.toUserInvitationApplication(userProjectKey));

        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("成功发送申请");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("发送申请失败");
        }


        return response;
    }

    public Response inviteToJoinProject(UserProjectKey userProjectKey) {

        Response response = new Response();

        int result = userInvitationApplicationMapper.insertUserProjectByInvitation(UserProjectAssembler.toUserInvitationApplication(userProjectKey));

        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("成功发送邀请");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("发送邀请失败");
        }


        return response;
    }

    public Response refuseApplication(UserProjectKey userProjectKey) {
        Response response = new Response();
        UserInvitationApplication userInvitationApplication = UserProjectAssembler.toUserInvitationApplication(userProjectKey);
        userInvitationApplication.setStatus(new Byte("3"));

        int result = userInvitationApplicationMapper.updateUserProjectStatus(userInvitationApplication);

        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("拒绝申请成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("拒绝申请失败");
        }


        return response;
    }

    @Transactional
    public Response acceptApplication(UserProjectKey userProjectKey) {
        Response response = new Response();
        UserInvitationApplication userInvitationApplication = UserProjectAssembler.toUserInvitationApplication(userProjectKey);
        userInvitationApplication.setStatus(new Byte("2"));

        //同意加入课题的申请则引发一系列级联操作
        //1.更新用户课题关系
        int result = userInvitationApplicationMapper.updateUserProjectStatus(userInvitationApplication);
        //2.更新角色表
        Role role = new Role(userProjectKey.getProjectId(), "课题成员", 0);
        roleMapper.insertSelective(role);
        Integer newRoleId = role.getId();
        //3.更新用户角色表
        userRoleMapper.insertSelective(new UserRole(userProjectKey.getUserId(), newRoleId));
        //4.更新角色权限表
        RolePermission rolePermission = new RolePermission();
        rolePermission.setRoleId(newRoleId);
        rolePermission.setPermissionId(1);
        rolePermissionMapper.insertSelective(rolePermission);


        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("接受申请成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("接受申请失败");
        }


        return response;
    }

    public Response refuseInvitation(UserProjectKey userProjectKey) {
        Response response = new Response();
        UserInvitationApplication userInvitationApplication = UserProjectAssembler.toUserInvitationApplication(userProjectKey);
        userInvitationApplication.setStatus(new Byte("3"));

        int result = userInvitationApplicationMapper.updateUserProjectStatus(userInvitationApplication);

        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("拒绝邀请成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("拒绝邀请失败");
        }


        return response;
    }

    public Response acceptInvitation(UserProjectKey userProjectKey) {
        Response response = new Response();
        UserInvitationApplication userInvitationApplication = UserProjectAssembler.toUserInvitationApplication(userProjectKey);
        userInvitationApplication.setStatus(new Byte("2"));

        //同意加入课题的申请则引发一系列级联操作
        //1.更新用户课题关系
        int result = userInvitationApplicationMapper.updateUserProjectStatus(userInvitationApplication);
        //2.更新角色表
        Role role = new Role(userProjectKey.getProjectId(), "课题成员", 0);
        roleMapper.insertSelective(role);
        Integer newRoleId = role.getId();
        //3.更新用户角色表
        userRoleMapper.insertSelective(new UserRole(userProjectKey.getUserId(), newRoleId));
        //4.更新角色权限表
        RolePermission rolePermission = new RolePermission();
        rolePermission.setRoleId(newRoleId);
        rolePermission.setPermissionId(1);
        rolePermissionMapper.insertSelective(rolePermission);


        if (result > 0) {
            response.setData(null);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("接受邀请成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("接受邀请失败");
        }


        return response;
    }

    public Response listApplication(String projectId) {
        Response response = new Response();
        List<UserInvitationApplication> userInvitationApplications = null;

        if (projectId != null) {
            userInvitationApplications = userInvitationApplicationMapper.selectApplicationList(Integer.valueOf(projectId));
        }

        if (userInvitationApplications != null) {
            response.setData(userInvitationApplications);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("获取申请列表成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("无申请");
        }

        return response;
    }

    public Response listInvitation(String userId) {
        Response response = new Response();
        List<UserInvitationApplication> userInvitationApplications = null;

        if (userId != null) {
            userInvitationApplications = userInvitationApplicationMapper.selectInvitationList(Integer.valueOf(userId));
        }

        if (userInvitationApplications != null) {
            response.setData(userInvitationApplications);
            response.setCode(HttpStatus.OK.value());
            response.setMsg("获取邀请列表成功");
        } else {
            response.setData(null);
            response.setCode(HttpStatus.NO_CONTENT.value());
            response.setMsg("无邀请");
        }

        return response;
    }
}
