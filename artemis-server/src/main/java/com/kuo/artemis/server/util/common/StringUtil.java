package com.kuo.artemis.server.util.common;

import com.kuo.artemis.server.util.constant.FieldFormatConst;
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

    public static String fieldFormat(String field) {

        if (field == null) {
            return null;
        }
        //TODO  指标数据和原料数据以及营养标准字段已加入 未来可能会新增
        //如果含有中文，则改用另一种方法转换
        if (BeanUtil.isContainChinese(field)) {
            if (field.trim().contains("（%）")) {
                field = field.replace("（%）","");
            }
            if (field.trim().contains("(%)")) {
                field = field.replace("(%)", "");
            }
            if (field.trim().contains("kcal/kg")) {
                field = field.replace("kcal/kg", "");
            }
            if (field.trim().contains("Mcal/kg")) {
                field = field.replace("Mcal/kg", "");
            }
            if (field.trim().contains("\n")) {
                field = field.replace("\n", "");
            }
            return FieldFormatConst.map.get(field.trim());
        }

        if (FieldFormatConst.map.containsKey(field.trim().toLowerCase())) {
            return FieldFormatConst.map.get(field.trim().toLowerCase());
        }
        return BeanUtil.spaceFieldToCamel(field.trim());
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

    /**
     * 拆分xx.xx形式的文件名为[xx, xx]
     * @param filename
     * @return
     */
    public static String[] splitFilename(String filename) {
        String[] items = StringUtils.split(filename, ".");
        String suffixItem = "";  //文件名后缀
        StringBuffer prefixItem = new StringBuffer();  //文件名前缀

        if (items.length >= 2) {
            suffixItem = items[items.length-1];

            for (int i = 0; i < items.length-1; i++) {
                prefixItem.append(items[i]);
                if (i != items.length - 2) {
                    prefixItem.append(".");
                }
            }

        } else {
            return null;
        }

        String[] fileItems = new String[]{prefixItem.toString(), suffixItem};
        return fileItems;
    }
}
