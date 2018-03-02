package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.ArrayTest;
import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.dto.excel.ExcelImportCommand;
import com.kuo.artemis.server.core.dto.excel.IndicatorExcelExportCommand;
import com.kuo.artemis.server.core.helper.ExcelHelper;
import com.kuo.artemis.server.service.*;
import com.kuo.artemis.server.util.constant.DataTypeConst;
import com.kuo.artemis.server.util.file.ExcelUtil;
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
import java.util.Map;

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

    @Inject
    private AnimalIndicatorRecordService animalIndicatorRecordService;

    @Inject
    private AnimalService animalService;

    @Inject
    private NutritionStandardService nutritionStandardService;

    @Inject
    private MaterialService materialService;


    @ResponseBody
    @RequestMapping(value = "/common/list", method = RequestMethod.GET)
    public Response listCommonFiles(@RequestParam("projectId") String projectId) {
        return fileService.listCommonFiles(projectId);
    }

    @ResponseBody
    @RequestMapping(value = "/common/upload", method = RequestMethod.POST)
    public Response receiveCommonFile(@RequestParam("file") MultipartFile file, @RequestParam("userId") String userId, @RequestParam("projectId") String projectId) {
        FileImportCommand command = new FileImportCommand(file, projectId, userId, null);
        return fileService.uploadCommonFile(command);
    }

    @ResponseBody
    @RequestMapping(value = "/common", method = RequestMethod.DELETE)
    public Response deleteCommonFile(@RequestParam("fileId") String fileId) {
        return fileService.deleteCommonFile(fileId);
    }

    @RequestMapping(value = "/excel/upload", method = RequestMethod.POST)
    @ResponseBody
    public Response receiveExcelFile(@RequestParam("file") MultipartFile file, @RequestParam("userId") String userId, @RequestParam("projectId") String projectId, @RequestParam("type") String type) {



        if (!file.isEmpty()) {
            String filename = file.getOriginalFilename();
            if ((filename).endsWith(".xlsx") || (filename).endsWith(".xls")) {
                //nothing to do
            } else {
                return new Response(HttpStatus.FORBIDDEN.value(), "文件类型错误");
            }
            try {
                if ((DataTypeConst.INDICATOR).equals(type)) {
                    FileImportCommand command = new FileImportCommand(file, projectId, userId, DataTypeConst.INDICATOR);
                    DataImportCommand dataImportCommand = ExcelHelper.parseExcelFile(command);
                    return animalIndicatorRecordService.createRecordVersion(dataImportCommand);
                } else if ((DataTypeConst.MATERIAL).equals(type)) {
                    FileImportCommand command = new FileImportCommand(file, projectId, userId, DataTypeConst.MATERIAL);
                    DataImportCommand dataImportCommand = ExcelHelper.parseExcelFile(command);
                    return materialService.createNewMaterialBatch(dataImportCommand);
                } else if ((DataTypeConst.NUTRITION).equals(type)) {
                    FileImportCommand command = new FileImportCommand(file, projectId, userId, DataTypeConst.NUTRITION);
                    DataImportCommand dataImportCommand = ExcelHelper.parseExcelFile(command);
                    return nutritionStandardService.createNutritionStandardsBatch(dataImportCommand);
                } else if ((DataTypeConst.ANIMAL).equals(type)) {
                    FileImportCommand command = new FileImportCommand(file, projectId, userId, DataTypeConst.ANIMAL);
                    DataImportCommand dataImportCommand = ExcelHelper.parseExcelFile(command);
                    return animalService.importAnimalBasicList(dataImportCommand);
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
    @Deprecated
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
    @Deprecated
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
