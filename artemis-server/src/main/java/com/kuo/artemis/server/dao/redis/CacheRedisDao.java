package com.kuo.artemis.server.dao.redis;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/18
 */
public class CacheRedisDao {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;


    /**
     * 将对象以json的形式保存至缓存中
     * @param key
     * @param object
     */
    public void saveToCache(String key, Object object) {
        try {
            ValueOperations<String, String> operations = stringRedisTemplate.opsForValue();
            ObjectMapper objectMapper = new ObjectMapper();

            //if (operations.get(key) == null) {
                operations.set(key, objectMapper.writeValueAsString(object), 1000*60*24);
            //}
        } catch (JsonProcessingException e) {
            e.getMessage();
            return;
        }
    }

    public void removeFromCache(String key) {
        stringRedisTemplate.delete(key);
    }
    /**
     * 若缓存中存在则根据key从缓存中取出返回数据
     * @param key
     * @return
     */
    public String getFromCache(String key) {
        String result = null;
        try {
            ValueOperations<String, String> operations = stringRedisTemplate.opsForValue();
            result = operations.get(key);
            if (result == null) {
                //缓存中不存在
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return result;
    }
}
