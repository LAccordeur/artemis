package com.kuo.artemis.server.core.dto.animal;

import javax.validation.constraints.NotNull;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/17
 */
public class RandomDistributionParam {

    @NotNull
    private Short houseStyle;    //圈舍风格

    private Integer houseNumber;  //圈舍总数目

    @NotNull
    private Integer replicationNum;   //重复数

    @NotNull
    private Integer treatmentNum;    //处理数

    @Override
    public String toString() {
        return "RandomDistributionParam{" +
                "houseStyle=" + houseStyle +
                ", houseNumber=" + houseNumber +
                ", replicationNum=" + replicationNum +
                ", treatmentNum=" + treatmentNum +
                '}';
    }

    public Integer getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(Integer houseNumber) {
        this.houseNumber = houseNumber;
    }

    public Short getHouseStyle() {
        return houseStyle;
    }

    public void setHouseStyle(Short houseStyle) {
        this.houseStyle = houseStyle;
    }

    public Integer getReplicationNum() {
        return replicationNum;
    }

    public void setReplicationNum(Integer replicationNum) {
        this.replicationNum = replicationNum;
    }

    public Integer getTreatmentNum() {
        return treatmentNum;
    }

    public void setTreatmentNum(Integer treatmentNum) {
        this.treatmentNum = treatmentNum;
    }
}
