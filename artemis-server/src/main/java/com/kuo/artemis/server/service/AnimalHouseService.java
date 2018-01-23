package com.kuo.artemis.server.service;


import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionParam;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionResult;
import com.kuo.artemis.server.entity.AnimalHouse;

/**
 * @author guoyang
 */
public interface AnimalHouseService {



    /**
     *  保存圈舍规划结果
     *  @param result
     * @return
     */
    Response commitHouseProgrammingResult(RandomDistributionResult result);

    /**
     * 获取圈舍规划的结果，包含每个圈舍里是哪个重复组和处理组
     * @param projectId
     * @return
     */
    Response getHouseProgrammingResult(String projectId);

    /**
     * 进行圈舍规划（规划完毕后需要建立房间以及圈舍）
     * @param param
     * @return
     */
    Response doHouseProgramming(RandomDistributionParam param);

    /**
     * 删除某个课题下的圈舍规划（若以完成动物分组试验步骤则不能删除）
     * @param projectId
     * @return
     */
    Response deleteHouseProgrammingResult(String projectId);

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
