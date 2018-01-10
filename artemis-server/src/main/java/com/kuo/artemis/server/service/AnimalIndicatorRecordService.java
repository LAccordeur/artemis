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
     * @param projectId
     * @return
     */
    Response listAnimalIndicatorRecord(String projectId);


    /**
     * 创建新的数据版本
     * @param recordList
     * @return
     */
    Response createNewRecordVersion(List<List<String>> recordList, String projectId) throws Exception;

    /**
     * 保存数据
     * @param recordList
     * @return
     */
    Response saveRecord(List<List<String>> recordList, String projectId);

}
