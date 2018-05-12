package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionParam;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionResult;
import com.kuo.artemis.server.service.AnimalHouseService;
import com.kuo.artemis.server.util.constant.PermissionConst;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/18
 */
@Controller
@RequestMapping(value = "/api/house", produces = {"application/json;charset=utf8"})
public class AnimalHouseController {

    @Inject
    private AnimalHouseService animalHouseService;

    @Authority(value = PermissionConst.DATA_MANAGEMENT_HOUSE)
    @RequestMapping(value = "/programming", method = RequestMethod.POST)
    @ResponseBody
    public Response doAnimalHouseProgramming(@RequestBody RandomDistributionParam param, @RequestParam(value = "projectId", required = false) String projectId, @RequestParam(value = "userId", required = false) String userId) {
        return animalHouseService.doHouseProgramming(param);
    }

    @Authority(value = PermissionConst.DATA_VIEW_HOUSE)
    @RequestMapping(value = "/result", method = RequestMethod.GET)
    @ResponseBody
    public Response getAnimalHouseProgrammingResult(@RequestParam("projectId") String projectId, @RequestParam(value = "userId", required = false) String userId) {
        return animalHouseService.getHouseProgrammingResult(projectId);
    }

    @Authority(value = PermissionConst.DATA_MANAGEMENT_HOUSE)
    @RequestMapping(value = "/result", method = RequestMethod.POST)
    @ResponseBody
    public Response commitAnimalHouseProgrammingResult(@RequestBody RandomDistributionResult result, @RequestParam(required = false) String projectId, @RequestParam(required = false) String userId) {
        return animalHouseService.commitHouseProgrammingResult(result);
    }

    @Authority(value = PermissionConst.DATA_MANAGEMENT_HOUSE)
    @RequestMapping(value = "/result", method = RequestMethod.DELETE)
    @ResponseBody
    public Response deleteHouseProgrammingResult(@RequestParam String projectId, @RequestParam(required = false) String userId) {
        return animalHouseService.deleteHouseProgrammingResult(projectId);
    }
}
