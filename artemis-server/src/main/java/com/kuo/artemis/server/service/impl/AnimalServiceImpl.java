package com.kuo.artemis.server.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.animal.ReplicationCalculationDTO;
import com.kuo.artemis.server.core.dto.animal.ReplicationCalculationParam;
import com.kuo.artemis.server.core.dto.excel.DataImportCommand;
import com.kuo.artemis.server.core.dto.excel.DataImportDTO;
import com.kuo.artemis.server.core.exception.DataException;
import com.kuo.artemis.server.core.helper.AnimalGroupHelper;
import com.kuo.artemis.server.core.helper.DataHelper;
import com.kuo.artemis.server.core.helper.ExcelHelper;
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
import com.kuo.artemis.server.util.StatisticsUtil;
import com.kuo.artemis.server.util.ValidationUtil;
import com.kuo.artemis.server.util.common.UUIDUtil;
import com.kuo.artemis.server.util.constant.GenderOptionConst;
import com.kuo.artemis.server.util.constant.GroupDesignMethodConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.InputStream;
import java.util.*;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/18
 */
@Service
public class AnimalServiceImpl implements AnimalService {

    private static Logger logger = LoggerFactory.getLogger(AnimalService.class);

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

    public Response getReplicateNumber(ReplicationCalculationParam param) {

        try {
            ValidationUtil.getInstance().validateParams(param);
        } catch (Exception e) {
            return new Response(e);
        }

        //获取请求参数
        Double alpha = Double.valueOf(param.getAlpha());
        Double power = Double.valueOf(param.getPower());
        MultipartFile file = param.getFile();

        //检测文件是否合法
        String filename = file.getOriginalFilename();
        if ((filename).endsWith(".xlsx") || (filename).endsWith(".xls")) {
            //nothing to do
        } else {
            return new Response(HttpStatus.FORBIDDEN.value(), "文件类型错误");
        }

        //解析excel文件
        List objectList;
        try {
            InputStream inputStream = file.getInputStream();
            List<List<String>> dataList = ExcelHelper.parseExcelFile(inputStream, filename);
            //FileImportCommand command = new FileImportCommand(file, null, null, null);
            //DataImportCommand dataImportCommand = ExcelHelper.parseExcelFile(command);
            DataImportDTO dataImportDTO = DataHelper.excelDataToBean(dataList, ReplicationCalculationDTO.class, 0, 1);
            objectList = dataImportDTO.getCommonList();
        } catch (Exception e) {
            return new Response(e);
        }

        //结构化数据
        Map<String, List<Double>> analysisDataMap = new HashMap<String, List<Double>>();
        for (Object o : objectList) {
            ReplicationCalculationDTO calculationDTO = (ReplicationCalculationDTO) o;
            String treatment = calculationDTO.getTreatment();
            String data = calculationDTO.getData();
            if (treatment == null || data == null) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "数据错误");
            }
            Double dataValue = Double.valueOf(data);

