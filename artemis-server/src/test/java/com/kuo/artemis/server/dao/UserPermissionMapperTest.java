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
public class UserPermissionMapperTest {
    @Test
    public void selectByUserIdAndProjectIdAndPermissionId() throws Exception {
        System.out.println(userPermissionMapper.selectByUserIdAndProjectIdAndPermissionId(1,1,7));
    }

    @Resource
    private UserPermissionMapper userPermissionMapper;

    @Test
    public void selectByUserIdAndProjectId() throws Exception {

        System.out.println(userPermissionMapper.selectByUserIdAndProjectId(1, 1));
    }

}