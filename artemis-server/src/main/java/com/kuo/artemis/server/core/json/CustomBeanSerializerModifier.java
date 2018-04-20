package com.kuo.artemis.server.core.json;

import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.fasterxml.jackson.databind.ser.BeanSerializerModifier;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/6
 */
public class CustomBeanSerializerModifier extends BeanSerializerModifier {
    public List<BeanPropertyWriter> changeProperties(SerializationConfig config, BeanDescription beanDesc, List<BeanPropertyWriter> beanProperties) {

        List<PropertyNameMapper> propertyMappings = getNameMappingsFromRequest();
        if (propertyMappings == null) {
            return beanProperties;
        }
        PropertyNameMapper mapping = mappingsForClass(propertyMappings,
                beanDesc.getBeanClass());

        if (mapping == null) {
            return beanProperties;
        }

        List<BeanPropertyWriter> propsToWrite = new ArrayList<BeanPropertyWriter>();
        for (BeanPropertyWriter propWriter : beanProperties) {
            String propName = propWriter.getName();
            String outputName = mapping.nameMappings.get(propName);
            if (outputName != null) {
                BeanPropertyWriter modifiedWriter = new CustomBeanPropertyWriter(
                        propWriter, outputName);
                propsToWrite.add(modifiedWriter);
            } else {
                propsToWrite.add(propWriter);
            }
        }
        return propsToWrite;
    }

    private List<PropertyNameMapper> getNameMappingsFromRequest() {
        RequestAttributes requestAttribs = RequestContextHolder
                .getRequestAttributes();
        Object nameMappingsObject = requestAttribs.getAttribute("nameMappings", RequestAttributes.SCOPE_REQUEST);
        List<PropertyNameMapper> nameMappings = null;
        if (nameMappingsObject != null) {
            nameMappings = (List<PropertyNameMapper>) requestAttribs.getAttribute("nameMappings", RequestAttributes.SCOPE_REQUEST);
        }
        return nameMappings;
    }

    private PropertyNameMapper mappingsForClass(List<PropertyNameMapper> nameMappings, Class<?> beanClass) {
        for (PropertyNameMapper mapping : nameMappings) {
            if (mapping.classToFilter.equals(beanClass)) {
                return mapping;
            }
        }
        return null;
    }}
