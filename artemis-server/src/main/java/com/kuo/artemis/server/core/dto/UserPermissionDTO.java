package com.kuo.artemis.server.core.dto;

import com.kuo.artemis.server.entity.Permission;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/13
 */

public class UserPermissionDTO<T> {

    private String userId;

    private String userName;

    private String projectId;

    private String roleId;

    private String roleName;

    private List<T> permissions;

    public UserPermissionDTO(String userId, String userName, String projectId, String roleId, String roleName, List<T> permissions) {
        this.userId = userId;
        this.userName = userName;
        this.projectId = projectId;
        this.roleId = roleId;
        this.roleName = roleName;
        this.permissions = permissions;
    }

    public UserPermissionDTO() {
        super();
    }

    @Override
    public String toString() {
        return "UserPermissionDTO{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", projectId='" + projectId + '\'' +
                ", roleId='" + roleId + '\'' +
                ", roleName='" + roleName + '\'' +
                ", permissions=" + permissions +
                '}';
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<T> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<T> permissions) {
        this.permissions = permissions;
    }
}
