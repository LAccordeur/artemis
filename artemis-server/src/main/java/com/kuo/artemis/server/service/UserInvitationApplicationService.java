package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.BaseMapper;
import com.kuo.artemis.server.entity.UserProjectKey;
import com.kuo.artemis.server.service.impl.UserInvitationApplicationServiceImpl;

import java.io.Serializable;

public interface UserInvitationApplicationService {

    Response applyToJoinProject(UserProjectKey userProjectKey);

    Response inviteToJoinProject(UserProjectKey userProjectKey);

    Response refuseApplication(UserProjectKey userProjectKey);

    Response acceptApplication(UserProjectKey userProjectKey);

    Response refuseInvitation(UserProjectKey userProjectKey);

    Response acceptInvitation(UserProjectKey userProjectKey);

    Response listApplication(String projectId);

    Response listInvitation(String userId);

}
