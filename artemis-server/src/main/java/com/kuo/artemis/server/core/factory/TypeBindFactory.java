package com.kuo.artemis.server.core.factory;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/4
 */
public class TypeBindFactory {

    public static <T> T createBean(Class<T> clazz, Object value) {
        String clazzName = clazz.getName();

        if ("java.lang.Integer".equals(clazzName)) {
            return (T) new Integer((String) value);
        } else if ("java.lang.Long".equals(clazzName)) {
            return (T) new Long((String) value);
        } else if ("java.util.Date".equals(clazzName)) {

        } else if ("java.lang.Double".equals(clazzName)) {
            return (T) new Double((String) value);
        } else {
            return (T) value;
        }

        return null;
    }
}
