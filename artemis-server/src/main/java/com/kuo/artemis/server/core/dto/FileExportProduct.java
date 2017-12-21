package com.kuo.artemis.server.core.dto;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
@Deprecated
public abstract class FileExportProduct<T> {

    private String userId;    //请求导出文件的用户id

    private String projectId;    //导出文件所在的课题

    private String dataType;    //导出文件的数据类型

    private String operationType;    //操作类型

    private String fileType;    //文件类型

    private T data;    //导出数据

    public abstract FileExportProduct handle(T o);

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

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getOperationType() {
        return operationType;
    }

    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
