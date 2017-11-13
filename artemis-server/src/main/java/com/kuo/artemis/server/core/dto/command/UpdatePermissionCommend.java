package com.kuo.artemis.server.core.dto.command;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/13
 */
public class UpdatePermissionCommend {

    private String roleId;

    private List<Integer> permissionIds;

    @Override
    public String toString() {
        return "UpdatePermissionCommend{" +
                "roleId='" + roleId + '\'' +
                ", permissionIds=" + permissionIds +
                '}';
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public List<Integer> getPermissionIds() {
        return permissionIds;
    }

    public void setPermissionIds(List<Integer> permissionIds) {
        this.permissionIds = permissionIds;
    }
}
