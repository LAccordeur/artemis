package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.math.GroupDesignParam;
import com.kuo.artemis.server.core.math.GroupDesignResult;
import com.kuo.artemis.server.entity.Animal;

import java.util.List;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public interface AnimalService {

    /**
     * 获取重复数
     * @param param
     * @return
     */
    Response getReplicateNumber(Object param);

    /**
     * 导入动物基础数据
     * @param command
     * @return
     */
    Response importAnimalBasicList(DataImportCommand command);

    /**
     * 进行动物分组
     * @param param
     * @return
     */
    Response groupAnimal(GroupDesignParam param) throws Exception;

    /**
     * 获取动物分组结果
     * @param projectId
     * @return
     */
    Response getAnimalGroupResult(String projectId) throws Exception;

    /**
     * 提交动物分组结果
     * @param result
     * @return
     */
    Response commitAnimalGroupResult(GroupDesignResult result) throws Exception;

    /**
     * 删除
     * @param projectId
     * @return
     */
    Response deleteAnimalGroupResult(String projectId);


}
