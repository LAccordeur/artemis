package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.statistics.StatisticsParam;

public interface StatisticsService {

    /**
     * 独立样本T检验
     * @param param
     * @return
     */
    Response independentSampleTTest(StatisticsParam param);

    Response oneWayAnalysisOfVariance(StatisticsParam param);

    Response twoWayAnalysisOfVariance(StatisticsParam param);

    Response listStatisticsRecords(String projectId);

    Response getStatisticsRecordDetail(String recordId);

    Response deleteStatisticsRecord(String recordId);

    Response selectIndicatorSet(String projectId, String fileIdentifier, String version);
}
