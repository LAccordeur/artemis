package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.service.UserPermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/10/29
 */
@Controller
@RequestMapping(value = "/api/permission", produces = {"application/json;charset=utf8"})
public class UserPermissionController {

    @Inject
    private UserPermissionService userPermissionService;

    @RequestMapping(value = "/list")
    @ResponseBody
    public Response getPermissionListByUserIdAndProjectId(String userId, String projectId) {
        return userPermissionService.getUserPermissionByUserIdAndProjectId(userId, projectId);
    }
}
