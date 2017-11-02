package com.kuo.artemis.server.dao;

import com.kuo.artemis.server.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserMapperTest {
    @Test
    public void updateByPrimaryKeySelective() throws Exception {
        User user = new User();
        user.setId(1);
        user.setUserEmail("hahaha@gmail.com");
        System.out.println(userMapper.updateByPrimaryKeySelective(user));
    }

    @Test
    public void selectByPhone() throws Exception {
        System.out.println(userMapper.selectByPhone("18936752870"));
    }

    @Resource
    private UserMapper userMapper;

    @Test
    public void selectByEntity() throws Exception {

        User user = new User();
        user.setUserPhone("18936752870");
        user.setUserPassword("test");
        System.out.println(userMapper.selectByEntity(user));
    }

}