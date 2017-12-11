package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.ExcelTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.*;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ExcelTestMapperTest {
    @Test
    public void selectSelective() throws Exception {
        List<String> columns = new ArrayList<String>();
        columns.add("name");
        columns.add("create_time");
        System.out.println(excelTestMapper.selectSelective(columns));

    }

    @Test
    public void insertSelective() throws Exception {
        /*ExcelTest excelTest = new ExcelTest();
        excelTest.setAge(12);
        excelTest.setName("测试");
        excelTest.setScore(88L);
        excelTestMapper.insert(excelTest);*/
        BaseMapper baseMapper = excelTestMapper;
        Class[] classes = baseMapper.getClass().getInterfaces();
        System.out.println("length:" + classes.length);
        for (int i = 0; i < classes.length; i++)
        System.out.println(classes[i].getSimpleName());


        Map<String, Class> fieldClassMap = new HashMap<String, Class>();
        Class<?> clazz = null;
        try {
            clazz = Class.forName("com.kuo.artemis.server.entity.AnimalGrowthRecord");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            fieldClassMap.put(field.getName(), clazz);
        }

        System.out.println(fieldClassMap);

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