package com.kuo.artemis.server.service.impl;

//import com.datumbox.common.dataobjects.AssociativeArray2D;
import com.datumbox.framework.common.dataobjects.AssociativeArray2D;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.statistics.StatisticsItem;
import com.kuo.artemis.server.core.dto.statistics.StatisticsParam;
import com.kuo.artemis.server.core.exception.MathException;
import com.kuo.artemis.server.core.factory.DecimalFormatFactory;
import com.kuo.artemis.server.dao.*;
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

    @Inject
    private FileRecordMapper fileRecordMapper;

    @Inject
    private ExcelFileDetailMapper excelFileDetailMapper;

    private DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();

    @Transactional(rollbackFor = Exception.class)
    public Response independentSampleTTest(StatisticsParam param) throws MathException {
        String projectId = param.getProjectId();
        String fileIdentifier = param.getFileIdentifier();
        String version = param.getVersion();
        String userId = param.getUserId();
        List<String> indicatorIdList = param.getIndicatorIdList();
        String statisticsCode = param.getStatisticsCode();

        //获取处理组编号
        List<String> treatmentCodeList = statisticsDetailItemMapper.selectTreatmentCodes(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        if (treatmentCodeList.size() != 2) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "数据无效");
        }
        //获取指标名称
        List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectByPrimaryKeys(indicatorIdList);

        //一次分析对应一个record
        StatisticsRecord statisticsRecord = new StatisticsRecord();
        statisticsRecord.setStatisticsCode(statisticsCode);
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
            statisticsDetailRecord.setpValue(new BigDecimal(decimalFormat.format(pValue)));
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
    public Response oneWayAnalysisOfVariance(StatisticsParam param) throws MathException {

        String projectId = param.getProjectId();
        String fileIdentifier = param.getFileIdentifier();
        String version = param.getVersion();
        String userId = param.getUserId();
        List<String> indicatorIdList = param.getIndicatorIdList();
        String statisticsCode = param.getStatisticsCode();

        //获取处理组编号
        List<String> treatmentCodeList = statisticsDetailItemMapper.selectTreatmentCodes(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        if (treatmentCodeList.size() < 2) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "数据缺失");
        }
        //获取指标名称
        List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectByPrimaryKeys(indicatorIdList);

        //一次分析对应一个record
        StatisticsRecord statisticsRecord = new StatisticsRecord();
        statisticsRecord.setStatisticsCode(statisticsCode);
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
            statisticsDetailRecord.setpValue(new BigDecimal(decimalFormat.format(pValue)));
            statisticsDetailRecord.setStatisticsIndicatorName(indicatorName);

        }

        saveRecord(projectId, userId, StatisticsMethodConst.ONE_WAY_ANOVA, statisticsRecord);

        return new Response(statisticsRecord, HttpStatus.OK.value(), "单因素方差分析");
    }

    /**
     *
     * @param param
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Response twoWayAnalysisOfVariance(StatisticsParam param) throws MathException {

        String projectId = param.getProjectId();
        String fileIdentifier = param.getFileIdentifier();
        String version = param.getVersion();
        String userId = param.getUserId();
        List<String> indicatorIdList = param.getIndicatorIdList();
        String statisticsCode = param.getStatisticsCode();

        //获取处理组编号
        List<String> treatmentCodeList = statisticsDetailItemMapper.selectTreatmentCodes(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
        if (treatmentCodeList.size() < 2) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "数据缺失");
        }
        //获取指标名称
        List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectByPrimaryKeys(indicatorIdList);

        //一次分析对应一个record
        StatisticsRecord statisticsRecord = new StatisticsRecord();
        statisticsRecord.setStatisticsCode(statisticsCode);
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
            if (factorALevels == null || factorALevels.size() == 0 || factorALevels.get(0) == null) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "数据错误");
            }
            List<String> factorBLevels = statisticsDetailItemMapper.selectFactorBLevels(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version));
            if (factorBLevels == null || factorBLevels.size() == 0 || factorBLevels.get(0) == null) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "数据错误");
            }
            for (int m = 0; m < factorALevels.size(); m++) {
                String aLevel = factorALevels.get(m);
                Map<String, List<Object>> map = new HashMap<String, List<Object>>();
                dataMap.put(aLevel, map);
            }

            //依次获取每个指标下每个处理组的数据
            for (int j = 0; j < treatmentCodeList.size(); j++) {
                String treatmentCode = treatmentCodeList.get(j);
                StatisticsItem item = new StatisticsItem();
                statisticsDetailItemList.add(item);

                List treatmentData = statisticsDetailItemMapper.selectTreatmentData(Integer.valueOf(projectId), fileIdentifier, Integer.valueOf(version), treatmentCode, formatIndicatorName);
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
                item.setFactorA(factorA);
                item.setFactorB(factorB);
                dataMap.get(factorA).put(factorB, treatmentData);
            }


            //获取每个指标的双因素分析结果
            AssociativeArray2D outputTable = StatisticsUtil.twoWayAnalysisOfVariance(dataMap);
            Object aFactorP = outputTable.get2d("AFactor", "p");
            Object bFactorP = outputTable.get2d("BFactor", "p");
            Object abFactorP = outputTable.get2d("A*BFactor", "p");
            statisticsDetailRecord.setpValueFactorA(new BigDecimal(decimalFormat.format(aFactorP)));
            statisticsDetailRecord.setpValueFactorB(new BigDecimal(decimalFormat.format(bFactorP)));
            statisticsDetailRecord.setpValue(new BigDecimal(decimalFormat.format(abFactorP)));
            statisticsDetailRecord.setStatisticsIndicatorName(indicatorName);
        }

        saveRecord(projectId, userId, StatisticsMethodConst.TWO_WAY_ANOVA, statisticsRecord);

        return new Response(statisticsRecord, HttpStatus.OK.value(), "双因素方差分析");
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

    /**
     * 选择当前版本文件下可进行分析的指标集
     * @param projectId
     * @param fileIdentifier
     * @param version
     * @return
     */
    public Response selectIndicatorSet(String projectId, String fileIdentifier, String version) {

        Integer fileRecordId = fileRecordMapper.selectIdByProjectIdAndFileIdentifierAndVersion(projectId, fileIdentifier, Integer.valueOf(version));
        if (fileRecordId == null) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数无效");
        }
        List<ExcelFileDetail> excelFileDetailList = excelFileDetailMapper.selectByFileRecordId(fileRecordId);

        //剔除不能进行分析的指标
        List<AnimalIndicator> animalIndicatorList = animalIndicatorMapper.selectIndicatorsByType(1); //类型为1的指标需要剔除
        filterIndicators(excelFileDetailList, animalIndicatorList);

        return new Response(excelFileDetailList, HttpStatus.OK.value(), "指标集合");
    }

    private void filterIndicators(List<ExcelFileDetail> excelFileDetailList, List<AnimalIndicator> animalIndicatorList) {
        for (int i = 0; i < excelFileDetailList.size(); i++) {
            ExcelFileDetail excelFileDetail = excelFileDetailList.get(i);

            Integer indicatorId = excelFileDetail.getIndicatorId();
            String indicatorName = excelFileDetail.getIndicatorName();
            for (AnimalIndicator animalIndicator : animalIndicatorList) {
                if (indicatorId.equals(animalIndicator.getId()) || indicatorName.toLowerCase().equals(animalIndicator.getIndicatorNameEnglish().toLowerCase())) {
                    excelFileDetailList.set(i, null);
                }
            }
        }

        List nullList = new ArrayList();
        nullList.add(null);
        if (excelFileDetailList.contains(null)) {
            excelFileDetailList.removeAll(nullList);
        }
    }
}
