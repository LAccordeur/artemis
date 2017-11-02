package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.UserProject;
import com.kuo.artemis.server.entity.UserProjectKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserProjectMapper {
    int insert(UserProject record);

    int insertSelective(UserProject record);

    int insertUserProjectByCreate(UserProjectKey userProjectKey);

    List<UserProject> selectProjectsByUserId(@Param("userId") Integer userId);

    List<UserProject> selectMembersByProjectId(@Param("projectId") Integer projectId);

    int selectRoleId(UserProjectKey userProjectKey);

    int deleteUserProject(UserProjectKey userProjectKey);
}