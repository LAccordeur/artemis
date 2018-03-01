package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.service.CommonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/1
 */
@Controller
@RequestMapping(value = "/api", produces = {"application/json;charset=utf8"})
public class CommonController {

    @Inject
    private CommonService commonService;

    @ResponseBody
    @RequestMapping(value = "/code/phone", method = RequestMethod.GET)
    public Response sendSmsCode(String phone) {
        return commonService.sendSmsCode(phone);
    }
}
