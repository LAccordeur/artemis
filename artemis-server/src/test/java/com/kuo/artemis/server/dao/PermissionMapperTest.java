package com.kuo.artemis.server.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class PermissionMapperTest {

    @Resource
    private PermissionMapper permissionMapper;

    @Test
    public void selectViewPermissionIdList() throws Exception {
        System.out.println(permissionMapper.selectViewPermissionIdList());
    }

}