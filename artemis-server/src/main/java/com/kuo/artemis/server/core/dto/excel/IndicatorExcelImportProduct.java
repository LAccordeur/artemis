package com.kuo.artemis.server.core.dto.excel;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.FileImportProduct;
import com.kuo.artemis.server.core.helper.ExcelHelper;
import com.kuo.artemis.server.util.constant.DataTypeConst;
import com.kuo.artemis.server.util.constant.FileTypeConst;
import com.kuo.artemis.server.util.constant.OperationTypeConst;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/17
 */
@Deprecated
public class IndicatorExcelImportProduct extends FileImportProduct {

    private FileImportCommand command;

    public IndicatorExcelImportProduct(FileImportCommand command) {
        this.setDataType(DataTypeConst.INDICATOR);
        this.setFileType(FileTypeConst.EXCEL);
        this.setOperationType(OperationTypeConst.UPLOAD);
        this.command = command;
    }

    public FileImportProduct handle() throws Exception {

        ExcelImportCommand excelImportCommand = null;
        if (command instanceof ExcelImportCommand) {
             excelImportCommand = (ExcelImportCommand) command;
        }

        IndicatorExcelImportDTO indicatorExcelImportDTO = ExcelHelper.parseIndicatorExcel(excelImportCommand);
        this.setInitFieldList(indicatorExcelImportDTO.getIndicators());
        this.setClasses(indicatorExcelImportDTO.getClasses());
        this.setItems(indicatorExcelImportDTO.getItems());
        this.setFields(indicatorExcelImportDTO.getFields());

        return this;
    }
}
