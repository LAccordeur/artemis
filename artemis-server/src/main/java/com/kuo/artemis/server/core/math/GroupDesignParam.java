package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.core.dto.animal.GroupGenderParam;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/20
 */
public class GroupDesignParam {

    private Integer animalNumber;    //动物数目

    private Integer treatmentNum;    //处理组数

    private Integer replicationNum;    //重复数

    private Integer unitNumber;    //每个组的动物数

    private Integer unitMaleNum;    //考虑性别的情况下每个组的雄性动物数

    private Integer unitFemaleNum;    //考虑性别的情况下每个组的雌性动物数

    private Integer maleReplicationNum;    //雄性重复组数目

    private Integer femaleReplicationNum;    //雌性重复组数目

    private List<GroupGenderParam> differentGenderBalancesParamList;    //

    private String designMethod;    //分组方法

    private boolean isConsiderGender;    //是否考虑性别

    private Double coefficientAllowance;    //变异系数

    private Integer maximumLoop;    //最大循环次数

    public GroupDesignParam() {
        this.coefficientAllowance = 5D;
        this.maximumLoop = 30;
    }

    public List<GroupGenderParam> getDifferentGenderBalancesParamList() {
        return differentGenderBalancesParamList;
    }

    public void setDifferentGenderBalancesParamList(List<GroupGenderParam> differentGenderBalancesParamList) {
        this.differentGenderBalancesParamList = differentGenderBalancesParamList;
    }

    public Integer getMaleReplicationNum() {
        return maleReplicationNum;
    }

    public void setMaleReplicationNum(Integer maleReplicationNum) {
        this.maleReplicationNum = maleReplicationNum;
    }

    public Integer getFemaleReplicationNum() {
        return femaleReplicationNum;
    }

    public void setFemaleReplicationNum(Integer femaleReplicationNum) {
        this.femaleReplicationNum = femaleReplicationNum;
    }

    public Integer getUnitMaleNum() {
        return unitMaleNum;
    }

    public void setUnitMaleNum(Integer unitMaleNum) {
        this.unitMaleNum = unitMaleNum;
    }

    public Integer getUnitFemaleNum() {
        return unitFemaleNum;
    }

    public void setUnitFemaleNum(Integer unitFemaleNum) {
        this.unitFemaleNum = unitFemaleNum;
    }

    public boolean isConsiderGender() {
        return isConsiderGender;
    }

    public void setConsiderGender(boolean considerGender) {
        isConsiderGender = considerGender;
    }

    public Integer getAnimalNumber() {
        return animalNumber;
    }

    public void setAnimalNumber(Integer animalNumber) {
        this.animalNumber = animalNumber;
    }

    public Double getCoefficientAllowance() {
        return coefficientAllowance;
    }

    public void setCoefficientAllowance(Double coefficientAllowance) {
        this.coefficientAllowance = coefficientAllowance;
    }

    public Integer getMaximumLoop() {
        return maximumLoop;
    }

    public void setMaximumLoop(Integer maximumLoop) {
        this.maximumLoop = maximumLoop;
    }

    public Integer getTreatmentNum() {
        return treatmentNum;
    }

    public void setTreatmentNum(Integer treatmentNum) {
        this.treatmentNum = treatmentNum;
    }

    public Integer getReplicationNum() {
        return replicationNum;
    }

    public void setReplicationNum(Integer replicationNum) {
        this.replicationNum = replicationNum;
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
