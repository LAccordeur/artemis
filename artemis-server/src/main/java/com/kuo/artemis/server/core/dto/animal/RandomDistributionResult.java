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
public class RandomDistributionResult {

    @NotNull
    private String projectId;    //课题id

    private String buildingCode;    //圈舍所在房间的编号

    @NotNull
    private List<AnimalHouse> animalHouseList;

    @NotNull
    private RandomDistributionParam param;

    @Override
    public String toString() {
        return "RandomDistributionResult{" +
                "projectId='" + projectId + '\'' +
                ", buildingCode='" + buildingCode + '\'' +
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

    public RandomDistributionParam getParam() {
        return param;
    }

    public void setParam(RandomDistributionParam param) {
        this.param = param;
    }


}
