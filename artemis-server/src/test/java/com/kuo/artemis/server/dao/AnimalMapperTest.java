package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.Animal;
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
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class AnimalMapperTest {

    @Resource
    private AnimalMapper animalMapper;

    @Test
    public void insertBatch() throws Exception {

        List<Animal> animals = new ArrayList<Animal>();
        Animal animal = new Animal();
        animal.setId("h2irhkfnskar23r423sf23");
        animal.setProjectId(20);
        animals.add(animal);

        animalMapper.insertBatch(animals);
    }

}