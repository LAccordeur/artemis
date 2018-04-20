package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Animal;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class AnimalMapperTest {
    @Test
    public void selectIdMap() throws Exception {
        List<String> ids = new ArrayList<String>();
        ids.add("T1");
        ids.add("T2");
        Map<String, Animal> result = animalMapper.selectIdMap(ids, 27, "-17837", 1);
        System.out.println(result);
    }

    public static void main(String[] args) throws Exception {
        AnimalMapperTest animalMapperTest = new AnimalMapperTest();
        animalMapperTest.selectIdMap();
    }

    @Resource
    private AnimalMapper animalMapper;

    /*@Test
    public void insertBatch() throws Exception {

        List<Animal> animals = new ArrayList<Animal>();
        Animal animal = new Animal();
        animal.setId("h2irhkfnskar23r423sf23");
        animal.setProjectId(20);
        animals.add(animal);

        animalMapper.insertBatch(animals);
    }*/

}

