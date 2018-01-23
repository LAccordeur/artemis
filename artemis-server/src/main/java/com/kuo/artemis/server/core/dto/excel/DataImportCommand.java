package com.kuo.artemis.server.core.dto.excel;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/23
 */
public class DataImportCommand {

    @NotNull
    private String userId;   //导入数据的用户id


    private String projectId;   //课题id


    private String filename;   //文件名

    private String fileId;

    @NotNull
    private List<List<String>> dataList;    //二维数组形式的Excel数据

    @Override
    public String toString() {
        return "DataImportCommand{" +
                "userId='" + userId + '\'' +
                ", projectId='" + projectId + '\'' +
                ", filename='" + filename + '\'' +
                ", fileId='" + fileId + '\'' +
                ", dataList=" + dataList +
                '}';
    }

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public List<List<String>> getDataList() {
        return dataList;
    }

    public void setDataList(List<List<String>> dataList) {
        this.dataList = dataList;
    }
}
