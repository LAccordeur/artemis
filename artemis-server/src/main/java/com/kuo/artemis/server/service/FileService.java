package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/11/25
 */
public interface FileService {

    Response parseAndSaveExcel(MultipartFile file) throws Exception;
}
