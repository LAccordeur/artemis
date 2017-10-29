package com.kuo.artemis.server.entity;

public class UserPermission {
    private Integer id;

    private String userName;

    private Integer projectId;

    private String roleName;

    private String permissionName;

    private String permissionType;

    private String permissionUrl;

    @Override
    public String toString() {
        return "UserPermission{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", projectId=" + projectId +
                ", roleName='" + roleName + '\'' +
                ", permissionName='" + permissionName + '\'' +
                ", permissionType='" + permissionType + '\'' +
                ", permissionUrl='" + permissionUrl + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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