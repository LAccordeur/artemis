package com.kuo.artemis.server.core.dto.excel;

import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author : guoyang
 * @Description : 用来保存 指标数据的Excel文件 解析后内容的数据结构类
 * @Date : Created on 2017/11/25
 */
public class IndicatorExcelImportDTO {
    private String filename;

    private InputStream inputStream;

    private String signature;

    private List<String> indicators;  //指标名集合  形如Initial BW

    private List<String> fields;  //Excel表的所有字段名列表，名字形如initialBw即Java驼峰型

    private Set<Class> classes;    //Excel表中所有指标来自的类集合

    private Map<Class, List<Map<String, Object>>> items;   //key为类名， List为Excel中的指标数据

    @Override
    public String toString() {
        return "IndicatorExcelImportDTO{" +
                "filename='" + filename + '\'' +
                ", inputStream=" + inputStream +
                ", signature='" + signature + '\'' +
                ", fields=" + fields +
                ", items=" + items +
                '}';
    }

    public List<String> getIndicators() {
        return indicators;
    }

    public void setIndicators(List<String> indicators) {
        this.indicators = indicators;
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
