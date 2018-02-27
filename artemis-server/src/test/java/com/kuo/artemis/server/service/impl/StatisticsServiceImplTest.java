package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.statistics.StatisticsParam;
import com.kuo.artemis.server.service.StatisticsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class StatisticsServiceImplTest {
    @Test
    public void oneWayAnalysisOfVariance() throws Exception {

        StatisticsParam param = new StatisticsParam();
        param.setProjectId("20");
        param.setUserId("6");
        param.setVersion("1");
        param.setFileIdentifier("-11242");
        param.setAnalysisMethod("1");
        List<String> indicatorIds = new ArrayList<String>();
        indicatorIds.add("181");
        indicatorIds.add("182");
        param.setIndicatorIdList(indicatorIds);

        System.out.println(statisticsService.oneWayAnalysisOfVariance(param));

    }

    @Test
    public void twoWayAnalysisOfVariance() throws Exception {
        StatisticsParam param = new StatisticsParam();
        param.setProjectId("20");
        param.setUserId("7");
        param.setVersion("1");
        param.setFileIdentifier("-10548");
        param.setAnalysisMethod("1");
        List<String> indicatorIds = new ArrayList<String>();
        indicatorIds.add("7");
        indicatorIds.add("181");
        param.setIndicatorIdList(indicatorIds);

        System.out.println(statisticsService.twoWayAnalysisOfVariance(param));

    }

    @Test
    public void listStatisticsRecords() throws Exception {

        System.out.println(statisticsService.listStatisticsRecords("20"));
    }

    @Test
    public void getStatisticsRecordDetail() throws Exception {
        System.out.println(statisticsService.getStatisticsRecordDetail("3"));
    }

    @Test
    public void deleteStatisticsRecord() throws Exception {
    }

    @Resource
    private StatisticsService statisticsService;

    @Test
    public void independentSampleTTest() throws Exception {

        StatisticsParam param = new StatisticsParam();
        param.setProjectId("20");
        param.setUserId("6");
        param.setVersion("1");
        param.setFileIdentifier("-11242");
        param.setAnalysisMethod("1");
        List<String> indicatorIds = new ArrayList<String>();
        indicatorIds.add("181");
        indicatorIds.add("182");
        param.setIndicatorIdList(indicatorIds);

        Response response = statisticsService.independentSampleTTest(param);

        System.out.println(response);
    }

}