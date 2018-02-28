package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.statistics.StatisticsParam;
import com.kuo.artemis.server.service.StatisticsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description : 用于统计分析操作的controller
 * @Date : Created on 2018/2/28
 */
@Controller
@RequestMapping(value = "/api/statistics", produces = {"application/json;charset=utf8"})
public class StatisticsController {

    @Inject
    private StatisticsService statisticsService;

    @ResponseBody
    @RequestMapping(value = "/records", method = RequestMethod.GET)
    public Response listStatisticsRecords(String projectId) {
        return statisticsService.listStatisticsRecords(projectId);
    }

    @ResponseBody
    @RequestMapping(value = "/records/{recordId}", method = RequestMethod.GET)
    public Response getStatisticsRecordDetail(@PathVariable("recordId") String recordId) {
        return statisticsService.getStatisticsRecordDetail(recordId);
    }

    @ResponseBody
    @RequestMapping(value = "/records/{recordId}", method = RequestMethod.DELETE)
    public Response deleteStatisticsRecord(@PathVariable("recordId") String recordId) {
        return statisticsService.deleteStatisticsRecord(recordId);
    }

    @ResponseBody
    @RequestMapping(value = "/indicators", method = RequestMethod.GET)
    public Response getIndicatorSet(String projectId, String fileIdentifier, String version) {
        return statisticsService.selectIndicatorSet(projectId, fileIdentifier, version);
    }

    public Response statisticsAnalyse(StatisticsParam param) {
        return null;
    }


}
