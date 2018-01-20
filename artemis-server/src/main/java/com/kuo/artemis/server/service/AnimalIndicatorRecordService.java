package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.Animal;

import java.util.List;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public interface AnimalIndicatorRecordService {

    /**
     * 获取某个课题下已录入的指标数据
     *
     * @param projectId
     * @param fileIdentifier
     * @param version
     * @return
     */
    Response getIndicatorRecordDetail(String projectId, String fileIdentifier, String version);


    /**
     * 创建新的数据版本
     *
     * @param recordList
     * @param projectId
     * @param userId
     * @param filename
     * @return
     */
    Response createNewRecordVersion(List<List<String>> recordList, String projectId, String userId, String filename) throws Exception;

    /**
     * 保存数据
     *
     * @param recordList
     * @return
     */
    Response saveRecord(List<List<String>> recordList, String projectId, String userId, String fileId) throws Exception;

    /**
     * 获取某个课题下已导入的指标文件列表
     *
     * @param projectId
     * @return
     */
    Response listIndicatorRecords(String projectId);

    /**
     * 获取某个文件的所有版本
     *
     * @param fileIdentifier
     * @return
     */
    Response listIndicatorRecordVersions(String projectId, String fileIdentifier);


}