package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.UserProjectKey;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/10/30
 */
public interface UserProjectService {
    Response listProjectsByUserId(String userId);

    Response listProjectMembersById(String projectId);

    Response exitProject(UserProjectKey userProjectKey);

}
