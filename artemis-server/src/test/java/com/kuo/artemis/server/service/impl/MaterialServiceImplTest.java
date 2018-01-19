package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.service.MaterialService;
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
public class MaterialServiceImplTest {

    @Resource
    private MaterialService materialService;

    @Test
    public void createNewMaterialBatch() throws Exception {
        List<List<String>> materialList = new ArrayList<List<String>>();

        List<String> fieldList = new ArrayList<String>();
        fieldList.add("原料名称");
        fieldList.add("标准水份(%)");
        materialList.add(fieldList);

        List<String> valueList = new ArrayList<String>();
        valueList.add("碎米");
        valueList.add("12");
        materialList.add(valueList);

        DataImportCommand command = new DataImportCommand();
        command.setUserId("7");
        command.setDataList(materialList);

        System.out.println(materialService.createNewMaterialBatch(command));


    }

}