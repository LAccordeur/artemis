package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;

public interface UserPermissionService {

    Response getUserPermissionByUserIdAndProjectId(String userId, String projectId);

    Response listUserPermissionsByProjectId(String projectId);

    Response addPermission(String userId, String project, String roleId, String permissionId);

    Response removePermission(String userId, String project, String roleId, String permissionId);

    Response addPermissionList();

    Response removePermissionList();

}
