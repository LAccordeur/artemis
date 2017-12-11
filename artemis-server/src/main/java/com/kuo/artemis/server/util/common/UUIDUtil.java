package com.kuo.artemis.server.util.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/11
 */
public class UUIDUtil {

    /**
     * 获取32位小写uuid
     * @return
     */
    public static String get32UUIDLowerCase() {
        return UUID.randomUUID().toString().replace("-","").toLowerCase();
    }

    public static List<String> list32UUIDLowerCase(int size) {
        List<String> UUIDs = new ArrayList<String>();

        for (int i = 0; i < size; i++) {
            UUIDs.add(get32UUIDLowerCase());
        }

        return UUIDs;
    }
}
