package com.kuo.artemis.server.core.jwt;

import com.kuo.artemis.server.controller.UserController;

import java.lang.reflect.Method;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/10/29
 */
public class Test {

    public static void main(String[] args) {
        Object object = new UserController();

        Class<?> clazz = object.getClass();

        System.out.println(clazz);


        Method[] methods = clazz.getMethods();
        for (Method method : methods) {
            System.out.println(method.getName());
        }


    }
}
