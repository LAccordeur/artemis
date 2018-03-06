package com.kuo.artemis.server.core.json;

import com.kuo.artemis.server.entity.AnimalRecord;
import com.kuo.artemis.server.util.common.StringUtil;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description : 针对json key 的自定义mapper
 * @Date : Created on 2018/3/6
 */
public class PropertyNameMapper {

    // The class for which the mappings need to take place.
    public Class<?> classToFilter;
    // The mappings property names. Key would be the existing property name
    // value would be name you want in the ouput.
    public Map<String, String> nameMappings = Collections.emptyMap();

    public PropertyNameMapper(Class<?> classToFilter, Map<String, String> nameMappings) {
        this.classToFilter = classToFilter;
        this.nameMappings = nameMappings;
    }
}
