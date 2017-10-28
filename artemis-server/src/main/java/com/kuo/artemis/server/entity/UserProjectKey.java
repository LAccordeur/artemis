package com.kuo.artemis.server.entity;

public class UserProjectKey {
    private Integer projectId;

    private Integer userId;

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "UserProjectKey{" +
                "projectId=" + projectId +
                ", userId=" + userId +
                '}';
    }
}