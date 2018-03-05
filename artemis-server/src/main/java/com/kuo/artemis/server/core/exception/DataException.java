package com.kuo.artemis.server.core.exception;

/**
 * @Author : guoyang
 * @Description : 文件解析过程中出现的异常数据导致的异常
 * @Date : Created on 2018/3/4
 */
public class DataException extends RuntimeException {

    public DataException(){
        super();
    }

    public DataException(String message) {
        super(message);
    }

    public DataException(String message, Throwable cause) {
        super(message, cause);
    }

    public DataException(Throwable cause) {
        super(cause);
    }
}
