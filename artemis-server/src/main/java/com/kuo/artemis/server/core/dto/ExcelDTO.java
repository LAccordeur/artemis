package com.kuo.artemis.server.core.dto;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/25
 */
public class ExcelDTO {
    private String filename;

    private InputStream inputStream;

    private String signature;

    private List<String> fields;

    private List<Map<String, Object>> items;

    @Override
    public String toString() {
        return "ExcelDTO{" +
                "filename='" + filename + '\'' +
                ", inputStream=" + inputStream +
                ", signature='" + signature + '\'' +
                ", fields=" + fields +
                ", items=" + items +
                '}';
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }


    public List<String> getFields() {
        return fields;
    }

    public void setFields(List<String> fields) {
        this.fields = fields;
    }

    public List<Map<String, Object>> getItems() {
        return items;
    }

    public void setItems(List<Map<String, Object>> items) {
        this.items = items;
    }
}
