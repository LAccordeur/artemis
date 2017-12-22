package com.kuo.artemis.server.core.dto;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author : guoyang
 * @Description : 经过处理过的文件导入产品
 * @Date : Created on 2017/12/17
 */
@Deprecated
public abstract class FileImportProduct<T> {

    private String filename;    //导入的文件名

    private String userId;

    private String projectId;

    private String fileType;    //导入的文件类型（excel or word...）

    private String dataType;    //数据类型（指标数据or原料数据...）

    private String operationType;    //操作类型

    private T data;    //文件中的数据(word)

    private List<String> initFieldList;    //Excel文件中的初始字段名

    private List<String> fields;  //Excel表的所有字段名列表，名字形如initialBw即Java驼峰型

    private List<Map<String, Object>>  unClassifiedItems;    //未经分类处理的excel数据行

    private Set<Class> classes;    //Excel表中所有字段来自的类集合

    private Map<Class, List<Map<String, Object>>> items;   //key为类名， List为Excel中的指标数据（经过分类处理的excel数据行）


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

    public abstract FileImportProduct handle() throws Exception;

    public String getOperationType() {
        return operationType;
    }

    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }

    public Object hook(Object o) {
        return o;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
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

    public List<String> getInitFieldList() {
        return initFieldList;
    }

    public void setInitFieldList(List<String> initFieldList) {
        this.initFieldList = initFieldList;
    }

    public List<String> getFields() {
        return fields;
    }

    public void setFields(List<String> fields) {
        this.fields = fields;
    }

    public List<Map<String, Object>> getUnClassifiedItems() {
        return unClassifiedItems;
    }

    public void setUnClassifiedItems(List<Map<String, Object>> unClassifiedItems) {
        this.unClassifiedItems = unClassifiedItems;
    }

    public Set<Class> getClasses() {
        return classes;
    }

    public void setClasses(Set<Class> classes) {
        this.classes = classes;
    }

    public Map<Class, List<Map<String, Object>>> getItems() {
        return items;
    }

    public void setItems(Map<Class, List<Map<String, Object>>> items) {
        this.items = items;
    }
}
