package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.UserPermissionMapper;
import com.kuo.artemis.server.entity.Permission;
import com.kuo.artemis.server.entity.UserPermission;
import com.kuo.artemis.server.service.UserPermissionService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/10/28
 */
@Service
public class UserPermissionServiceImpl implements UserPermissionService {

    @Inject
    private UserPermissionMapper userPermissionMapper;

    public Response getUserPermissionByUserIdAndProjectId(String userId, String projectId) {

        Response<List<UserPermission>> response = new Response<List<UserPermission>>();

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

        return response;
    }

    public Response listUserPermissionsByProjectId(String projectId) {
        return null;
    }
}
