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

    private String analysisMethod;

    @Override
    public String toString() {
        return "StatisticsParam{" +
                "projectId='" + projectId + '\'' +
                ", userId='" + userId + '\'' +
                ", fileIdentifier='" + fileIdentifier + '\'' +
                ", version='" + version + '\'' +
                ", indicatorIdList=" + indicatorIdList +
                ", analysisMethod='" + analysisMethod + '\'' +
                '}';
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

    public String getAnalysisMethod() {
        return analysisMethod;
    }

    public void setAnalysisMethod(String analysisMethod) {
        this.analysisMethod = analysisMethod;
    }
}
