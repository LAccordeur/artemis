package com.kuo.artemis.server.core.aop;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.math.GroupDesignResult;
import com.kuo.artemis.server.dao.redis.CacheRedisDao;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/19
 */
@Component
@Aspect
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class CacheAspect {

    @Autowired
    private CacheRedisDao cacheRedisDao;

    @Pointcut("execution(* com.kuo.artemis.server.service.AnimalService.* (..))")
    public void cacheAspect(){}


    /**
     * 将分组数据放入缓存  TODO 解析BUG
     * @param point
     * @param result
     */
    //@AfterReturning(value = "cacheAspect()", returning = "result")
    public void afterReturn(JoinPoint point, Object result) {
        String method = point.getSignature().getName();
        Object[] args = point.getArgs();

        if (method.equals("commitAnimalGroupResult")) {
            GroupDesignResult groupDesignResult = (GroupDesignResult) args[0];
            Response response = (Response) result;
            if (HttpStatus.OK.value() == response.getCode()) {
                String key = "animal_group_" + groupDesignResult.getParam().getProjectId();
                Object object = response.getData();
                try {
                    cacheRedisDao.saveToCache(key, object);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
