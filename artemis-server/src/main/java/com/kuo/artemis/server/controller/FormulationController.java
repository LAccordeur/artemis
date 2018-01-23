package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.formulation.FormulationParams;
import com.kuo.artemis.server.core.dto.formulation.FormulationResult;
import com.kuo.artemis.server.entity.Formulation;
import com.kuo.artemis.server.service.FormulationService;
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
@RequestMapping(value = "/api/formulation", produces = {"application/json;charset=utf8"})
public class FormulationController {

    @Inject
    private FormulationService formulationService;

    @Authority(value = PermissionConst.VIEW_DATA_FORMULA)
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Response listFormulations(String projectId, String userId) {
        return formulationService.listFormulations(projectId);
    }

    @ResponseBody
    @RequestMapping(value = "/list/brief", method = RequestMethod.GET)
    public Response listFormulationsNames(String projectId) {
        return formulationService.listFormulationNames(projectId);
    }

    @ResponseBody
    @RequestMapping(value = "/id", method = RequestMethod.GET)
    public Response getIdByFormulationName(String formulationName) {
        return formulationService.getIdByFormulationName(formulationName);
    }

    @ResponseBody
    @RequestMapping(value = "/name/list", method = RequestMethod.GET)
    public Response listFormulationNames(String projectId) {
        return formulationService.listFormulationNames(projectId);
    }

    @Authority(value = PermissionConst.VIEW_DATA_FORMULA)
    @ResponseBody
    @RequestMapping(value = "/{formulationId}/detail", method = RequestMethod.GET)
    public Response getFormulationDetail(@PathVariable String formulationId) {
        return formulationService.getFormulationDetail(formulationId);
    }

    @ResponseBody
    @RequestMapping(value = "/{formulationId}/material", method = RequestMethod.GET)
    public Response getFormulationMaterialDetail(@PathVariable String formulationId) {
        return formulationService.getFormulationMaterialDetail(formulationId);
    }

    @ResponseBody
    @RequestMapping(value = "/{formulationId}/nutrition", method = RequestMethod.GET)
    public Response getFormulationNutritionDetail(@PathVariable String formulationId) {
        return formulationService.getFormulationNutritionDetail(formulationId);
    }

    @Authority(value = PermissionConst.DELETE_DATA_FORMULA)
    @ResponseBody
    @RequestMapping(value = "/{formulationId}", method = RequestMethod.DELETE)
    public Response deleteFormulation(@PathVariable String formulationId) {
        return formulationService.deleteFormulation(formulationId);
    }

    @Authority(value = PermissionConst.ADD_DATA_GROUP)
    @ResponseBody
    @RequestMapping(value = "/programming", method = RequestMethod.POST)
    public Response programNewFormulation(@RequestBody FormulationParams params) {
        return formulationService.programNewFormulation(params);
    }

    @Authority(value = PermissionConst.ADD_DATA_FORMULA)
    @ResponseBody
    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public Response createNewFormulation(@RequestBody FormulationResult result) {
        return formulationService.createNewFormulation(result);
    }

    @ResponseBody
    @RequestMapping(value = "/intro", method = RequestMethod.POST)
    public Response createFormulationBrief(@RequestBody Formulation formulation) {
        return formulationService.createFormulationBrief(formulation);
    }


}
