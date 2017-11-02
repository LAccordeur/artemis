package com.kuo.artemis.server.entity;

public class UserRoleKey {
    private Integer userId;

    private Integer roleId;

    @Override
    public String toString() {
        return "UserRoleKey{" +
                "userId=" + userId +
                ", roleId=" + roleId +
                '}';
    }

    public UserRoleKey(Integer userId, Integer roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}