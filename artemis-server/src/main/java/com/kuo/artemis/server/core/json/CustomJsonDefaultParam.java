package com.kuo.artemis.server.core.json;

import com.kuo.artemis.server.entity.AnimalRecord;
import com.kuo.artemis.server.util.common.StringUtil;
import com.kuo.artemis.server.util.constant.FieldReverseFormatConst;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomJsonDefaultParam {

    public static final List<PropertyNameMapper> defaultPropertyMapperList = new ArrayList<PropertyNameMapper>();

    private static final Class<?> defaultClassToFilter = AnimalRecord.class;

    private static final Map<String, String> defaultNameMappings = new HashMap<String, String>();

    static {
        Class animalRecordClass = AnimalRecord.class;
        Field[] fields = animalRecordClass.getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            String fieldName = field.getName();
            if (FieldReverseFormatConst.map.containsKey(fieldName)) {
                String jsonKey = FieldReverseFormatConst.map.get(fieldName);
                defaultNameMappings.put(fieldName, jsonKey);
            } else {
                String jsonKey = StringUtil.camelToSpace(fieldName);
                defaultNameMappings.put(fieldName, jsonKey);
            }
        }
        PropertyNameMapper propertyNameMapper = new PropertyNameMapper(defaultClassToFilter, defaultNameMappings);
        defaultPropertyMapperList.add(propertyNameMapper);
    }
}
