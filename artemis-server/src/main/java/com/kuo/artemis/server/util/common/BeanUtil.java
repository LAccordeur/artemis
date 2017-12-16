package com.kuo.artemis.server.util.common;

import com.kuo.artemis.server.core.factory.TypeBindFactory;
import org.apache.commons.beanutils.BeanMap;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FileUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/8
 */
public final class BeanUtil {

    /**
     * 将bean对象转化为map
     * @param object
     * @return
     */
    public static Map<String, Object> beanToMap(Object object) {
        return new BeanMap(object);
    }

    /**
     * 将键值对绑定到相应的类对象中
     * @param beanClass
     * @param fieldValueMap
     * @return
     * @throws Exception
     */
    public static <T> T dataBind(Class<T> beanClass, Map<String, Object> fieldValueMap) throws Exception {
        T bean = null;

        //通过反射生成对象
        bean = beanClass.newInstance();

       /* //利用Apache的工具类进行数据绑定
        BeanUtils.populate(bean, fieldValueMap);

        //return bean;*/



        //获取类的方法
        Method[] methods = beanClass.getMethods();
        int len = methods.length;
        for(int i = 0; i < len; ++i) {
            Method method = methods[i];
            String methodName = method.getName();
            //如果方法名是set开头的且名字长度大于3的
            if(methodName.startsWith("set") && methodName.length() > 3) {
                //获取方法的参数类型
                Class[] types = method.getParameterTypes();
                //只有一个参数的方法才继续执行
                if(types.length == 1) {
                    //取字段名且让其首字母小写
                    String attrName = firstCharToLowerCase(methodName.substring(3));
                    Class<?> paramType = types[0];
                    //map中是否有属性名
                    if(fieldValueMap.containsKey(attrName)) {
                        Object value = fieldValueMap.get(attrName);
                        try {

                            //通过反射的方式执行bean的mothod方法，在这里相当于执行set方法赋值
                            Object param = TypeBindFactory.createBean(paramType, value);
                            if (param != null) {
                                method.invoke(bean, param);
                            }

                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                            continue;
                        } catch (InvocationTargetException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        return bean;
    }


    /**
     * 将字段名格式转化为Java驼峰类型  xx Yy  =>  xxYy
     * @param value
     * @return
     */
    public static String spaceFieldToCamel(String value) {
        if (value.contains(".")) {
            value = value.replace(".", " ");
        }

        if (value.contains(" ")) {
            String[] words = value.trim().split(" ");
            StringBuffer newValue = new StringBuffer();
            for (int i = 0; i < words.length; i++) {
                //System.out.println(words[i]);
                if (words[i].length() > 1) {
                    if (i == 0) {
                        newValue.append(words[i].substring(0, 1).toLowerCase() + words[i].substring(1, (words[i]).length()).toLowerCase());
                    } else {
                        newValue.append(words[i].substring(0, 1).toUpperCase() + words[i].substring(1, (words[i]).length()).toLowerCase());
                    }
                } else {
                    if (i != 0) {
                        if (words[i].length() == 1 && words[i] != " ") {
                            newValue.append(words[i].toUpperCase());
                        }
                    } else {
                        if (words[i].length() == 1 && words[i] != " ") {
                            newValue.append(words[i].toLowerCase());
                        }
                    }
                }
            }
            value = newValue.toString();

        } else {
            value = value.toLowerCase();
        }


        return value;
    }

    /**
     * 将字段名格式转化为下划线形式   xx Yy  =>  xx_yy
     * @param value
     * @return
     */
    public static String spaceFieldToUnderline(String value) {
        if ("E.Coli".equals(value)) {
            value = "e_coli";

        }



        if (value.contains(" ")) {
            String[] words = value.trim().split(" ");
            StringBuffer newValue = new StringBuffer();
            for (int i = 0; i < words.length; i++) {
                //System.out.println(words[i]);
                if (!"".equals(words[i])) {
                    newValue.append(words[i].toLowerCase()).append("_");
                }
            }
            newValue.replace(newValue.length()-1, newValue.length(), "");
            value = newValue.toString();

        } else {
            value = value.toLowerCase();
        }

        return value;
    }

    //取字段名且让其首字母小写
    public static String firstCharToLowerCase(String substring) {
        if (substring!=null&& substring.charAt(0)>='A' && substring.charAt(0)<='Z'){
            char[] arr = substring.toCharArray();
            arr[0] = (char)(arr[0] + 32);
            return new String(arr);
        }else {
            return substring;
        }
    }
}
