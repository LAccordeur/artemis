package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.dao.UserProjectMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class UserProjectImplTest {

    @Resource
    private UserProjectMapper userProjectMapper;

    @Test
    public void listProjectsByUserId() throws Exception {
        System.out.println(userProjectMapper.selectProjectsByUserId(1));
    }

}