package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.entity.Material;
import com.kuo.artemis.server.service.MaterialService;
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
@RequestMapping(value = "/api/material", produces = {"application/json;charset=utf8"})
public class MaterialController {

    @Inject
    private MaterialService materialService;

    @Authority(value = PermissionConst.VIEW_DATA_MATERIAL)
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Response listMaterials(String userId) {
        return materialService.listMaterials(userId);
    }

    @Authority(value = PermissionConst.VIEW_DATA_MATERIAL)
    @ResponseBody
    @RequestMapping(value = "/list/brief", method = RequestMethod.GET)
    public Response listMaterialsBrief(String userId) {
        return materialService.listMaterialsBrief(userId);
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public Response addMaterials(@RequestBody DataImportCommand command) throws Exception {
        return materialService.createNewMaterialBatch(command);
    }

    @Authority(value = PermissionConst.VIEW_DATA_MATERIAL)
    @ResponseBody
    @RequestMapping(value = "/{materialId}/detail", method = RequestMethod.GET)
    public Response getMaterialDetail(@PathVariable("materialId") String materialId) {
        return materialService.getMaterialDetail(materialId);
    }

    @Authority(value = PermissionConst.DATA_MANAGEMENT_MATERIAL)
    @ResponseBody
    @RequestMapping(value = "/{materialId}/detail", method = RequestMethod.PUT)
    public Response updateMaterialDetail(@RequestBody Material material, @RequestParam("userId") String userId) {
        return materialService.updateMaterialDetail(material, userId);
    }

}
