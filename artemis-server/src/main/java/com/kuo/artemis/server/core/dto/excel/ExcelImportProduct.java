package com.kuo.artemis.server.core.dto.excel;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.FileImportProduct;
import com.kuo.artemis.server.core.helper.ExcelHelper;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/17
 */
@Deprecated
public class ExcelImportProduct extends FileImportProduct {

    private FileImportCommand command;

    public ExcelImportProduct(FileImportCommand command) {
        this.command = command;
    }

    public FileImportProduct handle() throws Exception {
        ExcelImportCommand excelImportCommand = null;
        if (command instanceof ExcelImportCommand) {
            excelImportCommand = (ExcelImportCommand) command;
        }

        FileImportProduct product = new ExcelImportProduct(excelImportCommand);
        ExcelImportDTO excelImportDTO = ExcelHelper.parseMaterialExcel(command);
        product.setData(excelImportDTO);


        return null;
    }
}
