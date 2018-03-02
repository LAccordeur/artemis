package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.FileRecord;
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
public class FileRecordMapperTest {
    @Test
    public void selectCommonFilesByProjectId() throws Exception {

        System.out.println(fileRecordMapper.selectCommonFilesByProjectId(20));

    }

    @Test
    public void deleteCommonFileById() throws Exception {
        System.out.println(fileRecordMapper.deleteCommonFileById(128));
    }

    @Test
    public void selectIndicatorRecordFileVersions() throws Exception {
        List<FileRecord> fileRecords = fileRecordMapper.selectIndicatorRecordFileVersions(20, "a");

        for (FileRecord fileRecord : fileRecords) {
            System.out.println(fileRecord);
        }
    }

    @Resource
    private FileRecordMapper fileRecordMapper;

    @Test
    public void selectIndicatorRecordFiles() throws Exception {
        List<FileRecord> fileRecordList = fileRecordMapper.selectIndicatorRecordFiles(20);

        for (FileRecord fileRecord : fileRecordList) {
            System.out.println(fileRecord);
        }
    }

}