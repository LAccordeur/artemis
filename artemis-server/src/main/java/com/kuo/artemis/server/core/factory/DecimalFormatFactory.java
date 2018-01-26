package com.kuo.artemis.server.core.factory;

import java.text.DecimalFormat;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/10
 */
public class DecimalFormatFactory {

    private static class SingletonHolder {
        private static DecimalFormat decimalFormat = new DecimalFormat("0.00000");
    }

    public static DecimalFormat getDecimalFormatInstance() {
        return SingletonHolder.decimalFormat;
    }
}
