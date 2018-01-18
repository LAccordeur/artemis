package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionParam;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionResult;
import com.kuo.artemis.server.core.math.RandomDistribution;
import com.kuo.artemis.server.dao.AnimalBuildingMapper;
import com.kuo.artemis.server.dao.AnimalHouseMapper;
import com.kuo.artemis.server.entity.AnimalBuilding;
import com.kuo.artemis.server.entity.AnimalHouse;
import com.kuo.artemis.server.service.AnimalHouseService;
import com.kuo.artemis.server.util.ValidationUtil;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/18
 */
public class AnimalHouseServiceImpl implements AnimalHouseService {

    @Inject
    private AnimalHouseMapper animalHouseMapper;

    @Inject
    private AnimalBuildingMapper animalBuildingMapper;

    /**
     * 保存圈舍规划结果（即创建房间等操作）
     * @param result
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response commitHouseProgrammingResult(RandomDistributionResult result) {
        String buildingCode = result.getBuildingCode();
        List<List<String>> houseCodeList = result.getHouseCodeList();
        List<List> randomResult = result.getRandomResult();
        RandomDistributionParam param = result.getParam();
        Integer replicationNum = param.getReplicationNum();
        Integer treatmentNum = param.getTreatmentNum();
        Short houseStyle = param.getHouseStyle();

        //1.创建building
        AnimalBuilding animalBuilding = new AnimalBuilding();
        animalBuilding.setHouseType(houseStyle);
        animalBuilding.setBuildingCode(buildingCode);
        Integer houseNumber = replicationNum * treatmentNum;  //圈舍数
        animalBuilding.setHouseNumber(houseNumber);
        animalBuildingMapper.insertSelective(animalBuilding);

        //2.创建圈舍


        return null;
    }

    public Response getHouseProgrammingResult(String project) {
        return null;
    }

    /**
     * 进行圈舍规划
     * @param param
     * @return
     */
    public Response doHouseProgramming(RandomDistributionParam param) {

        ValidationUtil.getInstance().validateParams(param);
        RandomDistributionResult result = RandomDistribution.randomUnitDistribution(param);

        return new Response(result, HttpStatus.OK.value(), "圈舍规划成功");
    }

    public Response listAnimalHouseRelations(String projectId) {
        return null;
    }

    public Response listAnimalsByHouseId(String houseId) {
        return null;
    }

    public Response getHouseByAnimalId(String animalId) {
        return null;
    }

    public Response createNewAnimalHouseRelation(String animalId, String houseId) {
        return null;
    }
}
