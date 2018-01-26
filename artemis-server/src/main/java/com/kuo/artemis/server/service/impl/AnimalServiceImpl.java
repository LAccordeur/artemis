package com.kuo.artemis.server.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.helper.AnimalGroupHelper;
import com.kuo.artemis.server.core.math.GroupDesign;
import com.kuo.artemis.server.core.math.GroupDesignParam;
import com.kuo.artemis.server.core.math.GroupDesignResult;
import com.kuo.artemis.server.dao.AnimalHouseMapper;
import com.kuo.artemis.server.dao.AnimalIndicatorMapper;
import com.kuo.artemis.server.dao.AnimalMapper;
import com.kuo.artemis.server.dao.ProjectDetailMapper;
import com.kuo.artemis.server.dao.redis.CacheRedisDao;
import com.kuo.artemis.server.entity.Animal;
import com.kuo.artemis.server.entity.AnimalHouse;
import com.kuo.artemis.server.entity.ProjectDetail;
import com.kuo.artemis.server.service.AnimalService;
import com.kuo.artemis.server.util.ValidationUtil;
import com.kuo.artemis.server.util.constant.GenderOptionConst;
import com.kuo.artemis.server.util.constant.GroupDesignMethodConst;
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
public class AnimalServiceImpl implements AnimalService {
    @Inject
    private AnimalHouseMapper animalHouseMapper;

    @Inject
    private AnimalMapper animalMapper;

    @Inject
    private ProjectDetailMapper projectDetailMapper;

    @Inject
    private AnimalIndicatorMapper animalIndicatorMapper;

    @Inject
    private CacheRedisDao cacheRedisDao;

    public Response getReplicateNumber(Object param) {
        return null;
    }

