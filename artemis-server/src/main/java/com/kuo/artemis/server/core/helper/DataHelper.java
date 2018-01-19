package com.kuo.artemis.server.core.helper;

import com.kuo.artemis.server.core.common.MaterialIndicator;
import com.kuo.artemis.server.core.common.NutritionIndicator;
import com.kuo.artemis.server.core.dto.excel.DataImportDTO;
import com.kuo.artemis.server.util.common.BeanUtil;
import com.kuo.artemis.server.util.file.ExcelUtil;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/23
 */
public class DataHelper {


    /**
     * 动物指标Excel数据转化为对象
     * @param dataList
     * @param fieldIndex 表头索引
     * @param contextStartIndex
     * @return
     * @throws Exception
     */
    public static DataImportDTO excelIndicatorDataToBean(List<List<String>> dataList, Integer fieldIndex, Integer contextStartIndex) throws Exception {
        DataImportDTO dataImportDTO = new DataImportDTO();

        //获取表头和表正文
        List<String> field = dataList.get(fieldIndex);
        List<List<String>> contents = dataList.subList(contextStartIndex, dataList.size());

        //获取map化后的list
        List<Map<String, Object>> mapList = ExcelUtil.listWithListToListWithMap(field, contents);
        List<String> formatFieldList = ExcelUtil.getFormatFieldList(field);

        //转换为对象
        Map<Class, List> resultMap = new HashMap<Class, List>();
        Map<Class, List<Map<String, Object>>> classListMap = ExcelUtil.groupExcel(mapList, formatFieldList);
        Set<Map.Entry<Class, List<Map<String, Object>>>> set = classListMap.entrySet();
        Iterator<Map.Entry<Class, List<Map<String, Object>>>> iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry<Class, List<Map<String, Object>>> entry = iterator.next();
            Class clazz = entry.getKey();
            List<Map<String, Object>> value = entry.getValue();
            List list = mapListToBeanList(clazz, value);
            resultMap.put(clazz, list);
        }

        dataImportDTO.setObjectList(resultMap);
        return dataImportDTO;

    }

    /**
     * 其余Excel数据转化为对象
     * @param dataList
     * @param fieldIndex
     * @param contextStartIndex
     * @return
     * @throws Exception
     */
    public static DataImportDTO excelDataToBean(List<List<String>> dataList, Class clazz, Integer fieldIndex, Integer contextStartIndex) throws Exception {
        DataImportDTO dataImportDTO = new DataImportDTO();

        //获取表头和表正文
        List<String> field = dataList.get(fieldIndex);
        List<List<String>> contents = dataList.subList(contextStartIndex, dataList.size());

        //获取map化后的list
        List<Map<String, Object>> mapList = ExcelUtil.listWithListToListWithMap(field, contents);

        //转换为对象
        List resultList = mapListToBeanList(clazz, mapList);
        dataImportDTO.setCommonList(resultList);
        return dataImportDTO;

    }


    /**
     * 同一类对象对象
     * @param beanClazz
     * @param mapList
     * @param <T>
     * @return
     * @throws Exception
     */
    public static <T> List<T> mapListToBeanList(Class<T> beanClazz, List<Map<String, Object>> mapList) throws Exception {

        List<T> objectList = new ArrayList<T>();
        for (int i = 0; i < mapList.size(); i++) {
            Map<String, Object> fieldValueMap = mapList.get(i);
            T object = BeanUtil.dataBind(beanClazz, fieldValueMap);
            objectList.add(object);
        }


        return objectList;
    }


    /**
     * 将一个对象列表转换为二维数组
     * @param objectList
     * @param <T>
     * @return
     */
    public static <T> List<List<String>> objectListToArrayList(List<T> objectList) {

        List<List<String>> arrayList = new ArrayList<List<String>>();

        Field[] fields = objectList.get(0).getClass().getDeclaredFields();
        List<String> filedNames = getFiledName(fields);
        List<Method> methods = getGetterMethods(filedNames, objectList.get(0));

        //添加表头
        List<String> fieldAnnotationValueList = new ArrayList<String>();
        for (Field field : fields) {
            String value = getFieldAnnotationValue(field);
            if (value != null) {
                fieldAnnotationValueList.add(value);
            } else {
                fieldAnnotationValueList.add("");
            }
        }
        arrayList.add(fieldAnnotationValueList);

        //添加表正文
        for (int i = 0; i < objectList.size(); i++) {
            T object = objectList.get(i);
            List<String> list = new ArrayList<String>();


            Object value = null;
            for (Method method : methods) {
                try {
                    value = method.invoke(object, new Object[]{});
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (value != null) {

                    //该值是日期型则对其进行格式转换
                    if (Date.class.equals(value.getClass())) {
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        value = dateFormat.format(value);
                    }

                    list.add(String.valueOf(value));
                } else {
                    list.add("");
                }
                arrayList.add(list);
            }


        }

        return arrayList;
    }


    /**
     * 获取对象属性，返回一个字符串数组
     *
     * @return 字符串数组
     */
    private static List<String> getFiledName(Field[] fields) {
        try {
            //Field[] fields = o.getClass().getDeclaredFields();
            List<String> fieldNames = new ArrayList<String>();
            for (int i = 0; i < fields.length; i++) {
                fieldNames.add(fields[i].getName());
            }
            return fieldNames;
        } catch (SecurityException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 使用反射根据属性名称获取t属性的get方法
     *
     * @param fieldNames 属性名称
     * @param o 操作对象
     * @return List<Method> get方法
     */

    private static List<Method> getGetterMethods(List<String> fieldNames, Object o) {

        List<Method> methods=new ArrayList<Method>();
        for (String fieldName : fieldNames) {
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            String getter = "get" + firstLetter + fieldName.substring(1);
            Method method = null;
            try {
                method = o.getClass().getMethod(getter, new Class[] {});
            } catch (NoSuchMethodException e) {
                System.out.println("属性不存在");
                continue;
            }
            methods.add(method);
        }
        return methods;

    }


    public static String getFieldAnnotationValue(Field field) {

        Annotation[] annotations = field.getDeclaredAnnotations();
        Annotation firstAnnotation = annotations[0];


        //TODO  是否转为简单工厂
        if (NutritionIndicator.class.equals(firstAnnotation.annotationType())) {
            NutritionIndicator annotation = (NutritionIndicator) BeanUtil.getFieldAnnotation(field, NutritionIndicator.class);
            if (annotation != null) {
                return annotation.name();
            } else {
                return null;
            }
        } else if (MaterialIndicator.class.equals(firstAnnotation.annotationType())) {
            MaterialIndicator annotation = (MaterialIndicator) BeanUtil.getFieldAnnotation(field, MaterialIndicator.class);
            if (annotation != null) {
                return annotation.name();
            } else {
                return null;
            }
        }

        return null;
    }





}
