package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.command.ExportExcelCommand;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/25
 */
public interface FileService {

    Response parseAndSaveExcel(MultipartFile file, String userId, String projectId) throws Exception;

    Response exportExcelTemplate(ExportExcelCommand command);

    Response exportExcelWithData(ExportExcelCommand command);
}
