package com.kuo.artemis.server.entity;

import java.util.Date;
import java.util.List;

public class StatisticsRecord {
    private Integer id;

    private Integer projectId;

    private Integer userId;

    private String userName;

    private Short statisticsMethod;

    private Date modifiedTime;

    private Date createTime;

    private List<StatisticsDetailRecord> statisticsDetailRecordList;

    @Override
    public String toString() {
        return "StatisticsRecord{" +
                "id=" + id +
                ", projectId=" + projectId +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", statisticsMethod=" + statisticsMethod +
                ", modifiedTime=" + modifiedTime +
                ", createTime=" + createTime +
                ", statisticsDetailRecordList=" + statisticsDetailRecordList +
                '}';
    }

    public List<StatisticsDetailRecord> getStatisticsDetailRecordList() {
        return statisticsDetailRecordList;
    }

    public void setStatisticsDetailRecordList(List<StatisticsDetailRecord> statisticsDetailRecordList) {
        this.statisticsDetailRecordList = statisticsDetailRecordList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Short getStatisticsMethod() {
        return statisticsMethod;
    }

    public void setStatisticsMethod(Short statisticsMethod) {
        this.statisticsMethod = statisticsMethod;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}