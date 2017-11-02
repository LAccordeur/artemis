package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.UserProject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserProjectMapperTest {

    @Resource
    private UserProjectMapper userProjectMapper;

    /*@Test
    public void selectProjectListByUserId() throws Exception {

        UserProject userProject = new UserProject();
        userProject.setProjectId(1);
        userProject.setUserId(1);
        System.out.println(userProjectMapper.selectProjectListByUserId(String.valueOf(1)));
    }

    @Test
    public void selectUserListByProjectId() throws Exception {
        System.out.println(userProjectMapper.selectUserListByProjectId(String.valueOf(1)));
    }*/

    @Test
    public void insertDefault() throws Exception {
    }

    @Test
    public void insertByInvitation() throws Exception {
    }

    @Test
    public void insertByApplication() throws Exception {
    }

    @Test
    public void updateByAcceptInvitation() throws Exception {
    }

    @Test
    public void updateByRefuseInvitation() throws Exception {
    }

    @Test
    public void updateByAcceptApplication() throws Exception {
    }

    @Test
    public void updateByRefuseApplication() throws Exception {
    }

    @Test
    public void deleteUser() throws Exception {
    }

}