package com.kuo.artemis.server.util.common;

import java.util.HashMap;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/31
 */
public class Father {

    private int a = 10;

    Father() {
        System.out.println(this instanceof Son);
        System.out.println(((Son) this).a);
        System.out.println(this.getClass().getName());
    }

    public static void main(String[] args) {
        /*ReentrantLock lock = new ReentrantLock();
        lock.lock();
        Condition condition = lock.newCondition();

        Father s = new Son();
        System.out.println(s.a);*/

        int[] data = {3,7,3,5,6};
        sort(data, 0, data.length - 1);
        for (int i = 0; i < data.length; i++) {
            System.out.println(data[i]);
        }

    }

    static void sort(int[] data, int i, int j) {
        if (i < j) {
            int medium = findMedium(data, i, j);
            System.out.println("medium:" + medium);
            sort(data, i, medium - 1);
            sort(data, medium + 1, j);
        }
    }

    static int findMedium(int[] data, int i, int j) {
        int soldier = data[i];

        while (i < j) {
            while (i < j && data[j] >= soldier) {j--;}
            if (i < j) {
                data[i] = data[j];
                i++;
            }

            while (i < j && data[i] <= soldier) {i++;}
            if (i < j) {
                data[j] = data[i];
                j--;
            }
        }

        data[i] = soldier;
        return i;
    }
}

class Son extends Father {
    public int a = 5;
    public Son() {
        //隐式调用super();
        super();
        System.out.println(this);
    }

}
