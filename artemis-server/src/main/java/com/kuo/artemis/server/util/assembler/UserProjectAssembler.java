package com.kuo.artemis.server.util.assembler;

import com.kuo.artemis.server.entity.UserInvitationApplication;
import com.kuo.artemis.server.entity.UserProject;
import com.kuo.artemis.server.entity.UserProjectKey;
import org.springframework.beans.BeanUtils;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/10/30
 */
public final class UserProjectAssembler {

    public static UserInvitationApplication toUserInvitationApplication(UserProjectKey userProjectKey) {
        UserInvitationApplication userInvitationApplication = new UserInvitationApplication();

        BeanUtils.copyProperties(userProjectKey, userInvitationApplication);
        return userInvitationApplication;
    }
}
