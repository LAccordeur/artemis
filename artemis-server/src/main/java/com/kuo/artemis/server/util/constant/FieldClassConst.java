package com.kuo.artemis.server.util.constant;

import com.kuo.artemis.server.entity.*;

import java.lang.reflect.Field;
import java.util.*;

/**
 * 用于动物指标数据
 */
public class FieldClassConst {
    public final static Map<String, Class> fieldClassMap = new HashMap<String, Class>();

    public final static Set<Class> clazzSet = new HashSet();


    static {

        //TODO  剩余指标建表后  需添加到set中
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
