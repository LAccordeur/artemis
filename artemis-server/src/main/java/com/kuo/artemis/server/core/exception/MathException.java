package com.kuo.artemis.server.core.exception;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/4
 */
public class MathException extends RuntimeException {

    public MathException() {
    }

    public MathException(String message) {
        super(message);
    }

    public MathException(String message, Throwable cause) {
        super(message, cause);
    }

    public MathException(Throwable cause) {
        super(cause);
    }
}
