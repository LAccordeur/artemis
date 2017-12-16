package com.kuo.artemis.server.core.dto.excel;

import java.util.List;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/7
 */
public class IndicatorExcelExportCommand {
    private String fileName;   //模板文件名

    private String userId;   //请求模板文件的用户id

    private String projectId;

    private String fileType = "1";  //模板文件类型，默认为Excel

    private String operationType = "2";  //表示是下载模板文件请求

    private List<String> indicatorIds;  //选择的指标id集合

    private List<String> indicatorNames;  //指标中文名集合

    private List<String> getIndicatorEnglishNames;  //指标英文名集合名字形如initial BW

    private List<Map<String, Object>> dataRows;   //指标数据,指标英文名集合名字形如initial BW

    @Override
    public String toString() {
        return "IndicatorExcelExportCommand{" +
                "fileName='" + fileName + '\'' +
                ", userId='" + userId + '\'' +
                ", projectId='" + projectId + '\'' +
                ", fileType='" + fileType + '\'' +
                ", operationType='" + operationType + '\'' +
                ", indicatorIds=" + indicatorIds +
                ", indicatorNames=" + indicatorNames +
                ", getIndicatorEnglishNames=" + getIndicatorEnglishNames +
                ", dataRows=" + dataRows +
                '}';
    }

    public List<Map<String, Object>> getDataRows() {
        return dataRows;
    }

    public void setDataRows(List<Map<String, Object>> dataRows) {
        this.dataRows = dataRows;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
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

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getOperationType() {
        return operationType;
    }

    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }

    public List<String> getIndicatorIds() {
        return indicatorIds;
    }

    public void setIndicatorIds(List<String> indicatorIds) {
        this.indicatorIds = indicatorIds;
    }

    public List<String> getIndicatorNames() {
        return indicatorNames;
    }

    public void setIndicatorNames(List<String> indicatorNames) {
        this.indicatorNames = indicatorNames;
    }

    public List<String> getGetIndicatorEnglishNames() {
        return getIndicatorEnglishNames;
    }

    public void setGetIndicatorEnglishNames(List<String> getIndicatorEnglishNames) {
        this.getIndicatorEnglishNames = getIndicatorEnglishNames;
    }
}
