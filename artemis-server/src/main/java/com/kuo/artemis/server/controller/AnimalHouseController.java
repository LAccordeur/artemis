package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionParam;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionResult;
import com.kuo.artemis.server.service.AnimalHouseService;
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

    @RequestMapping(value = "/programming", method = RequestMethod.POST)
    @ResponseBody
    public Response doAnimalHouseProgramming(@RequestBody RandomDistributionParam param, @RequestParam String projectId,@RequestParam String userId) {
        return animalHouseService.doHouseProgramming(param);
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    @ResponseBody
    public Response getAnimalHouseProgrammingResult(@RequestParam String projectId, @RequestParam String userId) {
        return animalHouseService.getHouseProgrammingResult(projectId);
    }

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    @ResponseBody
    public Response commitAnimalHouseProgrammingResult(@RequestBody RandomDistributionResult result, @RequestParam String projectId, @RequestParam String userId) {
        return animalHouseService.commitHouseProgrammingResult(result);
    }
}
