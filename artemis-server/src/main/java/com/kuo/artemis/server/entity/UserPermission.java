package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserPermission {
    private Integer userId;

    private String userName;

    private Integer projectId;

    private String roleName;

    private Integer roleId;

    private Integer permissionId;

    private String permissionName;

    private String permissionNameEnglish;

    private String permissionDescription;

    private String permissionDescriptionEnglish;

    private Boolean permissionAction;

    private Boolean permissionType;

    private Integer permissionParentId;

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
                ", permissionNameEnglish='" + permissionNameEnglish + '\'' +
                ", permissionDescription='" + permissionDescription + '\'' +
                ", permissionDescriptionEnglish='" + permissionDescriptionEnglish + '\'' +
                ", permissionAction=" + permissionAction +
                ", permissionType=" + permissionType +
                ", permissionParentId=" + permissionParentId +
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

    public String getPermissionNameEnglish() {
        return permissionNameEnglish;
    }

    public void setPermissionNameEnglish(String permissionNameEnglish) {
        this.permissionNameEnglish = permissionNameEnglish == null ? null : permissionNameEnglish.trim();
    }

    public String getPermissionDescription() {
        return permissionDescription;
    }

    public void setPermissionDescription(String permissionDescription) {
        this.permissionDescription = permissionDescription == null ? null : permissionDescription.trim();
    }

    public String getPermissionDescriptionEnglish() {
        return permissionDescriptionEnglish;
    }

    public void setPermissionDescriptionEnglish(String permissionDescriptionEnglish) {
        this.permissionDescriptionEnglish = permissionDescriptionEnglish == null ? null : permissionDescriptionEnglish.trim();
    }

    public Boolean getPermissionAction() {
        return permissionAction;
    }

    public void setPermissionAction(Boolean permissionAction) {
        this.permissionAction = permissionAction;
    }

    public Boolean getPermissionType() {
        return permissionType;
    }

    public void setPermissionType(Boolean permissionType) {
        this.permissionType = permissionType;
    }

    public Integer getPermissionParentId() {
        return permissionParentId;
    }

    public void setPermissionParentId(Integer permissionParentId) {
        this.permissionParentId = permissionParentId;
    }
}