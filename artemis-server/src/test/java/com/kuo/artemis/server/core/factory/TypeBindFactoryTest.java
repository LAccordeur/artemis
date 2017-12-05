package com.kuo.artemis.server.core.factory;

import com.kuo.artemis.server.util.constant.ExcelConst;
import com.kuo.artemis.server.util.file.ExcelUtil;
import org.junit.Test;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

public class TypeBindFactoryTest {
    @Test
    public void createBean() throws Exception {
        Map<String, Object> map = new HashMap();
        map.put("name", "测试");
        map.put("score", "99");
        map.put("age", "4");

        Class<?> clazz = Class.forName(ExcelConst.ENTITY_PACKAGE + ".ExcelTest");
        System.out.println(dataBind(clazz, map));

    }

    public static <T> T dataBind(Class<T> beanClass, Map<String, Object> fieldValueMap) throws Exception {
        return ExcelUtil.dataBind(beanClass, fieldValueMap);
    }

}