package com.kuo.artemis.server.core.factory.excel;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.FileImportProduct;
import com.kuo.artemis.server.core.dto.excel.ExcelImportCommand;
import com.kuo.artemis.server.core.dto.excel.IndicatorExcelImportProduct;
import com.kuo.artemis.server.core.factory.FileImportFactory;
import com.kuo.artemis.server.util.constant.DataTypeConst;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/17
 */
@Deprecated
public class ExcelImportFactory extends FileImportFactory {

    protected FileImportProduct handle(FileImportCommand command) throws Exception {
        ExcelImportCommand excelImportCommand = (ExcelImportCommand) command;

        if (DataTypeConst.INDICATOR.equals(excelImportCommand.getDataType())) {
            FileImportProduct fileImportProduct = new IndicatorExcelImportProduct(excelImportCommand);
            return fileImportProduct.handle();
        } else if (DataTypeConst.MATERIAL.equals(excelImportCommand.getDataType())) {

        }

        return null;
    }
}
