package com.kuo.artemis.server.core.math;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/20
 */
public class GroupDesignParam {

    private Integer animalNumber;    //动物数目

    private Integer treatment;    //处理组数

    private Integer replication;    //重复数

    private Integer unitNumber;    //每个组的动物数

    private String designMethod;    //分组方法

    //private boolean isConsiderGender;    //是否考虑性别

    private Double coefficientVariation;    //变异系数

    private Integer MaximumRunningFrequency;    //最大循环次数

    public Integer getAnimalNumber() {
        return animalNumber;
    }

    public void setAnimalNumber(Integer animalNumber) {
        this.animalNumber = animalNumber;
    }

    public Double getCoefficientVariation() {
        return coefficientVariation;
    }

    public void setCoefficientVariation(Double coefficientVariation) {
        this.coefficientVariation = coefficientVariation;
    }

    public Integer getMaximumRunningFrequency() {
        return MaximumRunningFrequency;
    }

    public void setMaximumRunningFrequency(Integer maximumRunningFrequency) {
        MaximumRunningFrequency = maximumRunningFrequency;
    }

    public Integer getTreatment() {
        return treatment;
    }

    public void setTreatment(Integer treatment) {
        this.treatment = treatment;
    }

    public Integer getReplication() {
        return replication;
    }

    public void setReplication(Integer replication) {
        this.replication = replication;
    }

    public Integer getUnitNumber() {
        return unitNumber;
    }

    public void setUnitNumber(Integer unitNumber) {
        this.unitNumber = unitNumber;
    }

    public String getDesignMethod() {
        return designMethod;
    }

    public void setDesignMethod(String designMethod) {
        this.designMethod = designMethod;
    }
}
