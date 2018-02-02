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
            else
                return (T) new Integer(-1);
        } else if ("java.lang.Long".equals(clazzName) || "long".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new Long((String) value);
            else
                return (T) new Long(-1);
        } else if ("java.lang.Float".equals(clazzName) || "float".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new Float((String) value);
            else
                return (T) new Float(-1);
        } else if ("java.lang.Byte".equals(clazzName) || "byte".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new Byte((String) value);
            else
                return (T) new Byte("-1");
        } else if ("java.lang.Short".equals(clazzName) || "short".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new Short((String) value);
            else
                return (T) new Short("-1");
        } else if ("java.lang.Double".equals(clazzName) || "double".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new Double((String) value);
            else
                return (T) new Double(-1);
        } else if ("java.math.BigDecimal".equals(clazzName)) {
            if ((String)value != null && !"".equals((String) value))
                return (T) new BigDecimal((String) value).setScale(5, BigDecimal.ROUND_HALF_EVEN);   //TODO bug可能点
            else {
                return (T) new BigDecimal("-1");
            }
        } else if ("java.lang.String".equals(clazzName)) {
            if ((String)value != null)
                return (T) new String((String) value);
            else
                return (T) new String("");
        } else if ("java.util.Date".equals(clazzName)) {
            return null;
        }

        return null;
    }
}
