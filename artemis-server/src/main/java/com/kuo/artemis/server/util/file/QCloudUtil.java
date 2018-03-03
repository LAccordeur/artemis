package com.kuo.artemis.server.util.file;

import com.kuo.artemis.server.core.dto.FileMetaData;
import com.kuo.artemis.server.util.common.PropsUtil;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.model.UploadResult;
import com.qcloud.cos.region.Region;
import com.qcloud.cos.transfer.TransferManager;
import com.qcloud.cos.transfer.Upload;
import com.qcloud.cos.transfer.UploadCallable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.InputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @Author : guoyang
 * @Description : 腾讯云存储相关工具类
 * @Date : Created on 2018/3/2
 */
public class QCloudUtil {

    private static final Logger logger = LoggerFactory.getLogger(QCloudUtil.class);

    private static final String COS_SECRET_ID = PropsUtil.getString("COS_SECRET_ID");

    private static final String COS_SECRET_KEY = PropsUtil.getString("COS_SECRET_KEY");

    private static final String REGION_NAME = "ap-chengdu";

    //private static ExecutorService threadPool = Executors.newCachedThreadPool();

    /**
     * 初始化连接客户端
     * @return
     */
    public static COSClient initCOSClientClient() {
        // 1 初始化用户身份信息(secretId, secretKey)
        COSCredentials cred = new BasicCOSCredentials(COS_SECRET_ID, COS_SECRET_KEY);
        // 2 设置bucket的区域, COS地域的简称请参照 https://cloud.tencent.com/document/product/436/6224
        ClientConfig clientConfig = new ClientConfig(new Region(REGION_NAME));
        // 3 生成cos客户端
        COSClient cosclient = new COSClient(cred, clientConfig);
        // bucket的命名规则为{name}-{appid} ，此处填写的存储桶名称必须为此格式
        //String bucketName = "mybucket-1251668577";

        return cosclient;
    }

    /**
     * 上传文件
     * @param cosClient
     * @param bucketName
     * @param file
     * @param key
     * @return
     */
    public static Boolean uploadFile(COSClient cosClient, String bucketName, File file, String key) {

        // 简单文件上传, 最大支持 5 GB, 适用于小文件上传, 建议 20 M 以下的文件使用该接口
        // 大文件上传请参照 API 文档高级 API 上传
        // 指定要上传到 COS 上的路径

        try {
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, file);
            PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cosClient != null) {
                cosClient.shutdown();
            }
        }

        return true;
    }

    /**
     * 上传文件
     * @param cosClient
     * @param bucketName
     * @param inputStream
     * @param key
     * @return
     */
    public static Boolean uploadFile(COSClient cosClient, String bucketName, InputStream inputStream, String key, FileMetaData fileMetaData) {
        ObjectMetadata metadata = new ObjectMetadata();
        try {
            metadata.setContentLength(fileMetaData.getContentLength());
            metadata.setContentType(fileMetaData.getContentType());
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, metadata);
            cosClient.putObject(putObjectRequest);

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cosClient != null) {
                cosClient.shutdown();
            }
        }

        return true;
    }


    /**
     * 利用高级API 上传文件
     * @param cosClient
     * @param bucketName
     * @param inputStream
     * @param key
     * @return
     */
    public static Boolean uploadFileV2(COSClient cosClient, String bucketName, InputStream inputStream, String key, FileMetaData fileMetaData) {

        // 传入一个threadPool, 若不传入线程池, 默认TransferManager中会生成一个单线程的线程池。
        TransferManager transferManager = new TransferManager(cosClient);

        try {
            //提交上传请求
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentLength(fileMetaData.getContentLength());
            metadata.setContentType(fileMetaData.getContentType());

            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, inputStream, metadata);
            Upload upload = transferManager.upload(putObjectRequest);
            upload.waitForCompletion();

        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.toString());
            return false;
        } finally {
            // 关闭 TransferManger
            if (transferManager != null) {
                transferManager.shutdownNow();
            }
        }

        return true;

    }



}
