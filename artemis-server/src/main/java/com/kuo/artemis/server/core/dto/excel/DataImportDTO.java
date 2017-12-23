package com.kuo.artemis.server.core.dto.excel;

import java.util.List;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/23
 */
public class DataImportDTO {

    private Map<Class, List> objectList;  //将导入的excel二维数据形式，转换为对象，其中key为对象类名，值为对象列表

    private List commonList;    //上者用于动物指标数据，这个用于一般数据

    public List getCommonList() {
        return commonList;
    }

    public void setCommonList(List commonList) {
        this.commonList = commonList;
    }

    public Map<Class, List> getObjectList() {
        return objectList;
    }

    public void setObjectList(Map<Class, List> objectList) {
        this.objectList = objectList;
    }
}
