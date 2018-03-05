package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.animal.ReplicationCalculationParam;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.math.GroupDesignParam;
import com.kuo.artemis.server.core.math.GroupDesignResult;
import com.kuo.artemis.server.entity.Permission;
import com.kuo.artemis.server.service.AnimalIndicatorRecordService;
import com.kuo.artemis.server.service.AnimalService;
import com.kuo.artemis.server.util.constant.PermissionConst;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/21
 */
@Controller
@RequestMapping(value = "/api/animal", produces = {"application/json;charset=utf8"})
public class AnimalController {

    @Inject
    private AnimalService animalService;

    @Authority(value = PermissionConst.DATA_VIEW_GROUP)
    @ResponseBody
    @RequestMapping(value = "/replication", method = RequestMethod.POST)
    public Response calculateReplicationNum(@RequestParam("alpha") String alpha, @RequestParam("power") String power, @RequestParam("file") MultipartFile file, @RequestParam("userId") String userId, @RequestParam("projectId") String projectId) {
        return animalService.getReplicateNumber(new ReplicationCalculationParam(alpha, power, file));
    }

    @Authority(value = PermissionConst.DATA_VIEW_GROUP)
    @ResponseBody
    @RequestMapping(value = "/group", method = RequestMethod.POST)
    public Response groupAnimal(@RequestBody GroupDesignParam param, @RequestParam("projectId")  String projectId, @RequestParam("userId") String userId) throws Exception {
        return animalService.groupAnimal(param);
    }

    @Authority(value = PermissionConst.DATA_VIEW_GROUP)
    @ResponseBody
    @RequestMapping(value = "/group/result", method = RequestMethod.GET)
    public Response getAnimalGroupResult(@RequestParam("projectId") String projectId, @RequestParam("userId") String userId) throws Exception {
        return animalService.getAnimalGroupResult(projectId);
    }

    @Authority(value = PermissionConst.DATA_MANAGEMENT_GROUP)
    @ResponseBody
    @RequestMapping(value = "/group/result", method = RequestMethod.POST)
    public Response commitAnimalGroupResult(@RequestBody GroupDesignResult result, @RequestParam("userId") String userId, @RequestParam("projectId") String projectId) throws Exception {
        return animalService.commitAnimalGroupResult(result);
    }

    @Authority(value = PermissionConst.DATA_MANAGEMENT_GROUP)
    @ResponseBody
    @RequestMapping(value = "/group/result", method = RequestMethod.DELETE)
    public Response deleteAnimalGroupResult(@RequestParam("projectId") String projectId, @RequestParam("userId") String userId) {
        return animalService.deleteAnimalGroupResult(projectId);
    }


}
