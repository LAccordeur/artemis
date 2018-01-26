package com.kuo.artemis.server.core.dto.excel;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/26
 */
public class DataExportDTO {

    private String projectId;

    private String userId;

    private String fileIdentifier;

    private String version;

    private List dataList;

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFileIdentifier() {
        return fileIdentifier;
    }

    public void setFileIdentifier(String fileIdentifier) {
        this.fileIdentifier = fileIdentifier;
    }

    public List getDataList() {
        return dataList;
    }

    public void setDataList(List dataList) {
        this.dataList = dataList;
    }
}
