package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.dto.excel.DataSaveCommand;
import com.kuo.artemis.server.service.AnimalIndicatorRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

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

    @ResponseBody
    @RequestMapping(value = "/import", method = RequestMethod.POST)
    public Response importAnimalRecordData(@RequestBody DataImportCommand command) throws Exception {
        //return animalIndicatorRecordService.createNewRecordVersion(command);
        return animalIndicatorRecordService.createRecordVersion(command);
    }

    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Response updateAnimalRecordData(@RequestBody DataSaveCommand command) throws Exception {
        return animalIndicatorRecordService.saveCurrentRecord(command);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public Response deleteData(String projectId, String fileIdentifier, String version) {
        return animalIndicatorRecordService.deleteCurrentVersion(projectId, fileIdentifier, version);
    }

    @ResponseBody
    @RequestMapping(value = "/files", method = RequestMethod.GET)
    public Response getDataFileList(String projectId) {
        return animalIndicatorRecordService.listIndicatorRecords(projectId);
    }

    @ResponseBody
    @RequestMapping(value = "/file/version", method = RequestMethod.GET)
    public Response getDataFileVersions(String projectId, String fileIdentifier) {
        return animalIndicatorRecordService.listIndicatorRecordVersions(projectId, fileIdentifier);
    }

    @ResponseBody
    @RequestMapping(value = "/file/detail", method = RequestMethod.GET)
    public Response getDataFileDetail(String projectId, String fileIdentifier, String version) {
        //return animalIndicatorRecordService.getIndicatorRecordDetail(projectId, fileIdentifier, version);
        return animalIndicatorRecordService.listAnimalRecords(projectId, fileIdentifier, version);
    }
}
