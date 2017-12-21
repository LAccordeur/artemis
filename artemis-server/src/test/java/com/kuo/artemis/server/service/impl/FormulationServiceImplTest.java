package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.formulation.FormulationParams;
import com.kuo.artemis.server.service.FormulationService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class FormulationServiceImplTest {

    @Resource
    private FormulationService formulationService;

    @Test
    public void createNewFormulation() throws Exception {

        FormulationParams params = new FormulationParams();

        //Integer[] materialIds = {616,617,618,619,620,621,624,628,631,632,634,635,640,645,650,656,660,667,668,689,699,700};

        List<Integer> materialIdList = Arrays.asList(616,617,618,619,620,621,624,628,631,632,634,635,640,645,650,656,660,667,668,689,699,700);

        List<Double> leftBound = Arrays.asList(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        params.setMaterialIdList(materialIdList);
        params.setNutritionStandardId("1");
        params.setMaterialLeftBoundList(leftBound);
        System.out.println("-----------------------------------------------------------");
        System.out.println(formulationService.programNewFormulation(params));
        System.out.println("-----------------------------------------------------------");
    }

}