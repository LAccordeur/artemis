package com.kuo.artemis.server.core.factory;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.FileImportProduct;
import com.kuo.artemis.server.core.factory.excel.ExcelImportFactory;
import com.kuo.artemis.server.util.constant.DataTypeConst;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/18
 */
public class FactoryManager {

    public static FileImportProduct createFileImportProduct(FileImportCommand command) throws Exception {

        FileImportFactory fileImportFactory = null;
        if (DataTypeConst.INDICATOR.equals(command.getDataType())) {
            fileImportFactory = new ExcelImportFactory();
        }

        return fileImportFactory.createFileImportProduct(command);
    }
}
