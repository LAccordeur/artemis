package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.statistics.StatisticsParam;
import com.kuo.artemis.server.core.exception.MathException;

public interface StatisticsService {

    /**
     * 独立样本T检验
     * @param param
     * @return
     */
    Response independentSampleTTest(StatisticsParam param) throws MathException;

    /**
     * 单因素方差分析
     * @param param
     * @return
     */
    Response oneWayAnalysisOfVariance(StatisticsParam param) throws MathException;

    /**
     * 两因素方差分析
     * @param param
     * @return
     */
    Response twoWayAnalysisOfVariance(StatisticsParam param) throws MathException;

    /**
     * 当前课题下的分析记录列表
     * @param projectId
     * @return
     */
    Response listStatisticsRecords(String projectId);

    /**
     * 获取详细的分析结果
     * @param recordId
     * @return
     */
    Response getStatisticsRecordDetail(String recordId);

    /**
     * 删除某个分析结果
     * @param recordId
     * @return
     */
    Response deleteStatisticsRecord(String recordId);

    /**
     * 获取可分析的指标集
     * @param projectId
     * @param fileIdentifier
     * @param version
     * @return
     */
    Response selectIndicatorSet(String projectId, String fileIdentifier, String version);
}
