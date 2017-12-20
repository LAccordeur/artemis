package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;

/**
 * @author : guoyang
 * @Description :  TODO
 * @Date : Created on 2017/12/19
 */
public interface AnimalFormulationService {

    /**
     * 获取某课题下所有的动物配方关系
     * @param projectId
     * @return
     */
    Response listAnimalFormulationRelations(String projectId);

    /**
     * 根据配方id获取食用该配方的所有动物
     * @param formulationId
     * @return
     */
    Response listAnimalsByFormulationId(String formulationId);

    /**
     * 根据动物id获取该动物食用的配方信息
     * @param animalId
     * @return
     */
    Response getFormulationByAnimalId(String animalId);

    /**
     * 为某个动物指定一个新的配方
     * @param animalId
     * @param FormulationId
     * @return
     */
    Response createNewAnimalFormulationRelation(String animalId, String FormulationId);

    /**
     * 获取每个配方的重复组 数
     * @return
     */
    Response getReplicateNumber();

}
