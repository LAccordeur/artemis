package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.statistics.StatisticsParam;
import com.kuo.artemis.server.service.StatisticsService;
import com.kuo.artemis.server.util.ValidationUtil;
import com.kuo.artemis.server.util.constant.StatisticsMethodConst;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    public Response getIndicatorSet(@RequestParam String projectId, @RequestParam String fileIdentifier, @RequestParam String version) {
        return statisticsService.selectIndicatorSet(projectId, fileIdentifier, version);
    }

    @ResponseBody
    @RequestMapping(value = "/analysis", method = RequestMethod.POST)
    public Response statisticsAnalyse(@RequestBody StatisticsParam param) {
        try {
            ValidationUtil.getInstance().validateParams(param);
        } catch (Exception e) {
            return new Response(e);
        }

        String method = param.getStatisticsMethod();
        if (StatisticsMethodConst.T_TEST.equals(method)) {
            return statisticsService.independentSampleTTest(param);
        } else if (StatisticsMethodConst.ONE_WAY_ANOVA.equals(method)) {
            return statisticsService.oneWayAnalysisOfVariance(param);
        } else if (StatisticsMethodConst.TWO_WAY_ANOVA.equals(method)) {
            return statisticsService.twoWayAnalysisOfVariance(param);
        }

        return new Response(HttpStatus.BAD_REQUEST.value(), "参数有误");
    }


}
