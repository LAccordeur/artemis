package com.kuo.artemis.server.core.dto;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Author : guoyang
 * @Description :  文件导入命令
 * @Date : Created on 2017/12/17
 */
@Deprecated
public class FileImportCommand {

    private MultipartFile file;    //需要导入的文件对象

    private String projectId;    //文件所在的课题

    private String userId;    //导入文件的用户

    private String dataType;    //导入文件的数据类型(指标or原料...)

    public FileImportCommand(MultipartFile file, String projectId, String userId, String dataType) {
        this.file = file;
        this.projectId = projectId;
        this.userId = userId;
        this.dataType = dataType;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
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

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }
}
