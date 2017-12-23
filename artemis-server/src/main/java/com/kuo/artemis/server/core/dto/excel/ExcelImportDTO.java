package com.kuo.artemis.server.core.dto.excel;

import java.util.List;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description : 除指标excel文件外的excel解析后存储的数据结构类
 * @Date : Created on 2017/12/17
 */
@Deprecated
public class ExcelImportDTO {

    private List<String> fields;    //转换为驼峰类型的字段名

    private List<String> initFields;    //原始的字段名（未转换）

    private List<Map<String, Object>> items;    //具体的数据

    public List<String> getFields() {
        return fields;
    }

    public void setFields(List<String> fields) {
        this.fields = fields;
    }

    public List<String> getInitFields() {
        return initFields;
    }

    public void setInitFields(List<String> initFields) {
        this.initFields = initFields;
    }

    public List<Map<String, Object>> getItems() {
        return items;
    }

    public void setItems(List<Map<String, Object>> items) {
        this.items = items;
    }
}
