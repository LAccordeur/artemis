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

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class StatisticsServiceImplTest {
    @Test
    public void selectIndicatorSet() throws Exception {

        System.out.println(statisticsService.selectIndicatorSet("20", "-10548", "1"));

    }

    @Test
    public void oneWayAnalysisOfVariance() throws Exception {

        StatisticsParam param = new StatisticsParam();
        param.setProjectId("20");
        param.setUserId("6");
        param.setVersion("1");
        param.setFileIdentifier("141415");
        param.setStatisticsMethod("1");
        List<String> indicatorIds = new ArrayList<String>();
        indicatorIds.add("333");
        indicatorIds.add("332");
        param.setIndicatorIdList(indicatorIds);

        System.out.println(statisticsService.oneWayAnalysisOfVariance(param));

    }

    @Test
    public void twoWayAnalysisOfVariance() throws Exception {
        StatisticsParam param = new StatisticsParam();
        param.setProjectId("20");
        param.setUserId("6");
        param.setVersion("4");
        param.setFileIdentifier("110174");
        param.setStatisticsMethod("3");
        param.setStatisticsCode("FCR的双因素方差分析");
        List<String> indicatorIds = new ArrayList<String>();
        indicatorIds.add("181");
        indicatorIds.add("182");
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
        param.setFileIdentifier("-11092");
        param.setStatisticsMethod("1");
        List<String> indicatorIds = new ArrayList<String>();
        indicatorIds.add("36");
        indicatorIds.add("37");
        param.setIndicatorIdList(indicatorIds);

        Response response = statisticsService.independentSampleTTest(param);

        System.out.println(response);
    }

}