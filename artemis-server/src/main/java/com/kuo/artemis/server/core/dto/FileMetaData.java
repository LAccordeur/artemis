package com.kuo.artemis.server.core.dto;

/**
 * @Author : guoyang
 * @Description : 记录腾讯云上传文件的元信息
 * @Date : Created on 2018/3/3
 */
public class FileMetaData {

    private Long contentLength;  //文件大小

    private String contentType;  //文件类型


    @Override
    public String toString() {
        return "FileMetaData{" +
                "contentLength=" + contentLength +
                ", contentType='" + contentType + '\'' +
                '}';
    }

    public FileMetaData() {
        super();
    }

    public FileMetaData(Long contentLength, String contentType) {
        this.contentLength = contentLength;
        this.contentType = contentType;
    }

    public Long getContentLength() {
        return contentLength;
    }

    public void setContentLength(Long contentLength) {
        this.contentLength = contentLength;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }
}
