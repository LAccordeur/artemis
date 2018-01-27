package com.kuo.artemis.server.util.common;

import org.apache.commons.lang3.StringUtils;

/**
 * Created by LAccordeur on 2017/9/4.
 * 字符串工具类
 */
public final class StringUtil {

    public static final char UNDERLINE='_';

    /**
     * 判断字符串是否为空
     * @param string
     * @return
     */
    public static boolean isEmpty(String string) {
        if (string != null) {
            string = string.trim();
        }
        return StringUtils.isEmpty(string);
    }

    public static String underlineToCamel(String param){
        if (param==null||"".equals(param.trim())){
            return "";
        }
        int len=param.length();
        StringBuilder sb=new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c=param.charAt(i);
            if (c==UNDERLINE){
                if (++i<len){
                    sb.append(Character.toUpperCase(param.charAt(i)));
                }
            }else{
                sb.append(c);
            }
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(underlineToCamel("fdas_33"));
    }

    /**
     * 判断字符串是否非空
     * @param string
     * @return
     */
    public static boolean isNotEmpty(String string) {
        return !isEmpty(string);
    }

    public static String getHashSubCode(String string) {
        return String.valueOf(string.hashCode()).substring(0,6);
    }

    public static String[] splitString(String source, String reg) {
        return StringUtils.split(source, reg);
    }
}
