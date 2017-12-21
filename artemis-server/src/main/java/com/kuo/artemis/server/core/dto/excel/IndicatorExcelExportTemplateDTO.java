package com.kuo.artemis.server.core.dto.excel;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/16
 */
@Deprecated
public class IndicatorExcelExportTemplateDTO {

    private List<String> englishFields;    //指标数据记录模板中的英文表头

    private List<String> chineseFields;    //指标数据记录模板中的中文表头

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
}
