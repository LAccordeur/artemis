package com.kuo.artemis.server.entity;

import java.util.Date;

public class RolePermission extends RolePermissionKey {
    private Date createTime;

    private Date modifiedTime;

    @Override
    public String toString() {
        return "RolePermission{" +
                "createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                "} " + super.toString();
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