package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.dto.excel.DataSaveCommand;
import com.kuo.artemis.server.core.exception.DataException;
import com.kuo.artemis.server.service.AnimalIndicatorRecordService;
import com.kuo.artemis.server.util.constant.PermissionConst;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/27
 */
@Controller
@RequestMapping(value = "/api/data", produces = {"application/json;charset=utf8"})
public class RecordDataController {

    @Inject
    private AnimalIndicatorRecordService animalIndicatorRecordService;

    @Inject
    private ApplicationContext applicationContext;

    @Authority(value = PermissionConst.DATA_MANAGEMENT_RECORD)
    @ResponseBody
    @RequestMapping(value = "/import", method = RequestMethod.POST)
    public Response importAnimalRecordData(@RequestBody DataImportCommand command, @RequestParam(value = "userId", required = false) String userId, @RequestParam(value = "projectId", required = false) String projectId) throws Exception {
        //return animalIndicatorRecordService.createNewRecordVersion(command);
        return animalIndicatorRecordService.createRecordVersion(command);
    }

    @Authority(value = PermissionConst.DATA_MANAGEMENT_RECORD)
    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Response updateAnimalRecordData(@RequestBody DataSaveCommand command, @RequestParam(value = "userId", required = false) String userId, @RequestParam(value = "projectId", required = false) String projectId) throws DataException {
        return animalIndicatorRecordService.saveCurrentRecord(command);
    }

    @Authority(value = PermissionConst.DATA_MANAGEMENT_RECORD)
    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public Response deleteData(String projectId, String fileIdentifier, String version, String userId) {
        return animalIndicatorRecordService.deleteCurrentVersion(projectId, fileIdentifier, version);
    }

    @Authority(value = PermissionConst.DATA_VIEW_RECORD)
    @ResponseBody
    @RequestMapping(value = "/files", method = RequestMethod.GET)
    public Response getDataFileList(String projectId, String userId) {
        return animalIndicatorRecordService.listIndicatorRecords(projectId);
    }

    @Authority(value = PermissionConst.DATA_VIEW_RECORD)
    @ResponseBody
    @RequestMapping(value = "/file/version", method = RequestMethod.GET)
    public Response getDataFileVersions(String projectId, String fileIdentifier, String userId) {
        return animalIndicatorRecordService.listIndicatorRecordVersions(projectId, fileIdentifier);
    }

    @Authority(value = PermissionConst.DATA_VIEW_RECORD)
    @ResponseBody
    @RequestMapping(value = "/file/detail", method = RequestMethod.GET)
    public Response getDataFileDetail(String projectId, String fileIdentifier, String version, String userId, HttpServletRequest request) {
        //return animalIndicatorRecordService.getIndicatorRecordDetail(projectId, fileIdentifier, version);
        return animalIndicatorRecordService.listAnimalRecords(projectId, fileIdentifier, version, request, applicationContext);
    }
}
