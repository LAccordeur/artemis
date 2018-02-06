package com.kuo.artemis.server.core.dto.statistics;

import com.kuo.artemis.server.entity.StatisticsDetailItem;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/2/6
 */
public class StatisticsItem extends StatisticsDetailItem {

    private List<Double> initialData; //某个指标的某个处理组的原始数据

    public List<Double> getInitialData() {
        return initialData;
    }

    public void setInitialData(List<Double> initialData) {
        this.initialData = initialData;
    }
}
