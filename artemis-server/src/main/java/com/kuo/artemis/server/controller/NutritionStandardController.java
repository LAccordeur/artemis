package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.service.NutritionStandardService;
import com.kuo.artemis.server.util.constant.PermissionConst;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/21
 */
@Controller
@RequestMapping(value = "/api/nutrition", produces = {"application/json;charset=utf8"})
public class NutritionStandardController {

    @Inject
    private NutritionStandardService nutritionStandardService;

    @Authority(value = PermissionConst.VIEW_DATA_MATERIAL)
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Response listNutritionStandards(String userId) {
        return nutritionStandardService.listNutritionStandards(userId);
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public Response addNutritionStandards(@RequestBody DataImportCommand command) throws Exception {
        return nutritionStandardService.createNutritionStandardsBatch(command);
    }

    @Authority(value = PermissionConst.VIEW_DATA_MATERIAL)
    @ResponseBody
    @RequestMapping(value = "/list/brief", method = RequestMethod.GET)
    public Response listNutritionStandardsBrief(String userId) {
        return nutritionStandardService.listNutritionStandardsBrief(userId);
    }


    @Authority(value = PermissionConst.VIEW_DATA_MATERIAL)
    @ResponseBody
    @RequestMapping(value = "/{nutritionStandardId}/detail", method = RequestMethod.GET)
    public Response getNutritionStandard(@PathVariable("nutritionStandardId") String nutritionId) {
        return nutritionStandardService.getNutritionStandardDetail(nutritionId);
    }


}
