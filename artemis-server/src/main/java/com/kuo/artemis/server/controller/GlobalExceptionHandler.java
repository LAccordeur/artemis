package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.exception.MathException;
import org.apache.commons.fileupload.FileUploadBase;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

/**
 * @Author : guoyang
 * @Description : 全局异常处理类，捕获所有Controller中抛出的异常
 * @Date : Created on 2018/3/3
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    private final static Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ResponseBody
    @ExceptionHandler({FileUploadBase.SizeLimitExceededException.class, MaxUploadSizeExceededException.class})
    public Response maxUploadSizeExceededExceptionHandler(Exception e) {
        logger.error(e.toString());
        return new Response(HttpStatus.BAD_REQUEST.value(), "文件过大");
    }


    @ResponseBody
    @ExceptionHandler(RuntimeException.class)
    public Response runtimeExceptionHandler(RuntimeException e) {
        logger.error(e.toString());
        return new Response(HttpStatus.INTERNAL_SERVER_ERROR.value(), "服务器开小差了 :(");
    }

    public Response mathExceptionHandler(MathException e) {
        logger.error(e.toString());
        return new Response(HttpStatus.BAD_REQUEST.value(), "数据运算错误，请检查数据");
    }
}
