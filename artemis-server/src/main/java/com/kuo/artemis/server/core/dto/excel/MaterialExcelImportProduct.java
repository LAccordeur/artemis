package com.kuo.artemis.server.core.dto.excel;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.FileImportProduct;
import com.kuo.artemis.server.core.helper.ExcelHelper;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/17
 */
public class MaterialExcelImportProduct extends FileImportProduct {

    private FileImportCommand command;

    public MaterialExcelImportProduct(FileImportCommand command) {
        this.command = command;
    }

    public FileImportProduct handle() throws Exception {
        ExcelImportCommand excelImportCommand = null;
        if (command instanceof ExcelImportCommand) {
            excelImportCommand = (ExcelImportCommand) command;
        }

        FileImportProduct product = new MaterialExcelImportProduct(excelImportCommand);
        MaterialExcelImportDTO materialExcelImportDTO = ExcelHelper.parseMaterialExcel(command);
        product.setData(materialExcelImportDTO);


        return null;
    }
}
