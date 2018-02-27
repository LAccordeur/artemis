package com.kuo.artemis.server.service.impl;

import com.datumbox.common.dataobjects.AssociativeArray2D;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.statistics.StatisticsItem;
import com.kuo.artemis.server.core.dto.statistics.StatisticsParam;
import com.kuo.artemis.server.core.factory.DecimalFormatFactory;
import com.kuo.artemis.server.dao.AnimalIndicatorMapper;
import com.kuo.artemis.server.dao.StatisticsDetailItemMapper;
import com.kuo.artemis.server.dao.StatisticsDetailRecordMapper;
import com.kuo.artemis.server.dao.StatisticsRecordMapper;
import com.kuo.artemis.server.entity.*;
import com.kuo.artemis.server.service.StatisticsService;
import com.kuo.artemis.server.util.StatisticsUtil;
import com.kuo.artemis.server.util.common.BeanUtil;
import com.kuo.artemis.server.util.common.StringUtil;
import com.kuo.artemis.server.util.constant.StatisticsMethodConst;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.*;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/2/6
 */
@Service
public class StatisticsServiceImpl implements StatisticsService {

    @Inject
    private StatisticsRecordMapper statisticsRecordMapper;

    @Inject
    private StatisticsDetailRecordMapper statisticsDetailRecordMapper;

    @Inject
    private StatisticsDetailItemMapper statisticsDetailItemMapper;

    @Inject
    private AnimalIndicatorMapper animalIndicatorMapper;


    @Transactional(rollbackFor = Exception.class)
    public Response independentSampleTTest(StatisticsParam param) {
        String projectId = param.getProjectId();
        String fileIdentifier = param.getFileIdentifier();
        String version = param.getVersion();
        String userId = param.getUserId();
        List<String> indicatorIdList = param.getIndicatorIdList();

        //获取处理组编号
        List<String> treatmentCodeList = statisticsDetailItemMapper.selectTreatmentCodes(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        if (treatmentCodeList.size() != 2) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "数据无效");
        }
        //获取指标名称
        List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectByPrimaryKeys(indicatorIdList);

        //一次分析对应一个record
        StatisticsRecord statisticsRecord = new StatisticsRecord();
        List<StatisticsDetailRecord> statisticsDetailRecordList = new ArrayList<StatisticsDetailRecord>();
        statisticsRecord.setStatisticsDetailRecordList(statisticsDetailRecordList);
        //依次对每个指标进行分析
        for (int i = 0; i < animalIndicatorList.size(); i++) {
            //一个指标分析对应一个detail record
            StatisticsDetailRecord statisticsDetailRecord = new StatisticsDetailRecord();
            statisticsDetailRecordList.add(statisticsDetailRecord);

            //一个指标下的一个处理组对应一个item
            List<StatisticsDetailItem> statisticsDetailItemList = new ArrayList<StatisticsDetailItem>();
            statisticsDetailRecord.setStatisticsDetailItemList(statisticsDetailItemList);

            String indicatorName = animalIndicatorList.get(i).getIndicatorNameEnglish();
            String formatIndicatorName = BeanUtil.spaceFieldToUnderline(indicatorName);  //TODO BUG排除

            List<Double> sample1 = null;
            List<Double> sample2 = null;
            //依次获取每个指标下每个处理组的数据
            for (int j = 0; j < treatmentCodeList.size(); j++) {
                String treatmentCode = treatmentCodeList.get(j);
                StatisticsItem item = new StatisticsItem();
                statisticsDetailItemList.add(item);

                List<Double> treatmentData = statisticsDetailItemMapper.selectTreatmentData(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version), treatmentCode, formatIndicatorName);
                item.setInitialData(treatmentData);
                item.setItemCode(treatmentCode);
                //计算每个处理组的均值和标准差
                Double mean = StatisticsUtil.mean(treatmentData);
                Double stderr = StatisticsUtil.standardError(treatmentData);
                DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();
                item.setItemMean(new BigDecimal(decimalFormat.format(mean)));
                item.setItemStderr(new BigDecimal(decimalFormat.format(stderr)));

                if (j == 0) {  //TODO 改进
                    sample1 = treatmentData;
                }
                if (j == 1) {
                    sample2 = treatmentData;
                }
            }

