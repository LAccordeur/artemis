package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
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
     * 进行动物分组
     * @param param
     * @return
     */
    Response groupAnimal(Object param);


}
