package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.service.AnimalIndicatorRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/25
 */
@Controller
@RequestMapping(value = "/api/indicator", produces = {"application/json;charset=utf8"})
public class IndicatorController {

    @Inject
    private AnimalIndicatorRecordService animalIndicatorRecordService;

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Response listAllIndicators() {
        return animalIndicatorRecordService.listAllIndicators();
    }

    @ResponseBody
    @RequestMapping(value = "/types", method = RequestMethod.GET)
    public Response listIndicatorTypes() {
        return animalIndicatorRecordService.listAllIndicatorTypes();
    }

    @ResponseBody
    @RequestMapping(value = "/list_by_type", method = RequestMethod.GET)
    public Response listIndicatorByType(String type) {
        return animalIndicatorRecordService.listIndicatorsByType(type);
    }

}
