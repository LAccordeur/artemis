package com.kuo.artemis.server.core.dto;

import com.kuo.artemis.server.util.constant.FileTypeConst;
import com.kuo.artemis.server.util.constant.OperationTypeConst;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
@Deprecated
public abstract class FileExportCommand {

    private String userId;    //请求导出文件的用户id

    private String projectId;    //导出文件所在的课题

    private String dataType;    //导出文件的数据类型

    private String operationType;    //操作类型

    private String fileType;    //文件类型

    public FileExportCommand(String operationType, String fileType) {
        this.operationType = operationType;
        this.fileType = fileType;
    }

    @Override
    public String toString() {
        return "FileExportCommand{" +
                "userId='" + userId + '\'' +
                ", projectId='" + projectId + '\'' +
                ", dataType='" + dataType + '\'' +
                ", operationType='" + operationType + '\'' +
                ", fileType='" + fileType + '\'' +
                '}';
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
}
