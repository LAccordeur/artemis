package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.helper.ExcelHelper;
import com.kuo.artemis.server.entity.ExcelTest;
import com.kuo.artemis.server.service.FileService;
import com.kuo.artemis.server.util.file.ExcelUtil;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author : guoyang
 * @Description : 用于处理文件上传下载的Controller
 * @Date : Created on 2017/11/25
 */
@Controller
@RequestMapping(value = "/api/file")
public class FileController {

    @Inject
    private FileService fileService;

    @RequestMapping(value = "/excel/upload", method = RequestMethod.POST)
    @ResponseBody
    public Response receiveExcelFile(@RequestParam("file") MultipartFile file) {

        if (!file.isEmpty()) {
            try {
                return fileService.parseAndSaveExcel(file);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return new Response(HttpStatus.BAD_REQUEST.value(), "上传失败");
    }


    @RequestMapping(value = "/excel/download")
    public Response sendExcelFile(HttpServletResponse response) {
        try {
            OutputStream outputStream = response.getOutputStream();
            String filename = "test.xlsx";
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+ new String((filename).getBytes(), "iso-8859-1"));
            List<String> list = new ArrayList<String>();
            list.add("test");
            List<List> lists = new ArrayList<List>();
            lists.add(list);
            lists.add(list);
            Workbook workbook = ExcelUtil.exportExcel(list, lists);
            workbook.write(outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
