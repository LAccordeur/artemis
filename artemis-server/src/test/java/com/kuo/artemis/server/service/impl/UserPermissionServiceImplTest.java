package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.service.UserPermissionService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class UserPermissionServiceImplTest {
    @Test
    public void addPermission() throws Exception {
        userPermissionService.removePermission("1", "1", "19", "2");
    }

    @Test
    public void removePermission() throws Exception {
        userPermissionService.addPermission("1", "1", "19", "2");

    }

    @Test
    public void listUserPermissionsByProjectId() throws Exception {

        System.out.println(userPermissionService.listUserPermissionsByProjectId("1"));
    }

    @Resource
    private UserPermissionService userPermissionService;

    @Test
    public void getUserPermissionByUserIdAndProjectId() throws Exception {
        System.out.println(userPermissionService.getUserPermissionByUserIdAndProjectId("1", "1"));
        System.out.println(userPermissionService.getUserPermissionByUserIdAndProjectId("2", "2"));
    }

}