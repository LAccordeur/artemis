package com.kuo.artemis.server.core.dto.excel;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author : guoyang
 * @Description : 由于动物指标数据较为特殊 故采用了单独的一个类，用来保存 指标数据的Excel文件 解析后内容的数据结构类
 * @Date : Created on 2017/11/25
 */
public class IndicatorExcelImportDTO extends ExcelImportDTO {
    private String filename;

    private Set<Class> classes;    //Excel表中所有指标来自的类集合

    private Map<Class, List<Map<String, Object>>> multiItems;   //key为类名， List为Excel中的指标数据

    @Override
    public String toString() {
        return "IndicatorExcelImportDTO{" +
                "filename='" + filename + '\'' +
                ", multiItems=" + multiItems +
                '}';
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Map<Class, List<Map<String, Object>>> getMultiItems() {
        return multiItems;
    }

    public void setMultiItems(Map<Class, List<Map<String, Object>>> multiItems) {
        this.multiItems = multiItems;
    }

    public Set<Class> getClasses() {
        return classes;
    }

    public void setClasses(Set<Class> classes) {
        this.classes = classes;
    }
}
