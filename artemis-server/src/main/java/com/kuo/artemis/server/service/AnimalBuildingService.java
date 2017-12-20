package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.AnimalBuilding;
import com.kuo.artemis.server.entity.BuildingRecord;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public interface AnimalBuildingService {

    /**
     * 创建一个圈舍所在的大房间
     * @param animalBuilding
     * @return
     */
    Response createBuilding(AnimalBuilding animalBuilding);


    /**
     * 创建该房间的温度湿度记录项
     * @param record
     * @return
     */
    Response createBuildingRecord(BuildingRecord record);

    /**
     * 获取某个课题下所有房间的温度湿度记录
     * @param projectId
     * @return
     */
    Response listBuildingRecord(String projectId);
}
