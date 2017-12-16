package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.IndicatorExcelExportCommand;
import com.kuo.artemis.server.service.FileService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
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
    public Response receiveExcelFile(@RequestParam("file") MultipartFile file, @RequestParam("userId") String userId, @RequestParam("projectId") String projectId, @RequestParam("type") String type) {


        if (!file.isEmpty()) {
            try {
                if ("indicator".equals(type)) {
                    return fileService.parseAndSaveIndicatorExcel(file, userId, projectId);
                } else if ("material".equals(type)) {
                    // something to do
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return new Response(HttpStatus.BAD_REQUEST.value(), "文件错误，上传失败");
    }


    //@RequestMapping(value = "/excel/template/export", method = RequestMethod.POST, produces = {"application/vnd.ms-excel;charset=UTF-8"})
    @RequestMapping(value = "/excel/template/export", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Response exportExcelTemplateFile(@RequestBody IndicatorExcelExportCommand command, HttpServletResponse response) {
        /*try {
            Response<Workbook> result = fileService.exportIndicatorExcelTemplate(command);
            Workbook workbook = result.getData();

            OutputStream outputStream = response.getOutputStream();
            String filename = command.getFileName();
            if (filename == null) {
                filename = "unnamed.xlsx";
            }
            if (!filename.endsWith(".xlsx")) {
                filename = filename + ".xlsx";
            }

            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+ new String((filename).getBytes(), "utf-8"));

            workbook.write(outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }*/

        return fileService.exportIndicatorExcelTemplate(command);

    }

    //@RequestMapping(value = "/excel/data/export", method = RequestMethod.POST, produces = {"application/vnd.ms-excel;charset=UTF-8"})
    @RequestMapping(value = "/excel/data/export", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Response exportExcelWithData(@RequestBody IndicatorExcelExportCommand command, HttpServletResponse response) {
        /*try {
            Response<Workbook> result = fileService.exportIndicatorExcelWithData(command);
            Workbook workbook = result.getData();

            OutputStream outputStream = response.getOutputStream();
            String filename = command.getFileName();
            if (filename == null) {
                filename = "unnamed.xlsx";
            }
            if (!filename.endsWith(".xlsx")) {
                filename = filename + ".xlsx";
            }

            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+ new String((filename).getBytes(), "utf-8"));

            workbook.write(outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }*/

        return fileService.exportIndicatorExcelWithData(command);
    }


}
