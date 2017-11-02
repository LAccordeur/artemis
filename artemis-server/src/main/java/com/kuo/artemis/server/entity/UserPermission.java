package com.kuo.artemis.server.entity;

public class UserPermission {
    private Integer userId;

    private String userName;

    private Integer projectId;

    private String roleName;

    private Integer roleId;

    private Integer permissionId;

    private String permissionName;

    private String permissionType;

    private String permissionUrl;

    @Override
    public String toString() {
        return "UserPermission{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", projectId=" + projectId +
                ", roleName='" + roleName + '\'' +
                ", roleId=" + roleId +
                ", permissionId=" + permissionId +
                ", permissionName='" + permissionName + '\'' +
                ", permissionType='" + permissionType + '\'' +
                ", permissionUrl='" + permissionUrl + '\'' +
                '}';
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName == null ? null : permissionName.trim();
    }

    public String getPermissionType() {
        return permissionType;
    }

    public void setPermissionType(String permissionType) {
        this.permissionType = permissionType == null ? null : permissionType.trim();
    }

    public String getPermissionUrl() {
        return permissionUrl;
    }

    public void setPermissionUrl(String permissionUrl) {
        this.permissionUrl = permissionUrl == null ? null : permissionUrl.trim();
    }
}