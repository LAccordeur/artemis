package com.kuo.artemis.server.core.factory;

import java.math.BigDecimal;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/8
 */
public class StringCastFactory {

    /**
     *      ##BUG##   转换情况尚未考虑周全
     * @param object
     * @return
     */
    public static String createString(Object object) {
        if (object instanceof BigDecimal) {
            BigDecimal bigDecimalObject = (BigDecimal) object;
            return bigDecimalObject.toString();
        } else if (object instanceof String) {
            return (String) object;
        }

        return null;
    }
}