            //计算该指标下各个处理组之间的p值
            Double pValue = StatisticsUtil.independentSampleTTest(sample1, sample2);
            statisticsDetailRecord.setpValue(BigDecimal.valueOf(pValue));
            statisticsDetailRecord.setStatisticsIndicatorName(indicatorName);

        }

        //更新至数据库
        saveRecord(projectId, userId, StatisticsMethodConst.T_TEST, statisticsRecord);

        return new Response(statisticsRecord, HttpStatus.OK.value(), "独立样本T检验");
    }

    private void saveRecord(String projectId, String userId, String method, StatisticsRecord statisticsRecord) {
        statisticsRecord.setUserId(Integer.valueOf(userId));
        statisticsRecord.setProjectId(Integer.valueOf(projectId));
        statisticsRecord.setStatisticsMethod(Short.valueOf(method));
        statisticsRecordMapper.insertSelective(statisticsRecord);
        Integer statisticsRecordId = statisticsRecord.getId();


        for (StatisticsDetailRecord detailRecord : statisticsRecord.getStatisticsDetailRecordList()) {
            detailRecord.setStatisticsRecordId(statisticsRecordId);
            statisticsDetailRecordMapper.insertSelective(detailRecord);

            Integer detailRecordId = detailRecord.getId();
            for (StatisticsDetailItem item : detailRecord.getStatisticsDetailItemList()) {
                item.setStatisticsDetailRecordId(detailRecordId);
            }
            statisticsDetailItemMapper.insertBatch(detailRecord.getStatisticsDetailItemList());
        }
    }


    @Transactional(rollbackFor = Exception.class)
    public Response oneWayAnalysisOfVariance(StatisticsParam param) {

        String projectId = param.getProjectId();
        String fileIdentifier = param.getFileIdentifier();
        String version = param.getVersion();
        String userId = param.getUserId();
        List<String> indicatorIdList = param.getIndicatorIdList();

        //获取处理组编号
        List<String> treatmentCodeList = statisticsDetailItemMapper.selectTreatmentCodes(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        //获取指标名称
        List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectByPrimaryKeys(indicatorIdList);

        //一次分析对应一个record
        StatisticsRecord statisticsRecord = new StatisticsRecord();
        List<StatisticsDetailRecord> statisticsDetailRecordList = new ArrayList<StatisticsDetailRecord>();
        statisticsRecord.setStatisticsDetailRecordList(statisticsDetailRecordList);
        //依次对每个指标进行分析
        for (int i = 0; i < animalIndicatorList.size(); i++) {
            //一个指标分析对应一个detail record
            StatisticsDetailRecord statisticsDetailRecord = new StatisticsDetailRecord();
            statisticsDetailRecordList.add(statisticsDetailRecord);

            //一个指标下的一个处理组对应一个item
            List<StatisticsDetailItem> statisticsDetailItemList = new ArrayList<StatisticsDetailItem>();
            statisticsDetailRecord.setStatisticsDetailItemList(statisticsDetailItemList);

            String indicatorName = animalIndicatorList.get(i).getIndicatorNameEnglish();
            String formatIndicatorName = BeanUtil.spaceFieldToUnderline(indicatorName);  //TODO BUG排除

            List<List<Double>> dataList = new ArrayList<List<Double>>();
            //依次获取每个指标下每个处理组的数据
            for (int j = 0; j < treatmentCodeList.size(); j++) {
                String treatmentCode = treatmentCodeList.get(j);
                StatisticsItem item = new StatisticsItem();
                statisticsDetailItemList.add(item);

                List<Double> treatmentData = statisticsDetailItemMapper.selectTreatmentData(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version), treatmentCode, formatIndicatorName);
                item.setInitialData(treatmentData);
                item.setItemCode(treatmentCode);
                //计算每个处理组的均值和标准差
                Double mean = StatisticsUtil.mean(treatmentData);
                Double stderr = StatisticsUtil.standardError(treatmentData);
                DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();
                item.setItemMean(new BigDecimal(decimalFormat.format(mean)));
                item.setItemStderr(new BigDecimal(decimalFormat.format(stderr)));

                dataList.add(treatmentData);
            }

            //计算该指标下各个处理组之间的p值
            Double pValue = StatisticsUtil.oneWayAnalysisOfVariance(dataList);
            statisticsDetailRecord.setpValue(BigDecimal.valueOf(pValue));
            statisticsDetailRecord.setStatisticsIndicatorName(indicatorName);

        }

        saveRecord(projectId, userId, StatisticsMethodConst.ONE_WAY_ANOVA, statisticsRecord);

        return new Response(statisticsRecord, HttpStatus.OK.value(), "单因素方差分析");
    }

    @Transactional(rollbackFor = Exception.class)
    public Response twoWayAnalysisOfVariance(StatisticsParam param) {

        String projectId = param.getProjectId();
        String fileIdentifier = param.getFileIdentifier();
        String version = param.getVersion();
        String userId = param.getUserId();
        List<String> indicatorIdList = param.getIndicatorIdList();


        //获取处理组编号
        List<String> treatmentCodeList = statisticsDetailItemMapper.selectTreatmentCodes(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        //获取指标名称
        List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectByPrimaryKeys(indicatorIdList);

        //一次分析对应一个record
        StatisticsRecord statisticsRecord = new StatisticsRecord();
        List<StatisticsDetailRecord> statisticsDetailRecordList = new ArrayList<StatisticsDetailRecord>();
        statisticsRecord.setStatisticsDetailRecordList(statisticsDetailRecordList);
        for (int i = 0; i < animalIndicatorList.size(); i++) {
            //一个指标分析对应一个detail record
            StatisticsDetailRecord statisticsDetailRecord = new StatisticsDetailRecord();
            statisticsDetailRecordList.add(statisticsDetailRecord);

            //一个指标下的一个处理组对应一个item
            List<StatisticsDetailItem> statisticsDetailItemList = new ArrayList<StatisticsDetailItem>();
            statisticsDetailRecord.setStatisticsDetailItemList(statisticsDetailItemList);

            String indicatorName = animalIndicatorList.get(i).getIndicatorNameEnglish();
            String formatIndicatorName = BeanUtil.spaceFieldToUnderline(indicatorName);  //TODO BUG排除

            //组装放入分析函数的数据结构
            Map<String, Map<String, List<Object>>> dataMap = new HashMap<String, Map<String, List<Object>>>();
            List<String> factorALevels = statisticsDetailItemMapper.selectFactorALevels(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
            //List<String> factorBLevels = statisticsDetailItemMapper.selectFactorBLevels(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
            for (int m = 0; m < factorALevels.size(); m++) {
                String aLevel = factorALevels.get(m);
                Map<String, List<Object>> map = new HashMap<String, List<Object>>();
                dataMap.put(aLevel, map);
                /*for (int n = 0; n < factorBLevels.size(); n++) {
                    String bLevel = factorBLevels.get(n);
                    map.put(bLevel, null);

                }*/
            }

            //依次获取每个指标下每个处理组的数据
            for (int j = 0; j < treatmentCodeList.size(); j++) {
                String treatmentCode = treatmentCodeList.get(j);
                StatisticsItem item = new StatisticsItem();
                statisticsDetailItemList.add(item);

                List<Double> treatmentData = statisticsDetailItemMapper.selectTreatmentData(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version), treatmentCode, formatIndicatorName);
                item.setInitialData(treatmentData);
                item.setItemCode(treatmentCode);
                //计算每个处理组的均值和标准差
                Double mean = StatisticsUtil.mean(treatmentData);
                Double stderr = StatisticsUtil.standardError(treatmentData);
                DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();
                item.setItemMean(new BigDecimal(decimalFormat.format(mean)));
                item.setItemStderr(new BigDecimal(decimalFormat.format(stderr)));

                //获取该处理组对应的两个因素的水平
                Animal animal = statisticsDetailItemMapper.selectFactorsByTreatmentCode(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version), treatmentCode);
                String factorA = animal.getFactorA();
                String factorB = animal.getFactorB();
                //dataMap.get(factorA).put(factorB, treatmentData);
            }


            //获取每个指标的双因素分析结果
            AssociativeArray2D outputTable = StatisticsUtil.twoWayAnalysisOfVariance(dataMap);
        }


        return null;
    }

    public Response listStatisticsRecords(String projectId) {

        if (projectId == null || "".equals(projectId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }
        List<StatisticsRecord> statisticsRecordList = statisticsRecordMapper.selectStatisticsRecordByProjectId(Integer.valueOf(projectId));

        return new Response(statisticsRecordList, HttpStatus.OK.value(), "分析记录列表");
    }

    public Response getStatisticsRecordDetail(String recordId) {

        if (recordId == null || "".equals(recordId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        StatisticsRecord record = statisticsRecordMapper.selectStatisticsRecordDetailByRecordId(Integer.valueOf(recordId));

        return new Response(record, HttpStatus.OK.value(), "分析结果");
    }

    @Transactional(rollbackFor = Exception.class)
    public Response deleteStatisticsRecord(String recordId) {

        if (recordId == null || "".equals(recordId)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }
        Integer result = statisticsRecordMapper.deleteRecordById(Integer.valueOf(recordId));

        if (result <= 0) {
            return new Response(HttpStatus.NO_CONTENT.value(), "请求删除的内容不存在");
        } else {
            return new Response(HttpStatus.OK.value(), "删除成功");
        }
    }
}
