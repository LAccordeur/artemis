package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.ExcelImportCommand;
import com.kuo.artemis.server.core.dto.excel.IndicatorExcelExportCommand;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/25
 */
public interface FileService {

    Response parseAndSaveIndicatorExcel(ExcelImportCommand command) throws Exception;

    Response parseAndSaveMaterialExcel(ExcelImportCommand command) throws Exception;

    Response parseAndSaveNutritionStandardExcel(ExcelImportCommand command) throws Exception;

    Response exportIndicatorExcelTemplate(IndicatorExcelExportCommand command);

    Response exportIndicatorExcelWithData(IndicatorExcelExportCommand command);
}
