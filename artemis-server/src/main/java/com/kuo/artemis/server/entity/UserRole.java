package com.kuo.artemis.server.entity;

import java.util.Date;

public class UserRole extends UserRoleKey {
    private Date createTime;

    private Date modifiedTime;

    @Override
    public String toString() {
        return "UserRole{" +
                "createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                "} " + super.toString();
    }

    public UserRole(Integer userId, Integer roleId) {
        super(userId, roleId);
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