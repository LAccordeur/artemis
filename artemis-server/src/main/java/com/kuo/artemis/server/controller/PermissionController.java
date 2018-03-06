package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.command.UpdatePermissionCommend;
import com.kuo.artemis.server.entity.RolePermissionKey;
import com.kuo.artemis.server.service.UserPermissionService;
import com.kuo.artemis.server.util.constant.PermissionConst;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :处理权限相关的请求
 * @Date : Created on 2017/10/29
 */
@Controller
@RequestMapping(value = "/api/permission", produces = {"application/json;charset=utf8"})
public class PermissionController {

    @Inject
    private UserPermissionService userPermissionService;



    /**
     * 获取某用户在某课题下的所有权限
     * @param userId
     * @param projectId
     * @return
     */

    @RequestMapping(value = "/user/project", method = RequestMethod.GET)
    @ResponseBody
    public Response getPermissionListByUserIdAndProjectId(String userId, String projectId) {
        return userPermissionService.listUserPermissionsByUserIdAndProjectId(userId, projectId);
    }

    /**
     * 获取某用户在某课题下的所有权限(boolean)
     * @param userId
     * @param projectId
     * @return
     */

    @RequestMapping(value = "/user/project/boolean", method = RequestMethod.GET)
    @ResponseBody
    public Response getPermissionListByUserIdAndProjectIdWithBoolean(String userId, String projectId) {
        return userPermissionService.listUserPermissionsByUserIdAndProjectIdWithBoolean(userId, projectId);
    }


    /**
     * 获取所有的权限列表
     * @return
     */

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Response getPermissionList() {
        return userPermissionService.listPermissions();
    }



    /**
     * 获取某个课题下所有成员的权限情况(只返回拥有的权限名)
     * @param projectId
     * @return
     */
    //@Authority(value = PermissionConst.PROJECT_MANAGEMENT_MEMBER_MANAGEMENT)
    @RequestMapping(value = "/project", method = RequestMethod.GET)
    @ResponseBody
    public Response getPermissionListByProjectId(String projectId) {
        return userPermissionService.listUserPermissionsByProjectId(projectId);
    }

    /**
     * 获取某个课题下所有成员的权限情况（Boolean形式返回所有权限）
     * @param projectId
     * @return
     */
    //@Authority(value = PermissionConst.PROJECT_MANAGEMENT_MEMBER_MANAGEMENT)
    @RequestMapping(value = "/project/boolean", method = RequestMethod.GET)
    @ResponseBody
    public Response getPermissionListByProjectIdWithBoolean(String projectId) {
        return userPermissionService.listUserPermissionsByProjectIdWithBoolean(projectId);
    }

    /**
     * 授予某个用户某个权限
     * @param rolePermissionKey
     * @return
     */
    @Authority(value = PermissionConst.PERMISSION_MANAGEMENT)
    @RequestMapping(value = "/grant", method = RequestMethod.POST)
    @ResponseBody
    public Response grantPermission(@RequestBody RolePermissionKey rolePermissionKey, @RequestParam(value = "userId", required = false) String userId, @RequestParam(value = "projectId", required = false) String projectId) {
        return userPermissionService.addPermission(rolePermissionKey);
    }

    /**
     * 移除某个用户的某个权限
     * @param rolePermissionKey
     * @return
     */
    @Authority(value = PermissionConst.PERMISSION_MANAGEMENT)
    @RequestMapping(value = "/removal", method = RequestMethod.DELETE)
    @ResponseBody
    public Response removePermission(@RequestBody RolePermissionKey rolePermissionKey, @RequestParam(value = "userId", required = false) String userId, @RequestParam(value = "projectId", required = false) String projectId) {
        return userPermissionService.removePermission(rolePermissionKey);
    }


    /**
     * 批量更新用户权限
     * @param updatePermissionCommend
     * @return
     */
    @Authority(value = PermissionConst.PERMISSION_MANAGEMENT)
    @RequestMapping(value = "/batch", method = RequestMethod.POST)
    @ResponseBody
    public Response updatePermissionBatch(@RequestBody UpdatePermissionCommend updatePermissionCommend, @RequestParam(value = "userId", required = false) String userId, @RequestParam(value = "projectId", required = false) String projectId) {
        return userPermissionService.updatePermissionBatch(updatePermissionCommend);
    }
}
