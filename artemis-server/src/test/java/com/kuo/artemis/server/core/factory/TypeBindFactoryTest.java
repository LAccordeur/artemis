package com.kuo.artemis.server.core.factory;

import com.kuo.artemis.server.util.common.BeanUtil;
import com.kuo.artemis.server.util.constant.ExcelConst;
import com.kuo.artemis.server.util.file.ExcelUtil;
import org.junit.Test;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

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

        Set set = new HashSet();
        set.add("1");
        set.add("2");

        Iterator iterator = set.iterator();

        while (iterator.hasNext()) {
            System.out.println(iterator.next());
            iterator.remove();
        }
        iterator = set.iterator();
        while (iterator.hasNext()) {
            System.out.println("new");
            System.out.println(iterator.next());
        }

    }

    public static <T> T dataBind(Class<T> beanClass, Map<String, Object> fieldValueMap) throws Exception {
        return BeanUtil.dataBind(beanClass, fieldValueMap);
    }

}