package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.ExcelTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ExcelTestMapperTest {
    @Test
    public void insertSelective() throws Exception {
        /*ExcelTest excelTest = new ExcelTest();
        excelTest.setAge(12);
        excelTest.setName("测试");
        excelTest.setScore(88L);
        excelTestMapper.insert(excelTest);*/
    }

    @Resource
    private ExcelTestMapper excelTestMapper;

    @Test
    public void insertBatch() throws Exception {
        List<Object> list = new ArrayList();
        list.add("测试");
        list.add("66.6");
        list.add("18");
        list.add("1998-12-01");

        List<List<Object>> lists = new ArrayList<List<Object>>();
        lists.add(list);
        excelTestMapper.insertBatch(list);
    }

}