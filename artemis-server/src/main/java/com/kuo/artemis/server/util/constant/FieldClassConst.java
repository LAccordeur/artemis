package com.kuo.artemis.server.util.constant;

import com.kuo.artemis.server.entity.*;

import java.lang.reflect.Field;
import java.util.*;

public class FieldClassConst {
    public final static Map<String, Class> fieldClassMap = new HashMap<String, Class>();

    public final static Set<Class> clazzSet = new HashSet();


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


        clazzSet.add(Animal.class);
        clazzSet.add(AnimalGutMicrobiotaRecord.class);
        clazzSet.add(AnimalGrowthRecord.class);

        Class<?> clazz = null;
        Iterator<Class> iterator = clazzSet.iterator();
        while (iterator.hasNext()) {
            clazz = iterator.next();

            Field[] fields = clazz.getDeclaredFields();
            for (Field field : fields) {
                fieldClassMap.put(field.getName(), clazz);
            }
        }
        fieldClassMap.remove("id");
        fieldClassMap.remove("animalId");

    }
}
