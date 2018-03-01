package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.animal.ReplicationCalculationParam;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.math.GroupDesignParam;
import com.kuo.artemis.server.core.math.GroupDesignResult;
import com.kuo.artemis.server.service.AnimalIndicatorRecordService;
import com.kuo.artemis.server.service.AnimalService;
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

    @ResponseBody
    @RequestMapping(value = "/replication", method = RequestMethod.POST)
    public Response calculateReplicationNum(@RequestParam("alpha") String alpha, @RequestParam("power") String power, @RequestParam("file") MultipartFile file) {
        return animalService.getReplicateNumber(new ReplicationCalculationParam(alpha, power, file));
    }

    @ResponseBody
    @RequestMapping(value = "/group", method = RequestMethod.POST)
    public Response groupAnimal(@RequestBody GroupDesignParam param, @RequestParam  String projectId, @RequestParam String userId) throws Exception {
        return animalService.groupAnimal(param);
    }

    @ResponseBody
    @RequestMapping(value = "/group/result", method = RequestMethod.GET)
    public Response getAnimalGroupResult(@RequestParam String projectId) throws Exception {
        return animalService.getAnimalGroupResult(projectId);
    }

    @ResponseBody
    @RequestMapping(value = "/group/result", method = RequestMethod.POST)
    public Response commitAnimalGroupResult(@RequestBody GroupDesignResult result) throws Exception {
        return animalService.commitAnimalGroupResult(result);
    }

    @ResponseBody
    @RequestMapping(value = "/group/result", method = RequestMethod.DELETE)
    public Response deleteAnimalGroupResult(String projectId) {
        return animalService.deleteAnimalGroupResult(projectId);
    }


}