    public Response groupAnimal(GroupDesignParam param) throws Exception {
        //基本分组参数不能为空
        try {
            ValidationUtil.getInstance().validateParams(param);
        } catch (Exception e) {
            return new Response(e);
        }

        String designMethod = param.getDesignMethod();
        String projectId = param.getProjectId();
        List<AnimalHouse> animalHouseList = animalHouseMapper.selectByProjectId(Integer.valueOf(projectId));
        List<Animal> animalList = animalMapper.selectByProjectId(Integer.valueOf(projectId));
        if (animalHouseList == null || animalList == null) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "前置操作未完成");
        }

        //根据分组方法进行相应的选择
        if (GroupDesignMethodConst.COMPLETELY_RANDOMIZED_DESIGN.equals(designMethod)) {
            //完全随机化设计
            GroupDesignResult result = AnimalGroupHelper.groupByCRD(animalList, param, animalHouseList);
            if (result == null) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "分组数据不足");
            }
            result.setParam(param);
            result.setProjectId(projectId);
            return new Response(result, HttpStatus.OK.value(), "分组结果");
        } else if (GroupDesignMethodConst.RANDOMIZED_COMPLETE_BLOCK_DESIGN.equals(designMethod)) {
            //随机区组设计
            String considerGender = param.getConsiderGender();
            if ("1".equals(considerGender)) {
                String genderOption = param.getGenderOption();
                if (GenderOptionConst.GENDER_AS_A_BLOCKING_FACTOR.equals(genderOption)) {
                    GroupDesignResult result = AnimalGroupHelper.groupByRCBWithGenderAsBlockingFactor(animalList, param, animalHouseList);
                    if (result == null) {
                        return new Response(HttpStatus.BAD_REQUEST.value(), "分组数据不足");
                    }
                    result.setParam(param);
                    result.setProjectId(projectId);
                    return new Response(result, HttpStatus.OK.value(), "分组结果");
                } else if (GenderOptionConst.GENDER_BALANCED_PENS.equals(genderOption)) {
                    GroupDesignResult result = AnimalGroupHelper.groupByRCBWithGenderBalance(animalList, param, animalHouseList);
                    if (result == null) {
                        return new Response(HttpStatus.BAD_REQUEST.value(), "分组数据不足");
                    }
                    result.setParam(param);
                    result.setProjectId(projectId);
                    return new Response(result, HttpStatus.OK.value(), "分组结果");
                } else if (GenderOptionConst.DIFFERENT_GENDER_BALANCE_ACROSS_THE_REPLICATIONS.equals(genderOption)) {
                    GroupDesignResult result = AnimalGroupHelper.groupByRCBWithDifferentGenderBalances(animalList, param, animalHouseList);
                    if (result == null) {
                        return new Response(HttpStatus.BAD_REQUEST.value(), "分组数据不足");
                    }
                    result.setParam(param);
                    result.setProjectId(projectId);
                    return new Response(result, HttpStatus.OK.value(), "分组结果");
                }
            } else {
                GroupDesignResult result = AnimalGroupHelper.groupByRCBWithoutGender(animalList, param, animalHouseList);
                if (result == null) {
                    return new Response(HttpStatus.BAD_REQUEST.value(), "分组数据不足");
                }
                result.setParam(param);
                result.setProjectId(projectId);
                return new Response(result, HttpStatus.OK.value(), "分组结果");
            }
        }

        return new Response(HttpStatus.BAD_REQUEST.value(), "缺少参数");
    }

    public Response getAnimalGroupResult(String projectId) throws Exception {
        //先从缓存中查看是否已有数据
        String key = "animal_group_" + projectId;
        String cacheResult = cacheRedisDao.getFromCache(key);
        if (cacheResult != null) {
            ObjectMapper objectMapper = new ObjectMapper();
            GroupDesignResult groupDesignResult = objectMapper.readValue(cacheResult, GroupDesignResult.class);
            if (groupDesignResult != null) {
                return new Response(groupDesignResult, HttpStatus.OK.value(), "分组结果");
            }
        }


        //缓存中没有则重新组装
        List<Animal> animalList = animalMapper.selectAnimalGroupDetailList(Integer.valueOf(projectId));
        List<AnimalHouse> animalHouseList = animalHouseMapper.selectByProjectId(Integer.valueOf(projectId));
        ProjectDetail projectDetail = projectDetailMapper.selectByProjectId(Integer.valueOf(projectId));
        int groupStatus = animalMapper.selectAnimalGroupStatus(Integer.valueOf(projectId));
        if (animalList == null || animalHouseList == null || projectDetail == null || groupStatus < 1) {
            return new Response(HttpStatus.NO_CONTENT.value(), "无分组结果");
        }

        GroupDesignParam param = new GroupDesignParam();
        param.setTreatmentNum(projectDetail.getTreatmentNum());
        param.setReplicationNum(projectDetail.getReplicationNum());
        GroupDesignResult result = new GroupDesignResult();
        GroupDesign.setAnimalGroupSummary(animalList, param, result, true);
        GroupDesign.setAnimalGroupMovingSheet(animalList, result, true);
        result.setParam(param);

        return new Response(result, HttpStatus.OK.value(), "分组结果");
    }

    @Transactional(rollbackFor = Exception.class)
    public Response commitAnimalGroupResult(GroupDesignResult result) throws Exception {

        String projectId = result.getProjectId();
        List<Animal> animalListFromDB = animalMapper.selectAnimalGroupDetailList(Integer.valueOf(projectId));
        if (animalListFromDB != null && animalListFromDB.size() > 0) {
            if (animalListFromDB.get(0).getNewPen() != null && animalListFromDB.get(0).getCoefficientOfVariation() != null) {
                return new Response(HttpStatus.CONFLICT.value(), "请勿重复分组");
            }
        }

        List<Animal> animalList = result.getSummary().getAnimalAllotmentResult();
        List<AnimalHouse> animalHouseList = animalHouseMapper.selectByProjectId(Integer.valueOf(projectId));
        Map<String, Map<String, Integer>> map = getHouseIdByReplicationAndTreatment(animalHouseList);

        for (Animal animal : animalList) {
            String treatment = animal.getTreatment();
            String replication = animal.getReplicate();
            if (treatment != null && replication != null && !"".equals(treatment) && !"".equals(replication)) {
                Integer houseId = map.get(replication).get(treatment);
                animal.setHouseId(houseId);
            }
        }

        animalMapper.updateBatch(animalList);
        animalMapper.insertAnimalGroupDetailBatch(animalList);

        ProjectDetail oldProjectDetail = projectDetailMapper.selectByProjectId(Integer.valueOf(projectId));
        if (oldProjectDetail == null) {
            ProjectDetail projectDetail = new ProjectDetail();
            projectDetail.setProjectId(Integer.valueOf(result.getProjectId()));
            projectDetail.setReplicationNum(result.getParam().getReplicationNum());
            projectDetail.setTreatmentNum(result.getParam().getTreatmentNum());
            projectDetail.setGroupMethod(Short.valueOf(result.getParam().getDesignMethod()));
            projectDetail.setGenderMethod(Short.valueOf(result.getParam().getGenderOption()));
            projectDetailMapper.insertSelective(projectDetail);
        } else {
            oldProjectDetail.setGroupMethod(Short.valueOf(result.getParam().getDesignMethod()));
            oldProjectDetail.setGenderMethod(Short.valueOf(result.getParam().getGenderOption()));
            projectDetailMapper.updateByPrimaryKeySelective(oldProjectDetail);
        }
        //切面将分组结果放入缓存

        return new Response(result, HttpStatus.OK.value(), "提交成功");
    }

    @Transactional(rollbackFor = Exception.class)
    public Response deleteAnimalGroupResult(String projectId) {
        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        int deleteStatus = animalMapper.deleteAnimalGroupByProjectId(Integer.valueOf(projectId));
        if (deleteStatus > 0) {
            String key = "animal_group_" + projectId;
            cacheRedisDao.removeFromCache(key);
            return new Response(HttpStatus.OK.value(), "删除成功");
        }
        return new Response(HttpStatus.BAD_REQUEST.value(), "删除失败");
    }


    private Map<String, Map<String, Integer>> getHouseIdByReplicationAndTreatment(List<AnimalHouse> animalHouseList) {

        Set<String> replicationSet = new HashSet<String>();
        for (AnimalHouse animalHouse : animalHouseList) {
            String replication = animalHouse.getReplicate();
            if (replication != null) {
                replicationSet.add(replication);
            }
        }

        Map<String, Map<String, Integer>> resultMap = new HashMap<String, Map<String, Integer>>();
        Iterator<String> iterator = replicationSet.iterator();
        while (iterator.hasNext()) {
            String replicationKey = iterator.next();
            Map<String, Integer> map = new HashMap<String, Integer>();
            resultMap.put(replicationKey, map);
        }

        for (AnimalHouse animalHouse : animalHouseList) {
            String replication = animalHouse.getReplicate();
            String treatment = animalHouse.getTreatment();
            Integer houseId = animalHouse.getId();
            Map<String, Integer> map = resultMap.get(replication);
            map.put(treatment, houseId);
        }

        return resultMap;
    }
}
