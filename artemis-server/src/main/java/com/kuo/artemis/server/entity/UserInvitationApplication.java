package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserInvitationApplication {
    private Integer userId;

    private String userName;

    private Integer projectId;

    private String projectName;

    private Byte status;

    private Byte joinType;

    private String university;

    private Byte userIdentity;

    private String userEmail;

    private String projectIntro;

    private String projectAdminName;

    private Date createTime;

    @Override
    public String toString() {
        return "UserInvitationApplication{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", projectId=" + projectId +
                ", projectName='" + projectName + '\'' +
                ", status=" + status +
                ", joinType=" + joinType +
                ", university='" + university + '\'' +
                ", userIdentity=" + userIdentity +
                ", userEmail='" + userEmail + '\'' +
                ", projectIntro='" + projectIntro + '\'' +
                ", projectAdminName='" + projectAdminName + '\'' +
                ", createTime=" + createTime +
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

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Byte getJoinType() {
        return joinType;
    }

    public void setJoinType(Byte joinType) {
        this.joinType = joinType;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university == null ? null : university.trim();
    }

    public Byte getUserIdentity() {
        return userIdentity;
    }

    public void setUserIdentity(Byte userIdentity) {
        this.userIdentity = userIdentity;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getProjectIntro() {
        return projectIntro;
    }

    public void setProjectIntro(String projectIntro) {
        this.projectIntro = projectIntro == null ? null : projectIntro.trim();
    }

    public String getProjectAdminName() {
        return projectAdminName;
    }

    public void setProjectAdminName(String projectAdminName) {
        this.projectAdminName = projectAdminName == null ? null : projectAdminName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}