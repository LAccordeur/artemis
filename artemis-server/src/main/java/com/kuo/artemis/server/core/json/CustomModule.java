package com.kuo.artemis.server.core.json;

import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.databind.Module;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/6
 */
public class CustomModule extends Module {

    @Override
    public String getModuleName() {
        return "Custom Module";
    }

    @Override
    public void setupModule(SetupContext context) {
        context.addBeanSerializerModifier(new CustomBeanSerializerModifier());
    }

    @Override
    public Version version() {
        // Modify if you need to.
        return Version.unknownVersion();
    }

}
