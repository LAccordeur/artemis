package com.kuo.artemis.server.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring-dao.xml")
public class StatisticsDetailItemMapperTest {

    @Resource
    private StatisticsDetailItemMapper statisticsDetailItemMapper;

    @Test
    public void selectTreatmentCodes() throws Exception {

        List<String> treatmentCodes = statisticsDetailItemMapper.selectTreatmentCodes(20, "-11242", 1);
        System.out.println(treatmentCodes);

    }

    @Test
    public void selectTreatmentData() throws Exception {
        List<Double> data = statisticsDetailItemMapper.selectTreatmentData(20, "-11242",1,"1","fcr_week1" );
        System.out.println(data);
    }

}