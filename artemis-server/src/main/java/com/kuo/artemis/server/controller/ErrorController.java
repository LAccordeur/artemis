package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/22
 */
@Controller
@RequestMapping(value = "/error", produces = {"application/json;charset=utf8"})
public class ErrorController {

    @RequestMapping(value = "/500")
    @ResponseBody
    public Response error500() {
        return new Response(HttpStatus.INTERNAL_SERVER_ERROR.value(), "服务器开小差了 ：(");
    }

    @RequestMapping(value = "/404")
    @ResponseBody
    public Response error404() {
        return new Response(HttpStatus.NOT_FOUND.value(), "您进入了荒芜之地");
    }

    @RequestMapping(value = "/test")
    public Response test() {

        return new Response(HttpStatus.NOT_FOUND.value(), "ce");
    }
}
