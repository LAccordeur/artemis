package com.kuo.artemis.server.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class AnimalIndicatorMapperTest {

    @Resource
    private AnimalIndicatorMapper animalIndicatorMapper;

    @Test
    public void selectAllIndicators() throws Exception {
        System.out.println(animalIndicatorMapper.selectAllIndicators().size());
    }

    @Test
    public void selectIndicatorTypes() throws Exception {
        System.out.println(animalIndicatorMapper.selectIndicatorTypes());
    }

    @Test
    public void selectIndicatorsByType() throws Exception {
        System.out.println(animalIndicatorMapper.selectIndicatorsByType(2));
    }

}