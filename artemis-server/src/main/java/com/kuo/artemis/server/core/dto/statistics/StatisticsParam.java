package com.kuo.artemis.server.core.dto.statistics;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/2/6
 */
public class StatisticsParam {

    private String projectId;

    private String userId;

    private String fileIdentifier;

    private String version;

    private List<String> indicatorIdList;

    private String statisticsCode;

    private String statisticsMethod;

    @Override
    public String toString() {
        return "StatisticsParam{" +
                "projectId='" + projectId + '\'' +
                ", userId='" + userId + '\'' +
                ", fileIdentifier='" + fileIdentifier + '\'' +
                ", version='" + version + '\'' +
                ", indicatorIdList=" + indicatorIdList +
                ", statisticsCode='" + statisticsCode + '\'' +
                ", statisticsMethod='" + statisticsMethod + '\'' +
                '}';
    }

    public String getStatisticsCode() {
        return statisticsCode;
    }

    public void setStatisticsCode(String statisticsCode) {
        this.statisticsCode = statisticsCode;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getFileIdentifier() {
        return fileIdentifier;
    }

    public void setFileIdentifier(String fileIdentifier) {
        this.fileIdentifier = fileIdentifier;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public List<String> getIndicatorIdList() {
        return indicatorIdList;
    }

    public void setIndicatorIdList(List<String> indicatorIdList) {
        this.indicatorIdList = indicatorIdList;
    }

    public String getStatisticsMethod() {
        return statisticsMethod;
    }

    public void setStatisticsMethod(String statisticsMethod) {
        this.statisticsMethod = statisticsMethod;
    }
}
