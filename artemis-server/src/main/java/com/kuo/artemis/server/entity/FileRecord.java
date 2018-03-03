package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;

public class FileRecord {
    private Integer id;

    private Integer userId;

    private String filename;

    private String fileIdentifier;

    private Byte fileType;

    private Integer projectId;

    private Byte operationType;

    private Integer version;

    private Date createTime;

    private Date modifiedTime;

    @Override
    public String toString() {
        return "FileRecord{" +
                "id=" + id +
                ", userId=" + userId +
                ", filename='" + filename + '\'' +
                ", fileIdentifier='" + fileIdentifier + '\'' +
                ", fileType=" + fileType +
                ", projectId=" + projectId +
                ", operationType=" + operationType +
                ", version=" + version +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                '}';
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public String getFileIdentifier() {
        return fileIdentifier;
    }

    public void setFileIdentifier(String fileIdentifier) {
        this.fileIdentifier = fileIdentifier == null ? null : fileIdentifier.trim();
    }

    public Byte getFileType() {
        return fileType;
    }

    public void setFileType(Byte fileType) {
        this.fileType = fileType;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Byte getOperationType() {
        return operationType;
    }

    public void setOperationType(Byte operationType) {
        this.operationType = operationType;
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