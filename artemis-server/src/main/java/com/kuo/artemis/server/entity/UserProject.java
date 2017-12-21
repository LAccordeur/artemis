package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserProject {
    private Integer projectId;

    private String projectName;

    private Integer projectAdminId;

    private String projectAdminName;

    private String projectIntro;

    private Integer userId;

    private String userName;

    private Integer roleId;

    private String roleName;

    private Date createTime;

    @Override
    public String toString() {
        return "UserProject{" +
                "projectId=" + projectId +
                ", projectName='" + projectName + '\'' +
                ", projectAdminId=" + projectAdminId +
                ", projectAdminName='" + projectAdminName + '\'' +
                ", projectIntro='" + projectIntro + '\'' +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                ", createTime=" + createTime +
                '}';
    }

    public String getProjectIntro() {
        return projectIntro;
    }

    public void setProjectIntro(String projectIntro) {
        this.projectIntro = projectIntro;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public Integer getProjectAdminId() {
        return projectAdminId;
    }

    public void setProjectAdminId(Integer projectAdminId) {
        this.projectAdminId = projectAdminId;
    }

    public String getProjectAdminName() {
        return projectAdminName;
    }

    public void setProjectAdminName(String projectAdminName) {
        this.projectAdminName = projectAdminName == null ? null : projectAdminName.trim();
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

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}