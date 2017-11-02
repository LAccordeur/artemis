package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.UserInvitationApplication;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserInvitationApplicationMapper {
    int insert(UserInvitationApplication record);

    int insertSelective(UserInvitationApplication record);

    int insertUserProjectByApplication(UserInvitationApplication userInvitationApplication);

    List<UserInvitationApplication> selectApplicationList(@Param("projectId") Integer projectId);

    int updateUserProjectStatus(UserInvitationApplication userInvitationApplication);

    int insertUserProjectByInvitation(UserInvitationApplication userInvitationApplication);

    List<UserInvitationApplication> selectInvitationList(@Param("userId") Integer userId);


}