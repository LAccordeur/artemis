package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.helper.QCloudHelper;
import com.kuo.artemis.server.entity.ExcelTest;
import com.kuo.artemis.server.entity.ExcelTestTwo;
import com.kuo.artemis.server.service.CommonService;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.File;
import java.io.InputStream;
import java.util.Date;

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

    @ResponseBody
    @RequestMapping(value = "/test/se", method = RequestMethod.GET)
    public Response testJsonSeri() {
        ExcelTest excelTest = new ExcelTest();
        excelTest.setBirthday(new Date());
        excelTest.setCreateTime(new Date());
        return new Response(excelTest, HttpStatus.OK.value(), "dd");
    }

    @ResponseBody
    @RequestMapping(value = "/test/un", method = RequestMethod.POST)
    public Response testJsonUnSeti(@RequestBody ExcelTest excelTest) {
        System.out.println(excelTest.toString());
        return new Response(HttpStatus.OK.value(), "tr");
    }

    /*@ResponseBody
    @RequestMapping(value = "/file", method = RequestMethod.POST)
    public Response updateCommonFile(@RequestParam("file") MultipartFile file) {
        File originFile;
        try {
            InputStream inputStream = file.getInputStream();
            QCloudHelper.updateFile(inputStream, "input_stream_test");
        } catch (Exception e) {
            e.printStackTrace();
            return new Response(HttpStatus.BAD_REQUEST.value(), "failure");
        }

        return new Response(HttpStatus.OK.value(), "success");
    }*/
}
