package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.ExcelFileDetail;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ExcelFileDetailMapperTest {

    @Resource
    private ExcelFileDetailMapper excelFileDetailMapper;

    @Test
    public void selectByFileRecordId() throws Exception {

        List<ExcelFileDetail> excelFileDetailList = excelFileDetailMapper.selectByFileRecordId(103);
        System.out.println(excelFileDetailList);

    }

}