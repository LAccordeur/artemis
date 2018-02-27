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

    private String factorA;   //用于双因素方差分析

    private String factorB;   //用于双因素方差分析

    public String getFactorA() {
        return factorA;
    }

    public void setFactorA(String factorA) {
        this.factorA = factorA;
    }

    public String getFactorB() {
        return factorB;
    }

    public void setFactorB(String factorB) {
        this.factorB = factorB;
    }

    public List<Double> getInitialData() {
        return initialData;
    }

    public void setInitialData(List<Double> initialData) {
        this.initialData = initialData;
    }
}
