package com.kuo.artemis.server.core.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import javax.validation.ValidationException;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Response<T> {
    private static final Logger logger = LoggerFactory.getLogger(Response.class);

    /**
     * 默认的错误显示消息
     */
    private static final String DEFAULT_ERROR_MESSAGE = "Oops!不知道发生了什么错！客官对不起！";


    private T data;

    /**
     * 状态码
     */
    private Integer code;

    /**
     * 描述信息
     */
    private String msg;

    public Response(T data, Integer code, String msg) {
        this.data = data;
        this.code = code;
        this.msg = msg;
    }

    public Response(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Response(Throwable throwable) {
        logger.error(throwable.getMessage(), throwable);
        if (throwable instanceof ValidationException || throwable instanceof IllegalArgumentException) {
            this.code = HttpStatus.UNAUTHORIZED.value();
            this.msg = throwable.getMessage();
        } else {
            this.code = HttpStatus.UNAUTHORIZED.value();
            this.msg = DEFAULT_ERROR_MESSAGE;
        }
    }

    public Response() { }

    @Override
    public String toString() {
        return "Response{" +
                "data=" + data +
                ", code=" + code +
                ", msg='" + msg + '\'' +
                '}';
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
