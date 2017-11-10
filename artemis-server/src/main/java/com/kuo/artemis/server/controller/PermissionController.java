package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.service.UserPermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/10/29
 */
@Controller
@RequestMapping(value = "/api/permission", produces = {"application/json;charset=utf8"})
public class PermissionController {

    @Inject
    private UserPermissionService userPermissionService;



    /**
     * 获取某人在某课题下的所有权限
     * @param userId
     * @param projectId
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    @ResponseBody
    public Response getPermissionListByUserIdAndProjectId(String userId, String projectId) {
        return userPermissionService.getUserPermissionByUserIdAndProjectId(userId, projectId);
    }

    public Response getPermissionListByUserId(String userId) {
        return null;
    }

    public Response grantPermission() {
        return null;
    }

    public Response removePermission() {
        return null;
    }
}
