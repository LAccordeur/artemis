package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.entity.UserProjectKey;
import com.kuo.artemis.server.service.UserProjectService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class UserProjectServiceImplTest {
    @Test
    public void exitProject() throws Exception {
        UserProjectKey userProjectKey = new UserProjectKey(5,1);
        System.out.println(userProjectService.exitProject(userProjectKey));
    }

    @Resource
    private UserProjectService userProjectService;

    @Test
    public void listProjectsByUserId() throws Exception {
        System.out.println(userProjectService.listProjectsByUserId("1"));
    }

    @Test
    public void listProjectMembersById() throws Exception {
        System.out.println(userProjectService.listProjectMembersById("1"));
    }

}