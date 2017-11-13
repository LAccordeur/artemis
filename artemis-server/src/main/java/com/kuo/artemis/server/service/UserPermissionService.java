package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.command.UpdatePermissionCommend;
import com.kuo.artemis.server.entity.RolePermission;
import com.kuo.artemis.server.entity.RolePermissionKey;

import java.util.List;

public interface UserPermissionService {

    Response listUserPermissionsByUserIdAndProjectId(String userId, String projectId);

    Response listUserPermissionsByUserIdAndProjectIdWithBoolean(String userId, String projectId);

    Response listUserPermissionsByProjectId(String projectId);

    Response listUserPermissionsByProjectIdWithBoolean(String projectId);

//    Response listUserPermissionsByUserId(String userId);

    Response listPermissions();

    Response addPermission(RolePermissionKey rolePermissionKey);

    Response removePermission(RolePermissionKey rolePermissionKey);

    Response updatePermissionBatch(UpdatePermissionCommend updatePermissionCommend);


}
