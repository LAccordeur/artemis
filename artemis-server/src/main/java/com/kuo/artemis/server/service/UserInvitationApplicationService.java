package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.UserProjectKey;

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
