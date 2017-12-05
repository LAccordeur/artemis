package com.kuo.artemis.server.util.file;

import com.kuo.artemis.server.util.constant.ExcelConst;
import org.apache.commons.beanutils.BeanUtils;
import org.junit.Test;
import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;

import java.beans.PropertyEditor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

public class ExcelUtilTest {
    @Test
    public void dataBind() throws Exception {
        Map<String, Object> map = new HashMap();
        map.put("name", "测试");
        map.put("score", "99");
        map.put("age", "4");

        /*long longVar = 0;
        Long longWrapVar = 0L;
        int intVar = 0;
        Integer intWrapVar = 0;

        longVar = intWrapVar;
        longWrapVar = intWrapVar;
*/
        Class<?> clazz = Class.forName(ExcelConst.ENTITY_PACKAGE + ".ExcelTest");
        System.out.println(injectBean(clazz, map));
        //System.out.println(mapToObjectApache(clazz, map));

        PropertyEditor propertyEditor = new StringArrayPropertyEditor();
        propertyEditor.setAsText("test");


    }

    private static Object mapToObject(Class clazz, Map<String, Object> map) throws Exception {
        Method[] methods = clazz.getDeclaredMethods();
        Object object = clazz.newInstance();

        for (int i = 0; i < methods.length; i++) {
            Method method = methods[i];
            String methodName = method.getName();
            if (methodName.startsWith("set") && methodName.length() > 3) {
                String attrName = methodName.substring(3).toLowerCase();
                Object value = map.get(attrName);
                System.out.println(value);
                if (value != null) {
                    method.invoke(object, new Object[]{value});
                }
            }
        }

        return object;
    }

    private static Object mapToObjectAgain(Class clazz, Map<String, Object> map) throws Exception {

        Object object = clazz.newInstance();

        Field[] fields = clazz.getDeclaredFields();

        for (Field field : fields) {
            field.setAccessible(true);
            String attrName = field.getName();
            Object value = map.get(attrName);
            if (value != null) {
                field.set(object, value);
            }
        }

        return object;
    }

    //使用泛型
    public static final <T> T injectBean(Class<T> beanClass,Map parasMap) {
        T bean = null;
        try {
            //通过反射生成对象
            bean = beanClass.newInstance();
            //还可以用Class.forName生成对象
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
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
                    Class paramType = types[0];
                    //map中是否有属性名
                    if(parasMap.containsKey(attrName)) {
                        Object value = parasMap.get(attrName);
                        try {
                            String paramTypeName = paramType.getName();
                            //通过反射的方式执行bean的mothod方法，在这里相当于执行set方法赋值
                            if (paramTypeName.equals("java.lang.Integer")) {
                                method.invoke(bean, new Integer((String)value));
                            } else if (paramTypeName.equals("java.lang.Long")) {
                                method.invoke(bean, new Long((String)value));
                            } else {
                                method.invoke(bean, new Object[]{value});
                            }

                           //method.invoke(bean, new Object[]{value});
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

    public Object mapToObjectApache(Class clazz, Map<String, Object> map) throws Exception {
        Object bean = clazz.newInstance();
        BeanUtils.populate(bean, map);
        return bean;
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

abstract class Father {
    public Father() {
        System.out.println("This is father");
    }

    public void go() {
        System.out.println("father go");
    }
}

class Son extends Father {
    public Son() {
        System.out.println("This is son");
    }

    public void go() {
        System.out.println("son go");
    }
}