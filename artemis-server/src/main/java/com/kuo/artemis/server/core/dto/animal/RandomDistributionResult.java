package com.kuo.artemis.server.core.dto.animal;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.kuo.artemis.server.entity.AnimalHouse;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/17
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RandomDistributionResult {

    private String projectId;    //课题id

    private String buildingCode;    //圈舍所在房间的编号

    private List<List<String>> houseCodeList;

    private List<List> randomResult;

    private List<AnimalHouse> animalHouseList;

    private RandomDistributionParam param;

    @Override
    public String toString() {
        return "RandomDistributionResult{" +
                "projectId='" + projectId + '\'' +
                ", buildingCode='" + buildingCode + '\'' +
                ", houseCodeList=" + houseCodeList +
                ", randomResult=" + randomResult +
                ", animalHouseList=" + animalHouseList +
                ", param=" + param +
                '}';
    }

    public List<AnimalHouse> getAnimalHouseList() {
        return animalHouseList;
    }

    public void setAnimalHouseList(List<AnimalHouse> animalHouseList) {
        this.animalHouseList = animalHouseList;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getBuildingCode() {
        return buildingCode;
    }

    public void setBuildingCode(String buildingCode) {
        this.buildingCode = buildingCode;
    }

    public List<List<String>> getHouseCodeList() {
        return houseCodeList;
    }

    public void setHouseCodeList(List<List<String>> houseCodeList) {
        this.houseCodeList = houseCodeList;
    }

    public RandomDistributionParam getParam() {
        return param;
    }

    public void setParam(RandomDistributionParam param) {
        this.param = param;
    }

    public List<List> getRandomResult() {
        return randomResult;
    }

    public void setRandomResult(List<List> randomResult) {
        this.randomResult = randomResult;
    }
}
