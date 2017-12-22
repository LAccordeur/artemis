package com.kuo.artemis.server.core.factory;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.FileImportProduct;


/**
 * @Author : guoyang
 * @Description : 文件导入的工厂类
 * @Date : Created on 2017/12/17
 */
@Deprecated
public abstract class FileImportFactory {

    public FileImportProduct createFileImportProduct(FileImportCommand command) throws Exception {

        FileImportProduct product = handle(command);
        return product;
    }

    protected abstract FileImportProduct handle(FileImportCommand command) throws Exception;
}
