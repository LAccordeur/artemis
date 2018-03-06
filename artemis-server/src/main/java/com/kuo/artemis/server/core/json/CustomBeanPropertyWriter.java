package com.kuo.artemis.server.core.json;

import com.fasterxml.jackson.core.io.SerializedString;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;

/**
 * @Author : guoyang
 * @Description :https://stackoverflow.com/questions/18531259/change-json-key-name-dynamically-jackson
 * @Date : Created on 2018/3/6
 */
public class CustomBeanPropertyWriter extends BeanPropertyWriter {
    // We would just use the copy-constructor rather than modifying the
    // protected properties. This is more in line with the current design
    // of the BeanSerializerModifier class (according to its documentation).
    protected CustomBeanPropertyWriter(BeanPropertyWriter base, String targetName) {
        super(base, new SerializedString(targetName));
    }
}
