package com.kuo.artemis.server.core.dto.excel;

import com.kuo.artemis.server.entity.AnimalIndicatorRecord;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/16
 */
public class IndicatorExcelExportDataDTO {
    private List<String> englishFields;    //指标数据记录模板中的英文表头

    private List<String> chineseFields;    //指标数据记录模板中的中文表头

    private List<AnimalIndicatorRecord> dataList;    //指标数据项

    public List<String> getEnglishFields() {
        return englishFields;
    }

    public void setEnglishFields(List<String> englishFields) {
        this.englishFields = englishFields;
    }

    public List<String> getChineseFields() {
        return chineseFields;
    }

    public void setChineseFields(List<String> chineseFields) {
        this.chineseFields = chineseFields;
    }

    public List<AnimalIndicatorRecord> getDataList() {
        return dataList;
    }

    public void setDataList(List<AnimalIndicatorRecord> dataList) {
        this.dataList = dataList;
    }
}
