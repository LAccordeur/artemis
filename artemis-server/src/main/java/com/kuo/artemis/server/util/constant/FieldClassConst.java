package com.kuo.artemis.server.util.constant;

import com.kuo.artemis.server.entity.ExcelTest;
import com.kuo.artemis.server.entity.ExcelTestTwo;
import com.kuo.artemis.server.entity.User;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

public class FieldClassConst {
    public final static Map<String, Class> fieldClassMap = new HashMap<String, Class>();

    static {
        fieldClassMap.put("name", ExcelTest.class);
        fieldClassMap.put("score", ExcelTest.class);
        fieldClassMap.put("age", ExcelTest.class);
        fieldClassMap.put("userName", User.class);
        fieldClassMap.put("userPhone", User.class);
        fieldClassMap.put("userEmail", User.class);
        fieldClassMap.put("university", ExcelTestTwo.class);
        fieldClassMap.put("school", ExcelTestTwo.class);
        fieldClassMap.put("grade", ExcelTestTwo.class);

        Class<?> clazz = null;
        try {
            clazz = Class.forName("com.kuo.artemis.server.entity.AnimalGrowthRecord");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            fieldClassMap.put(field.getName(), clazz);
        }
    }
}
