package com.kuo.artemis.server.core.dto.animal;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.kuo.artemis.server.entity.AnimalHouse;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/17
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RandomDistributionParam {

    @NotNull
    private String projectId;

    private String buildingCode;

    @NotNull
    private Short houseStyle;    //圈舍风格

    @NotNull
    private Integer houseNumber;  //圈舍总数目

    @NotNull
    private Integer replicationNum;   //重复数

    @NotNull
    private Integer treatmentNum;    //处理数

    @NotNull
    private List<AnimalHouse> animalHouseList;

    @Override
    public String toString() {
        return "RandomDistributionParam{" +
                "projectId='" + projectId + '\'' +
                ", buildingCode='" + buildingCode + '\'' +
                ", houseStyle=" + houseStyle +
                ", houseNumber=" + houseNumber +
                ", replicationNum=" + replicationNum +
                ", treatmentNum=" + treatmentNum +
                ", animalHouseList=" + animalHouseList +
                '}';
    }

    public String getBuildingCode() {
        return buildingCode;
    }

    public void setBuildingCode(String buildingCode) {
        this.buildingCode = buildingCode;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public List<AnimalHouse> getAnimalHouseList() {
        return animalHouseList;
    }

    public void setAnimalHouseList(List<AnimalHouse> animalHouseList) {
        this.animalHouseList = animalHouseList;
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
