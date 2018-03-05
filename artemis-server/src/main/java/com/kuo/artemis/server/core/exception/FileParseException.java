package com.kuo.artemis.server.core.exception;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/4
 */
public class FileParseException extends RuntimeException {

    public FileParseException() {
    }

    public FileParseException(String message) {
        super(message);
    }

    public FileParseException(String message, Throwable cause) {
        super(message, cause);
    }

    public FileParseException(Throwable cause) {
        super(cause);
    }
}
