package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.*;
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

    @Inject
    private UserProjectMapper userProjectMapper;


    /**
     * 用户申请加入某个课题
     * @param userProjectKey
     * @return
     */
    public Response applyToJoinProject(UserProjectKey userProjectKey) {

        Response response = new Response();

        try {

            //用户已经发送过申请或者用户在加入课题之中
            if (userProjectMapper.selectByPrimaryKey(userProjectKey) != null) {
                return new Response(null, HttpStatus.CONFLICT.value(), "您已申请或已被邀请");
            }

            int result = userInvitationApplicationMapper.insertUserProjectByApplication(UserProjectAssembler.toUserInvitationApplication(userProjectKey));

            if (result > 0) {
                response.setData(null);
                response.setCode(HttpStatus.OK.value());
                response.setMsg("成功发送申请");
            } else {
                response.setData(null);
                response.setCode(HttpStatus.FORBIDDEN.value());
                response.setMsg("发送申请失败");
            }
        } catch (Exception e) {
            return new Response(e);
        }

        return response;
    }

    /**
     * 课题负责人邀请某个用户加入课题
     * @param userProjectKey
     * @return
     */
    public Response inviteToJoinProject(UserProjectKey userProjectKey) {

        Response response = new Response();

        try {
            //用户已经发送过邀请或者用户在加入课题之中
            if (userProjectMapper.selectByPrimaryKey(userProjectKey) != null) {
                return new Response(null, HttpStatus.CONFLICT.value(), "您已邀请该用户或该用户已申请");
            }

            int result = userInvitationApplicationMapper.insertUserProjectByInvitation(UserProjectAssembler.toUserInvitationApplication(userProjectKey));

            if (result > 0) {
                response.setData(null);
                response.setCode(HttpStatus.OK.value());
                response.setMsg("成功发送邀请");
            } else {
                response.setData(null);
                response.setCode(HttpStatus.FORBIDDEN.value());
                response.setMsg("发送邀请失败");
            }
        } catch (Exception e) {
            return new Response(e);
        }

        return response;
    }

    /**
     * 课题负责人拒绝某人的申请加入请求
     * @param userProjectKey
     * @return
     */
    public Response refuseApplication(UserProjectKey userProjectKey) {
        Response response = new Response();
        UserInvitationApplication userInvitationApplication = UserProjectAssembler.toUserInvitationApplication(userProjectKey);
        userInvitationApplication.setStatus(new Byte("3"));

        try {
            int result = userInvitationApplicationMapper.updateUserProjectStatus(userInvitationApplication);

            if (result > 0) {
                response.setData(null);
                response.setCode(HttpStatus.OK.value());
                response.setMsg("拒绝申请成功");
            } else {
                response.setData(null);
                response.setCode(HttpStatus.FORBIDDEN.value());
                response.setMsg("拒绝申请失败");
            }
        } catch (Exception e) {
            return new Response(e);
        }


        return response;
    }

    /**
     * 课题负责人接受某人加入课题的申请
     * @param userProjectKey
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response acceptApplication(UserProjectKey userProjectKey) {
        Response response = new Response();
        UserInvitationApplication userInvitationApplication = UserProjectAssembler.toUserInvitationApplication(userProjectKey);
        userInvitationApplication.setStatus(new Byte("2"));

        try {
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
                response.setCode(HttpStatus.FORBIDDEN.value());
                response.setMsg("接受申请失败");
            }

        } catch (Exception e) {
            return new Response(e);
        }

        return response;
    }

    /**
     * 用户拒绝加入课题的邀请
     * @param userProjectKey
     * @return
     */
    public Response refuseInvitation(UserProjectKey userProjectKey) {
        Response response = new Response();
        UserInvitationApplication userInvitationApplication = UserProjectAssembler.toUserInvitationApplication(userProjectKey);
        userInvitationApplication.setStatus(new Byte("3"));

        try {
            int result = userInvitationApplicationMapper.updateUserProjectStatus(userInvitationApplication);

            if (result > 0) {
                response.setData(null);
                response.setCode(HttpStatus.OK.value());
                response.setMsg("拒绝邀请成功");
            } else {
                response.setData(null);
                response.setCode(HttpStatus.FORBIDDEN.value());
                response.setMsg("拒绝邀请失败");
            }
        } catch (Exception e) {
            return new Response(e);
        }


        return response;
    }

    /**
     * 用户接受加入课题的邀请
     * @param userProjectKey
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response acceptInvitation(UserProjectKey userProjectKey) {
        Response response = new Response();
        UserInvitationApplication userInvitationApplication = UserProjectAssembler.toUserInvitationApplication(userProjectKey);
        userInvitationApplication.setStatus(new Byte("2"));

        try {
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
                response.setCode(HttpStatus.FORBIDDEN.value());
                response.setMsg("接受邀请失败");
            }
        } catch (Exception e) {
            return new Response(e);
        }


        return response;
    }

    /**
     * 获取某个课题下的申请列表
     * @param projectId
     * @return
     */
    public Response listApplication(String projectId) {
        Response response = new Response();
        List<UserInvitationApplication> userInvitationApplications = null;

        try {
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
        } catch (Exception e) {
            return new Response(e);
        }

        return response;
    }


    /**
     * 获取某个用户的邀请列表
     * @param userId
     * @return
     */
    public Response listInvitation(String userId) {
        Response response = new Response();
        List<UserInvitationApplication> userInvitationApplications = null;

        try {
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
        } catch (Exception e) {
            return new Response(e);
        }

        return response;
    }
}
