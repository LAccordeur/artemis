package com.kuo.artemis.server.dao;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kuo.artemis.server.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/18
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring-dao.xml")
public class RedisSpringTest {

    @Autowired
    private StringRedisTemplate template;

    @Test
    public void test() throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        User user = new User();
        user.setUserEmail("34234");
        template.opsForValue().set("testjson", objectMapper.writeValueAsString(user));

        System.out.println(template.opsForValue().get("testjson"));


    }
}