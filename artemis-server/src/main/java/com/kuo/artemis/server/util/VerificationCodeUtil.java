package com.kuo.artemis.server.util;

import java.util.Random;

/**
 * @Author : guoyang
 * @Description : 验证码工具
 * @Date : Created on 2018/3/1
 */
public class VerificationCodeUtil {

    private static Random randomItem = new Random();

    /**
     * 生成6位纯数字的验证码
     */
    public static String randomNumericalCode() {
        Random random = new Random(System.currentTimeMillis() + randomItem.nextInt());

        StringBuilder stringBuilder = new StringBuilder();

        for (int i = 0; i < 6; i++) {
            stringBuilder.append(random.nextInt(10));
        }

        return stringBuilder.toString();
    }


    /**
     * 发送手机验证码
     * @param phone
     * @return
     */
    public static String sendSmsCode(String phone) {

        //生成验证码
        String smsCode = VerificationCodeUtil.randomNumericalCode();

        //发送
        boolean sendStatus = QCloudSMSUtil.sendSMS(phone, smsCode, "2");
        if (sendStatus) {
            return smsCode;
        } else {
            return null;
        }

    }



}
