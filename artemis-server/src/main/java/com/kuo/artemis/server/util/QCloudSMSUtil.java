package com.kuo.artemis.server.util;

import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import com.kuo.artemis.server.util.common.PropsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;

/**
 * @Author : guoyang
 * @Description : 腾讯云短信工具
 * @Date : Created on 2018/3/2
 */
public class QCloudSMSUtil {


    private final static Logger logger = LoggerFactory.getLogger(QCloudSMSUtil.class);

    private final static String APP_ID = PropsUtil.getString("Q_CLOUD_SDK_APPID");
    private final static String APP_KEY = PropsUtil.getString("Q_CLOUD_APP_KEY");
    private final static String NATION_CODE = "86";
    private final static Integer TEMPL_ID = 90648;

    public static boolean sendSMS(String phone, String smsCode, String timeLimit) {
        //假设短信模板 id 为 123，模板内容为：测试短信，{1}，{2}，{3}，上学。

        ArrayList<String> params = new ArrayList<String>();
        params.add(smsCode);
        params.add(timeLimit);

        SmsSingleSenderResult result = null;
        try {
            SmsSingleSender sender = new SmsSingleSender(Integer.valueOf(APP_ID), APP_KEY);
            result = sender.sendWithParam(NATION_CODE, phone, TEMPL_ID, params, "", "", "");
            logger.info(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.toString());
            return false;
        }

        if (result != null && result.result == 0) {
            return true;
        }

        return false;
    }

    public static void main(String[] args) {
        System.out.println(QCloudSMSUtil.sendSMS("18936752870", "123586", "1"));
    }
}
