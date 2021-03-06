package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ExcelFileDetail {
    private Integer id;

    private Integer fileRecordId;

    private Integer indicatorId;

    private String indicatorName;

    private String tableName;

    private Date createTime;

    @Override
    public String toString() {
        return "ExcelFileDetail{" +
                "id=" + id +
                ", fileRecordId=" + fileRecordId +
                ", indicatorId=" + indicatorId +
                ", indicatorName='" + indicatorName + '\'' +
                ", tableName='" + tableName + '\'' +
                ", createTime=" + createTime +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFileRecordId() {
        return fileRecordId;
    }

    public void setFileRecordId(Integer fileRecordId) {
        this.fileRecordId = fileRecordId;
    }

    public Integer getIndicatorId() {
        return indicatorId;
    }

    public void setIndicatorId(Integer indicatorId) {
        this.indicatorId = indicatorId;
    }

    public String getIndicatorName() {
        return indicatorName;
    }

    public void setIndicatorName(String indicatorName) {
        this.indicatorName = indicatorName == null ? null : indicatorName.trim();
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName == null ? null : tableName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}