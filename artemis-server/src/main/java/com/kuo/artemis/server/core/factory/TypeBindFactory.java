package com.kuo.artemis.server.core.factory;



import java.math.BigDecimal;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/4
 */
public class TypeBindFactory {

    /**
     *
     * @param clazz
     * @param value
     * @param <T>
     * @return
     */
    public static <T> T createBean(Class<T> clazz, Object value) {
        String clazzName = clazz.getName();

        if ("java.lang.Integer".equals(clazzName) || "int".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new Integer((String) value);
        } else if ("java.lang.Long".equals(clazzName) || "long".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new Long((String) value);
        } else if ("java.lang.Float".equals(clazzName) || "float".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new Float((String) value);
        } else if ("java.lang.Double".equals(clazzName) || "double".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new Double((String) value);
        } else if ("java.math.BigDecimal".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new BigDecimal((String) value);
        } else if ("java.lang.String".equals(clazzName)) {
            if ((String)value != null)
                return (T) new String((String) value);
        } else if ("java.util.Date".equals(clazzName)) {
            return null;
        }

        return null;
    }
}
