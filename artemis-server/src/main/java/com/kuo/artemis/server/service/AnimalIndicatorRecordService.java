package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;

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
}
