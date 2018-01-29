package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionParam;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionResult;
import com.kuo.artemis.server.core.math.RandomDistribution;
import com.kuo.artemis.server.dao.AnimalBuildingMapper;
import com.kuo.artemis.server.dao.AnimalHouseMapper;
import com.kuo.artemis.server.dao.AnimalMapper;
import com.kuo.artemis.server.dao.ProjectDetailMapper;
import com.kuo.artemis.server.entity.AnimalBuilding;
import com.kuo.artemis.server.entity.AnimalHouse;
import com.kuo.artemis.server.entity.ProjectDetail;
import com.kuo.artemis.server.service.AnimalHouseService;
import com.kuo.artemis.server.util.ValidationUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.*;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/18
 */
@Service
public class AnimalHouseServiceImpl implements AnimalHouseService {

    private static Logger logger = LoggerFactory.getLogger(AnimalHouseService.class);

    @Inject
    private AnimalHouseMapper animalHouseMapper;

    @Inject
    private AnimalBuildingMapper animalBuildingMapper;

    @Inject
    private ProjectDetailMapper projectDetailMapper;

    @Inject
    private AnimalMapper animalMapper;

    /**
     * 保存圈舍规划结果（即创建房间等操作）
     * @param result
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response commitHouseProgrammingResult(RandomDistributionResult result) {

        try {
            ValidationUtil.getInstance().validateParams(result);
        } catch (Exception e) {
            return new Response(e);
        }
        String buildingCode = result.getBuildingCode();
        RandomDistributionParam param = result.getParam();
        Integer replicationNum = param.getReplicationNum();
        Integer treatmentNum = param.getTreatmentNum();
        Integer houseNumber = param.getHouseNumber();
        Short houseStyle = param.getHouseStyle();
        List<AnimalHouse> animalHouseList = result.getAnimalHouseList();
        Integer projectId = Integer.valueOf(result.getProjectId());
        //检测参数
        Boolean houseCheck = checkAnimalHouse(animalHouseList, replicationNum, treatmentNum, houseNumber);
        Boolean treatmentCheck = checkAnimalTreatment(animalHouseList, replicationNum, treatmentNum);
        if (!houseCheck || !treatmentCheck) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "圈舍信息有误");
        }


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
        animalBuilding.setHouseNumber(houseNumber);
        animalBuildingMapper.insertSelective(animalBuilding);
        Integer buildingId = animalBuilding.getId();

        //2.创建圈舍
        for (AnimalHouse animalHouse : animalHouseList) {
            animalHouse.setBuildingId(buildingId);
            animalHouse.setProjectId(projectId);
        }
        int insertResult = animalHouseMapper.insertBatch(animalHouseList);

        //3.保存参数信息
        ProjectDetail projectDetail = new ProjectDetail();
        projectDetail.setProjectId(projectId);
        projectDetail.setTreatmentNum(treatmentNum);
        projectDetail.setReplicationNum(replicationNum);
        projectDetail.setHouseStyle(houseStyle);
        projectDetailMapper.insertSelective(projectDetail);
        if (insertResult > 0) {
            return new Response(result, HttpStatus.OK.value(), "保存圈舍规划成功");
        }

        return new Response(HttpStatus.NO_CONTENT.value(), "圈舍规划数据无效");
    }

    private static Boolean checkAnimalTreatment(List<AnimalHouse> animalHouseList, Integer replicationNum, Integer treatmentNum) {

        Collections.sort(animalHouseList, new Comparator<AnimalHouse>() {
            public int compare(AnimalHouse o1, AnimalHouse o2) {
                if (o1.getReplicate() == null) {
                    o1.setReplicate("");
                }
                if (o2.getReplicate() == null) {
                    o2.setReplicate("");
                }
                return o2.getReplicate().compareTo(o1.getReplicate());
            }
        });

        for (int i = 0; i < replicationNum; i++) {
            List<AnimalHouse> groupAnimalHouse = animalHouseList.subList(i*treatmentNum, (i+1)*treatmentNum);
            Set<String> treatmentNumSet = new HashSet<String>();
            for (int j = 0; j < groupAnimalHouse.size(); j++) {
                AnimalHouse animalHouse = groupAnimalHouse.get(j);
                if (animalHouse != null && animalHouse.getTreatment() != null && !"".equals(animalHouse.getTreatment())) {
                    treatmentNumSet.add(animalHouse.getTreatment());
                }
            }
            if (treatmentNumSet.size() < treatmentNum) {
                return false;
            }
        }

        return true;
    }


    private static Boolean checkAnimalHouse(List<AnimalHouse> animalHouseList, Integer replicationNum, Integer treatmentNum, Integer houseNumber) {

        //检测参数
        if ((treatmentNum * replicationNum > houseNumber) || animalHouseList.size() != houseNumber) {
            //首先看圈舍数目是否正确
            logger.info("---------------house number is wrong------------------");
            return false;
        } else {
            //再看每个圈舍单元信息是否正确
            Set<String> houseSet = new HashSet<String>();
            Map<String, Integer> replicationMap = new HashMap<String, Integer>();
            for (AnimalHouse animalHouse : animalHouseList) {
                if (animalHouse.getHouseCode() == null || "".equals(animalHouse.getHouseCode())) {
                    logger.info("----------------house code id wrong-------------------");
                    return false;
                }
                houseSet.add(animalHouse.getHouseCode().trim());
                String replication = animalHouse.getReplicate();
                if (replication != null && !"".equals(replication)) {
                    if (replicationMap.containsKey(replication)) {
                        replicationMap.put(replication, replicationMap.get(replication) + 1);
                    } else {
                        replicationMap.put(replication, 1);
                    }
                }
            }

            //编号是否正确
            if (houseSet.contains(null) || houseSet.contains("") || houseSet.size() < animalHouseList.size()) {
                logger.info("--------------missing code-------------");
                return false;
            } else if (replicationMap.size() != replicationNum) {
                logger.info("--------------wrong replicationNum-------------");
                return false;
            } else {
                Set<String> keySet = replicationMap.keySet();
                Iterator<String> iterator = keySet.iterator();
                while (iterator.hasNext()) {
                    String key = iterator.next();
                    if (replicationMap.get(key) != treatmentNum) {
                        logger.info("------------------wrong treatmentNum----------------------");
                        return false;
                    }
                }
            }

        }
        return true;
    }
    /**
     * 获取圈舍规划的结果
     * @param projectId
     * @return
     */
    public Response getHouseProgrammingResult(String projectId) {

        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "请求参数不能为空");
        }
        RandomDistributionResult result = new RandomDistributionResult();

        AnimalBuilding animalBuilding = animalBuildingMapper.selectByProjectId(Integer.valueOf(projectId));
        List<AnimalHouse> animalHouseList = animalHouseMapper.selectByProjectId(Integer.valueOf(projectId));
        ProjectDetail projectDetail = projectDetailMapper.selectByProjectId(Integer.valueOf(projectId));

        if (animalBuilding == null || animalHouseList == null) {
            return new Response(HttpStatus.NOT_FOUND.value(), "尚未进行圈舍规划");
        }

        result.setAnimalHouseList(animalHouseList);
        result.setBuildingCode(animalBuilding.getBuildingCode());
        result.setProjectId(projectId);

        RandomDistributionParam param = new RandomDistributionParam();
        param.setTreatmentNum(projectDetail.getTreatmentNum());
        param.setReplicationNum(projectDetail.getReplicationNum());
        param.setHouseStyle(projectDetail.getHouseStyle());
        param.setHouseNumber(animalHouseList.size());
        result.setParam(param);

        return new Response(result, HttpStatus.OK.value(), "圈舍规划结果");
    }

    /**
     * 进行圈舍规划
     * @param param
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response doHouseProgramming(RandomDistributionParam param) {

        try {
            ValidationUtil.getInstance().validateParams(param);
        } catch (Exception e) {
            return new Response(e);
        }

        logger.info("---------------group param-------------");
        logger.info(param.toString());
        //核查参数
        Integer houseNumber = param.getHouseNumber();
        Integer treatmentNum = param.getTreatmentNum();
        Integer replicationNum = param.getReplicationNum();
        Integer projectId = Integer.valueOf(param.getProjectId());
        Short houseStyle = param.getHouseStyle();
        String buildingCode = param.getBuildingCode();
        List<AnimalHouse> animalHouseList = param.getAnimalHouseList();
        Boolean checkResult = checkAnimalHouse(animalHouseList, replicationNum, treatmentNum, houseNumber);
        if (!checkResult) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "圈舍信息有误");
        }

        //检测是否已存在
        AnimalBuilding building = animalBuildingMapper.selectByProjectId(projectId);
        if (building != null) {
            return new Response(HttpStatus.CONFLICT.value(), "请勿重复提交规划结果");
        }

        //设置序号防止失序
        for (int i = 0; i < animalHouseList.size(); i++) {
            AnimalHouse animalHouse = animalHouseList.get(i);
            if (animalHouse.getSequence() == null) {
                animalHouse.setSequence(i+1);
            }
        }
        RandomDistributionResult result = RandomDistribution.randomTreatmentDistribution(param);

        //1.创建building
        AnimalBuilding animalBuilding = new AnimalBuilding();
        animalBuilding.setProjectId(projectId);
        animalBuilding.setHouseType(houseStyle);
        animalBuilding.setBuildingCode(buildingCode);
        animalBuilding.setHouseNumber(houseNumber);
        animalBuildingMapper.insertSelective(animalBuilding);
        Integer buildingId = animalBuilding.getId();

        //2.创建圈舍
        for (AnimalHouse animalHouse : animalHouseList) {
            animalHouse.setBuildingId(buildingId);
            animalHouse.setProjectId(projectId);
        }
        int insertResult = animalHouseMapper.insertBatch(animalHouseList);

        //3.保存参数信息
        ProjectDetail projectDetail = new ProjectDetail();
        projectDetail.setProjectId(projectId);
        projectDetail.setTreatmentNum(treatmentNum);
        projectDetail.setReplicationNum(replicationNum);
        projectDetail.setHouseStyle(houseStyle);
        projectDetailMapper.insertSelective(projectDetail);
        if (insertResult > 0) {
            return new Response(result, HttpStatus.OK.value(), "保存圈舍规划成功");
        }

        return new Response(HttpStatus.NO_CONTENT.value(), "圈舍规划数据无效");

    }

    /**
     * 删除
     * @param projectId
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response deleteHouseProgrammingResult(String projectId) {
        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "请求参数不能为空");
        }

        int status = animalMapper.selectAnimalGroupDetailStatus(Integer.valueOf(projectId));
        if (status > 0) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "请先删除动物分组");
        }

        animalHouseMapper.deleteByProjectId(Integer.valueOf(projectId));
        projectDetailMapper.deleteByProjectId(Integer.valueOf(projectId));
        int result = animalBuildingMapper.deleteByProjectId(Integer.valueOf(projectId));

        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "删除成功");
        }
        return new Response(HttpStatus.NO_CONTENT.value(), "删除失败");
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
