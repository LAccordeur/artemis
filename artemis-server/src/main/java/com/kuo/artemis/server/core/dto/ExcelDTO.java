package com.kuo.artemis.server.core.dto;

import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/25
 */
public class ExcelDTO {
    private String filename;

    private InputStream inputStream;

    private String signature;

    private List<String> fields;  //Excel表的所有字段名列表

    private Set<Class> classes;    //Excel表中所有指标来自的类集合

    private Map<Class, List<Map<String, Object>>> items;   //key为类名， List为Excel中的指标数据

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

    public Map<Class, List<Map<String, Object>>> getItems() {
        return items;
    }

    public void setItems(Map<Class, List<Map<String, Object>>> items) {
        this.items = items;
    }

    public Set<Class> getClasses() {
        return classes;
    }

    public void setClasses(Set<Class> classes) {
        this.classes = classes;
    }
}
