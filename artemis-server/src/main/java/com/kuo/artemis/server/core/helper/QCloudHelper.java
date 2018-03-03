package com.kuo.artemis.server.core.helper;

import com.kuo.artemis.server.core.dto.FileMetaData;
import com.kuo.artemis.server.util.file.QCloudUtil;
import com.qcloud.cos.COSClient;

import java.io.File;
import java.io.InputStream;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/2
 */
public class QCloudHelper {

    private static final String BUCKET_NAME = "artemis-1252652106";

    public static Boolean updateFile(File file, String key) {
        //1.获取一个请求客户端
        COSClient cosClient = QCloudUtil.initCOSClientClient();
        //2.上传文件
        Boolean status = QCloudUtil.uploadFile(cosClient, BUCKET_NAME, file, key);

        return status;
    }

    /**
     * 以流的形式上传文件
     * @param inputStream
     * @param key
     * @param fileMetaData
     * @return
     */
    public static Boolean updateFile(InputStream inputStream, String key, FileMetaData fileMetaData) {

        //初始化连接客户端
        COSClient cosClient = QCloudUtil.initCOSClientClient();
        //上传
        Boolean status = QCloudUtil.uploadFileV2(cosClient, BUCKET_NAME, inputStream, key, fileMetaData);

        return status;
    }

    /*public static void main(String[] args) {
        File file = new File("C:\\Users\\LAccordeur\\Desktop\\local_test.txt");

        QCloudHelper.uploadFile(file, "/test/local_test.txt");
    }*/
}
