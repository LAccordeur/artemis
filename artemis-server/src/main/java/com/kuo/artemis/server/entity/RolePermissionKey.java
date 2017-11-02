package com.kuo.artemis.server.entity;

public class RolePermissionKey {
    private Integer roleId;

    private Integer permissionId;

    @Override
    public String toString() {
        return "RolePermissionKey{" +
                "roleId=" + roleId +
                ", permissionId=" + permissionId +
                '}';
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
}