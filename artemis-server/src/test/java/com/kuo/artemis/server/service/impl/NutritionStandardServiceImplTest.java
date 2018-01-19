package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.service.NutritionStandardService;
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
public class NutritionStandardServiceImplTest {

    @Resource
    NutritionStandardService nutritionStandardService;

    @Test
    public void createNutritionStandardsBatch() throws Exception {
        List<List<String>> lists = new ArrayList<List<String>>();

        List<String> fieldList = new ArrayList<String>();
        fieldList.add("标准名称");
        fieldList.add("标准水份(%)");
        lists.add(fieldList);

        List<String> valueList = new ArrayList<String>();
        valueList.add("碎米");
        valueList.add("12");
        lists.add(valueList);

        DataImportCommand command = new DataImportCommand();
        command.setUserId("7");
        command.setDataList(lists);

        System.out.println(nutritionStandardService.createNutritionStandardsBatch(command));
    }

}