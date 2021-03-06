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

    Integer selectRoleId(UserProjectKey userProjectKey);

    int deleteUserProject(UserProjectKey userProjectKey);

    UserProject selectByPrimaryKey(UserProjectKey userProjectKey);

    UserProject selectMemberByProjectIdAndUserId(UserProjectKey userProjectKey);

    Integer selectStatusByPrimaryKey(UserProjectKey userProjectKey);

    List<UserProject> selectAdminProject(@Param("userId") Integer userId);
}