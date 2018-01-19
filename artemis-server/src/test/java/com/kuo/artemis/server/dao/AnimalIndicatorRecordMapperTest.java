package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.AnimalIndicatorRecord;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class AnimalIndicatorRecordMapperTest {

    @Resource
    private AnimalIndicatorRecordMapper animalIndicatorRecordMapper;

    @Test
    public void selectRecordsDetail() throws Exception {

        List<AnimalIndicatorRecord> animalIndicatorRecords = animalIndicatorRecordMapper.selectRecordsDetail(20, "a", 0);

        for (AnimalIndicatorRecord record : animalIndicatorRecords) {
            System.out.println(record);
        }
    }

}