package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.UpdateUserInfoCommand;
import com.kuo.artemis.server.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class UserServiceImplTest {

    @Resource
    private UserService userService;

    @Test
    public void updateUserInfo() throws Exception {

        UpdateUserInfoCommand command = new UpdateUserInfoCommand();
        command.setId("1");
        command.setEmail("gugugu@gmail.com");

        System.out.println(userService.updateUserInfo(command));
    }

}