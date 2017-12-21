package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.formulation.FormulationParams;
import com.kuo.artemis.server.service.FormulationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

    public Response programNewFormulation(FormulationParams params) {
        return formulationService.programNewFormulation(params);
    }

}
