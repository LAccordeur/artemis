package com.kuo.artemis.server.entity;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/2
 */
public class UserProjectKey {
    private Integer userId;

    private Integer projectId;

    public UserProjectKey(Integer userId, Integer projectId) {
        this.userId = userId;
        this.projectId = projectId;
    }

    @Override
    public String toString() {
        return "UserProjectKey{" +
                "userId=" + userId +
                ", projectId=" + projectId +
                '}';
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }
}
