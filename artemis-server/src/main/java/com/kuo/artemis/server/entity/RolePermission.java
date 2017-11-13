package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class RolePermission extends RolePermissionKey {
    private Byte status;

    private String roleName;

    private String permissionName;

    private String permissionNameEnglish;

    private Date createTime;

    private Date modifiedTime;

    @Override
    public String toString() {
        return "RolePermission{" +
                "status=" + status +
                ", roleName='" + roleName + '\'' +
                ", permissionName='" + permissionName + '\'' +
                ", permissionNameEnglish='" + permissionNameEnglish + '\'' +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                '}';
    }

    public String getPermissionNameEnglish() {
        return permissionNameEnglish;
    }

    public void setPermissionNameEnglish(String permissionNameEnglish) {
        this.permissionNameEnglish = permissionNameEnglish;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }
}