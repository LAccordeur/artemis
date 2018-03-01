package com.kuo.artemis.server.dao.redis;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring-dao.xml")
public class CacheRedisDaoTest {

    @Resource
    private CacheRedisDao cacheRedisDao = new CacheRedisDao();

    @Test
    public void saveStringToCache() throws Exception {

        cacheRedisDao.saveStringToCache("18936752870", "456378");
        System.out.println(cacheRedisDao.getFromCache("18936752870"));
        System.out.println(cacheRedisDao.getFromCache("33"));
    }

}