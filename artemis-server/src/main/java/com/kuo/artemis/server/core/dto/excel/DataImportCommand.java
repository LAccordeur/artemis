package com.kuo.artemis.server.core.dto.excel;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/23
 */
public class DataImportCommand {

    private String userId;   //导入数据的用户id

    private List<List<String>> dataList;    //二维数组形式的Excel数据

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public List<List<String>> getDataList() {
        return dataList;
    }

    public void setDataList(List<List<String>> dataList) {
        this.dataList = dataList;
    }
}
