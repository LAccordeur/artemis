package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.ExcelTest;
import com.kuo.artemis.server.entity.User;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

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
    @ResponseBody
    public Response test() {
        ExcelTest test  = new ExcelTest();
        test.setBirthday(new Date());
        return new Response(test,HttpStatus.OK.value(), "test");
    }
}
