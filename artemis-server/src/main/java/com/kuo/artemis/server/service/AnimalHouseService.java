package com.kuo.artemis.server.service;


import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.AnimalHouse;

/**
 * @author guoyang
 */
public interface AnimalHouseService {



    /**
     *  创建一个圈舍
     *  @param house
     * @return
     */
    Response createHouse(AnimalHouse house);

    /**
     * 获取圈舍规划的结果，包含每个圈舍里是哪个重复组和处理组
     * @param project
     * @return
     */
    Response getHouseProgrammingResult(String project);

    /**
     * 进行圈舍规划（规划完毕后需要建立房间以及圈舍）
     * @param param
     * @return
     */
    Response doHouseProgramming(Object param);


    /**
     * 获取某个课题下所有的动物圈舍关系
     * @param projectId
     * @return
     */
    Response listAnimalHouseRelations(String projectId);

    /**
     * 获取某个圈舍下的所有动物
     * @param houseId
     * @return
     */
    Response listAnimalsByHouseId(String houseId);

    /**
     * 获取某个动物所在的圈舍
     * @param animalId
     * @return
     */
    Response getHouseByAnimalId(String animalId);

    /**
     * 创建新的动物圈舍关系
     * @param animalId
     * @param houseId
     * @return
     */
    Response createNewAnimalHouseRelation(String animalId, String houseId);

}
