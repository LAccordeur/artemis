package com.kuo.artemis.server.entity;

import java.util.Date;

public class Role {
    private Integer id;

    private Integer authorityId;

    private Integer projectId;

    private String roleName;

    private Integer roleParent;

    private Date createTime;

    private Date modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
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

    public Integer getRoleParent() {
        return roleParent;
    }

    public void setRoleParent(Integer roleParent) {
        this.roleParent = roleParent;
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

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", authorityId=" + authorityId +
                ", projectId=" + projectId +
                ", roleName='" + roleName + '\'' +
                ", roleParent=" + roleParent +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                '}';
    }
}