            if (analysisDataMap.containsKey(treatment)) {
                List<Double> dataList = analysisDataMap.get(treatment);
                dataList.add(dataValue);
            } else {
                List<Double> dataList = new ArrayList<Double>();
                dataList.add(dataValue);
                analysisDataMap.put(treatment, dataList);
            }
        }
        List<List<Double>> dataList = new ArrayList<List<Double>>();
        Set<String> keySet = analysisDataMap.keySet();
        Iterator<String> keySetIterator = keySet.iterator();
        while (keySetIterator.hasNext()) {
            String key = keySetIterator.next();
            dataList.add(analysisDataMap.get(key));
        }

        //运算
        Integer n = StatisticsUtil.calculateReplicationNum(alpha, power, dataList);

        return new Response(n, HttpStatus.OK.value(), "重复数");
    }


    /**
     * v2
     * @param command
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response importAnimalBasicList(DataImportCommand command) throws DataException {
        try {
            ValidationUtil.getInstance().validateParams(command);
        } catch (Exception e) {
            return new Response(e);
        }

        String projectId = command.getProjectId();
        List<List<String>> recordList = command.getDataList();
        DataImportDTO animalDTO = DataHelper.excelDataToBean(recordList, Animal.class, 0, 1);


        List animalList = animalDTO.getCommonList();


        for (int i = 0; i < animalList.size(); i++) {
            Animal animal = (Animal) animalList.get(i);
            animal.setProjectId(Integer.valueOf(projectId));
            animal.setSequence(i + 1);
            animal.setId(UUIDUtil.get32UUIDLowerCase());
            //检测动物数据适合合法
            if (animal.getIdNumber() == null || animal.getInitialBw() == null || animal.getAnimalSex() == null || animal.getOldPen() == null) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "缺少指标");
            }
        }

        List<Animal> animalListFromDB = animalMapper.selectAnimalGroupDetailList(Integer.valueOf(projectId));
        if (animalListFromDB != null && animalListFromDB.size() > 0) {
            return new Response(HttpStatus.CONFLICT.value(), "请勿重复导入");
        }
        int result = animalMapper.insertAnimalGroupDetailBatch(animalList);
        if (result <= 0) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "导入数据失败");
        }

        return new Response(HttpStatus.OK.value(), "导入成功");
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
        List<Animal> animalList = animalMapper.selectAnimalGroupDetailList(Integer.valueOf(projectId));
        if (animalHouseList == null || animalList == null || animalHouseList.size() == 0 || animalList.size() == 0) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "前置操作未完成");
        }

        //根据分组方法进行相应的选择
        if (GroupDesignMethodConst.COMPLETELY_RANDOMIZED_DESIGN.equals(designMethod)) {
            //完全随机化设计
            GroupDesignResult result = AnimalGroupHelper.groupByCRD(animalList, param, animalHouseList);
            if (result == null) {
                animalMapper.deleteAnimalGroupDetailByProjectId(Integer.valueOf(projectId));
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
                        animalMapper.deleteAnimalGroupDetailByProjectId(Integer.valueOf(projectId));
                        return new Response(HttpStatus.BAD_REQUEST.value(), "分组数据不足");
                    }
                    result.setParam(param);
                    result.setProjectId(projectId);
                    return new Response(result, HttpStatus.OK.value(), "分组结果");
                } else if (GenderOptionConst.GENDER_BALANCED_PENS.equals(genderOption)) {
                    GroupDesignResult result = AnimalGroupHelper.groupByRCBWithGenderBalance(animalList, param, animalHouseList);
                    if (result == null) {
                        animalMapper.deleteAnimalGroupDetailByProjectId(Integer.valueOf(projectId));
                        return new Response(HttpStatus.BAD_REQUEST.value(), "分组数据不足");
                    }
                    result.setParam(param);
                    result.setProjectId(projectId);
                    return new Response(result, HttpStatus.OK.value(), "分组结果");
                } else if (GenderOptionConst.DIFFERENT_GENDER_BALANCE_ACROSS_THE_REPLICATIONS.equals(genderOption)) {
                    GroupDesignResult result = AnimalGroupHelper.groupByRCBWithDifferentGenderBalances(animalList, param, animalHouseList);
                    if (result == null) {
                        animalMapper.deleteAnimalGroupDetailByProjectId(Integer.valueOf(projectId));
                        return new Response(HttpStatus.BAD_REQUEST.value(), "分组数据不足");
                    }
                    result.setParam(param);
                    result.setProjectId(projectId);
                    return new Response(result, HttpStatus.OK.value(), "分组结果");
                }
            } else {
                GroupDesignResult result = AnimalGroupHelper.groupByRCBWithoutGender(animalList, param, animalHouseList);
                if (result == null) {
                    animalMapper.deleteAnimalGroupDetailByProjectId(Integer.valueOf(projectId));
                    return new Response(HttpStatus.BAD_REQUEST.value(), "分组数据不足");
                }
                result.setParam(param);
                result.setProjectId(projectId);
                return new Response(result, HttpStatus.OK.value(), "分组结果");
            }
        }

        return new Response(HttpStatus.BAD_REQUEST.value(), "缺少参数或参数无效");
    }


    public Response getAnimalGroupResult(String projectId) throws Exception {

        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

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
        int groupStatus = animalMapper.selectAnimalGroupDetailStatus(Integer.valueOf(projectId));
        if (animalList == null || animalList.size() == 0 || animalHouseList == null || animalHouseList.size() == 0 || projectDetail == null || projectDetail.getGroupMethod() == 0 || groupStatus < 1) {
            return new Response(HttpStatus.NO_CONTENT.value(), "无分组结果");
        }

        GroupDesignParam param = new GroupDesignParam();
        param.setTreatmentNum(projectDetail.getTreatmentNum());
        param.setReplicationNum(projectDetail.getReplicationNum());
        param.setGenderOption(String.valueOf(projectDetail.getGenderMethod()));
        param.setDesignMethod(String.valueOf(projectDetail.getGroupMethod()));
        GroupDesignResult result = new GroupDesignResult();
        GroupDesign.setAnimalGroupSummary(animalList, param, result, true);
        GroupDesign.setAnimalGroupMovingSheet(animalList, result, true);
        result.setParam(param);
        result.setProjectId(projectId);
        result.setStatus("success");

        return new Response(result, HttpStatus.OK.value(), "分组结果");
    }

    @Transactional(rollbackFor = Exception.class)
    public Response commitAnimalGroupResult(GroupDesignResult result) throws Exception {

        try {
            ValidationUtil.getInstance().validateParams(result);
        } catch (Exception e) {
            return new Response(e);
        }

        String projectId = result.getProjectId();
        List<Animal> animalListFromDB = animalMapper.selectAnimalGroupDetailList(Integer.valueOf(projectId));
        if (animalListFromDB != null && animalListFromDB.size() > 0) {
            if (animalListFromDB.get(0).getNewPen() != null && animalListFromDB.get(0).getCoefficientOfVariation() != null) {
                return new Response(HttpStatus.CONFLICT.value(), "请勿重复分组");
            }
        }
        if (animalListFromDB != null && animalListFromDB.size() <= 0) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "提交失败");
        }

        //更新动物的house id
        List<Animal> animalList = result.getSummary().getAnimalAllotmentResult();
        GroupDesignParam param = result.getParam();
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
        animalMapper.updateAnimalGroupDetailBatch(animalList);

        //更新相关课题信息
        ProjectDetail oldProjectDetail = projectDetailMapper.selectByProjectId(Integer.valueOf(projectId));
        if (oldProjectDetail == null) {
            ProjectDetail projectDetail = new ProjectDetail();
            projectDetail.setProjectId(Integer.valueOf(result.getProjectId()));
            projectDetail.setReplicationNum(param.getReplicationNum());
            projectDetail.setTreatmentNum(param.getTreatmentNum());
            projectDetail.setGroupMethod(Short.valueOf(param.getDesignMethod()));
            String genderOption;
            if (param.getGenderOption() == null || "".equals(param.getGenderOption())) {
                genderOption = "0";
            } else {
                genderOption = param.getGenderOption();
            }
            projectDetail.setGenderMethod(Short.valueOf(genderOption));
            projectDetailMapper.insertSelective(projectDetail);
        } else {
            logger.info("------------------------------------------------------");
            logger.info("design method:"  + param.getDesignMethod());
            logger.info("genderOption:" + param.getGenderOption());
            String genderOption;
            if (param.getGenderOption() == null || "".equals(param.getGenderOption())) {
                genderOption = "0";
            } else {
                genderOption = param.getGenderOption();
            }

            oldProjectDetail.setGroupMethod(Short.valueOf(param.getDesignMethod()));
            oldProjectDetail.setGenderMethod(Short.valueOf(genderOption));
            projectDetailMapper.updateByPrimaryKeySelective(oldProjectDetail);
        }


        GroupDesign.setAnimalGroupSummary(animalList, param, result, true);
        GroupDesign.setAnimalGroupMovingSheet(animalList, result, true);
        result.setStatus("success");
        return new Response(result, HttpStatus.OK.value(), "提交成功");
    }

    @Transactional(rollbackFor = Exception.class)
    public Response deleteAnimalGroupResult(String projectId) {
        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        int deleteStatus = animalMapper.deleteAnimalGroupDetailByProjectId(Integer.valueOf(projectId));
        ProjectDetail oldProjectDetail = projectDetailMapper.selectByProjectId(Integer.valueOf(projectId));
        if (oldProjectDetail != null) {
            oldProjectDetail.setGroupMethod(Short.valueOf("0"));
            oldProjectDetail.setGenderMethod(Short.valueOf("0"));
            projectDetailMapper.updateByPrimaryKeySelective(oldProjectDetail);
        }
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
