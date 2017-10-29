package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;

public interface UserPermissionService {

    Response getUserPermissionByUserIdAndProjectId(String userId, String projectId);

}
