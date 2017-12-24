package com.kuo.artemis.server.util.common;

import com.kuo.artemis.server.core.common.NutritionIndicator;
import com.kuo.artemis.server.entity.Animal;
import com.kuo.artemis.server.entity.Material;
import org.junit.Test;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.*;

public class BeanUtilTest {
    @Test
    public void isContainChinese() throws Exception {

        System.out.println(NutritionIndicator.class);
        Material material = new Material();
        Field[] fields = material.getClass().getDeclaredFields();
        Annotation[] annotations = fields[0].getAnnotations();
        System.out.println(annotations[0].getClass());
        System.out.println(annotations[0].annotationType());
        System.out.println(BeanUtil.isContainChinese("fs人ad"));
    }

    @Test
    public void test() {
        //集合一
        List<String> _first=new ArrayList<String>();
        _first.add("jim");
        _first.add("tom");
        _first.add(new String("jack"));
//集合二
        List<String> _second=new ArrayList<String>();
        _second.add("jack");
        _second.add("happy");
        _second.add("sun");
        _second.add("good");

        Collection exists=new ArrayList<String>(_second);
        Collection notexists=new ArrayList<String>(_second);

        exists.removeAll(_first);
        System.out.println("_second中不存在于_set中的："+exists);
        notexists.removeAll(exists);
        System.out.println("_second中存在于_set中的："+notexists);
    }

    @Test
    public void spaceFieldToCamel() throws Exception {
        //System.out.println(BeanUtil.spaceFieldToCamel("E.Col"));
        Integer a = 1;
        Integer b = 2;
        swap(a, b);

        int c = 1;
        Integer d = 1;
        int f = a.intValue();
        System.out.println(c==a);
        System.out.println(d==a);
        System.out.println(f==a);
        System.out.println("a:" + a);
        System.out.println("b:" + b);
    }

    public static void swap(Integer a, Integer b) {
        int temp = a.intValue();

        try {
            Field field = Integer.class.getDeclaredField("value");

            
            field.setAccessible(true);
            field.set(a, b);
            field.set(b, temp);
            System.out.println("field name:" + field.getName());
            System.out.println("type:" + field.getType());
            System.out.println("declaring class:" + field.getDeclaringClass());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void spaceFieldToUnderline() throws Exception {

        System.out.println(BeanUtil.spaceFieldToUnderline("  Fdasfdf32   "));

        Object i = 9;
        boolean b;
        if (i instanceof Integer) {
            b = true;
        } else {
            b = false;
        }
        System.out.println(b);
    }

    @Test
    public void beanToMap() throws Exception {

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(32));
        System.out.println(BeanUtil.beanToMap(animal));
    }

}