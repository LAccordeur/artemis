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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/18
 */
@Service
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
        Integer projectId = Integer.valueOf(result.getProjectId());

        //检测是否已存在
        AnimalBuilding building = animalBuildingMapper.selectByProjectId(projectId);
        if (building != null) {
            return new Response(HttpStatus.CONFLICT.value(), "请勿重复提交规划结果");
        }

        //1.创建building
        AnimalBuilding animalBuilding = new AnimalBuilding();
        animalBuilding.setProjectId(projectId);
        animalBuilding.setHouseType(houseStyle);
        animalBuilding.setBuildingCode(buildingCode);
        Integer houseNumber = replicationNum * treatmentNum;  //圈舍数
        animalBuilding.setHouseNumber(houseNumber);
        animalBuildingMapper.insertSelective(animalBuilding);
        Integer buildingId = animalBuilding.getId();

        //2.创建圈舍
        List<AnimalHouse> animalHouseList = new ArrayList<AnimalHouse>();
        for (int i = 0; i < randomResult.size(); i++) {
            List replicationList = randomResult.get(i);
            List<String> codeList = houseCodeList.get(i);
            for (int j = 0; j < replicationList.size(); j++) {
                AnimalHouse animalHouse = new AnimalHouse();
                animalHouse.setBuildingId(buildingId);
                animalHouse.setProjectId(projectId);
                animalHouse.setReplicate(String.valueOf(i+1));
                animalHouse.setTreatment(String.valueOf(replicationList.get(j)));
                animalHouse.setHouseCode(codeList.get(j));
                animalHouseList.add(animalHouse);
            }
        }
        int insertResult = animalHouseMapper.insertBatch(animalHouseList);
        if (insertResult > 0) {
            return new Response(HttpStatus.OK.value(), "保存圈舍规划成功");
        }

        return new Response(HttpStatus.NO_CONTENT.value(), "圈舍规划数据无效");
    }

    /**
     * 获取圈舍规划的结果
     * @param projectId
     * @return
     */
    public Response getHouseProgrammingResult(String projectId) {
        RandomDistributionResult result = new RandomDistributionResult();

        AnimalBuilding animalBuilding = animalBuildingMapper.selectByProjectId(Integer.valueOf(projectId));
        List<AnimalHouse> animalHouseList = animalHouseMapper.selectByProjectId(Integer.valueOf(projectId));

        if (animalBuilding == null || animalHouseList == null) {
            return new Response(HttpStatus.NOT_FOUND.value(), "尚未进行圈舍规划");
        }
        Short houseType = animalBuilding.getHouseType();
        result.setAnimalHouseList(animalHouseList);
        result.setBuildingCode(animalBuilding.getBuildingCode());
        result.setProjectId(projectId);

        RandomDistributionParam param = new RandomDistributionParam();
        param.setHouseStyle(houseType);
        result.setParam(param);

        return new Response(result, HttpStatus.OK.value(), "圈舍规划结果");
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
