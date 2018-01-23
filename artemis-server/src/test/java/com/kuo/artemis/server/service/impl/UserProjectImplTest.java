package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.math.GroupDesignParam;
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

    @Test
    public void test() {
        TestHH testHH = new TestHH();
        int a = testHH.getA();
        System.out.println(a);
    }


}

class TestHH {
    private int a;

    public int getA() {
        return a;
    }

    public void setA(int a) {
        this.a = a;
    }
}