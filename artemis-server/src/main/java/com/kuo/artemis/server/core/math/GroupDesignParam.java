package com.kuo.artemis.server.core.math;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.kuo.artemis.server.core.dto.animal.GroupGenderParam;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/20
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GroupDesignParam {

    @NotNull
    private String projectId;

    private Integer animalNumber;    //动物数目

    @NotNull
    private Integer treatmentNum;    //处理组数

    @NotNull
    private Integer replicationNum;    //重复数

    @NotNull
    private Integer unitNumber;    //每个组的动物数

    private Integer unitMaleNum;    //考虑性别的情况下每个组的雄性动物数

    private Integer unitFemaleNum;    //考虑性别的情况下每个组的雌性动物数

    private Integer maleReplicationNum;    //雄性重复组数目

    private Integer femaleReplicationNum;    //雌性重复组数目

    private List<GroupGenderParam> differentGenderBalancesParamList;    //

    @NotNull
    private String designMethod;    //分组方法

    @NotNull
    private String considerGender;    //是否考虑性别

    private String genderOption;

    private Double coefficientAllowance;    //变异系数

    private Integer maximumLoop;    //最大循环次数

    public GroupDesignParam() {
        this.coefficientAllowance = 5D;
        this.maximumLoop = 30;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getGenderOption() {
        return genderOption;
    }

    public void setGenderOption(String genderOption) {
        this.genderOption = genderOption;
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

    public String getConsiderGender() {
        return considerGender;
    }

    public void setConsiderGender(String considerGender) {
        this.considerGender = considerGender;
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
