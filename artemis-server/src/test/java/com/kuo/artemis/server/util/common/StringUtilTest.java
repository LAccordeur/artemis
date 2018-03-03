package com.kuo.artemis.server.util.common;

import org.junit.Test;

import static org.junit.Assert.*;

public class StringUtilTest {
    @Test
    public void splitString() throws Exception {
        String[] items = (StringUtil.splitFilename("."));
        if (items != null) {
            System.out.println(items.length);
            for (int i = 0; i < items.length; i++) {
                System.out.println(items[i]);
            }
        }
    }

}