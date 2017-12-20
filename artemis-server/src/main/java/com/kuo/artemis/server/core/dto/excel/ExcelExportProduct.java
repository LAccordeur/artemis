package com.kuo.artemis.server.core.dto.excel;

import com.kuo.artemis.server.core.dto.FileExportProduct;
import com.kuo.artemis.server.core.dto.FileImportProduct;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public class ExcelExportProduct extends FileExportProduct<List> {

    private List<String> englishFields;    //指标数据记录模板中的英文表头

    private List<String> chineseFields;    //指标数据记录模板中的中文表头

    public ExcelExportProduct(ExcelExportCommand command) {
        this.setUserId(command.getUserId());
        this.setProjectId(command.getProjectId());
        this.setOperationType(command.getOperationType());
        this.setFileType(command.getFileType());
        this.setDataType(command.getDataType());
    }

    public FileExportProduct handle(List list) {
        this.setData(list);
        return this;
    }

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
