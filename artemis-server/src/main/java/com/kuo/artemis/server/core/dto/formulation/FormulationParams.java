package com.kuo.artemis.server.core.dto.formulation;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public class FormulationParams {

    private String formulationId;

    private String formulationCode;    //配方编号

    private String formulationName;    //配方名称

    @NotNull
    private List<Integer> materialIdList;    //选取的配方id集合

    private String nutritionStandardId;    //营养标准id

    private String userId;    //生成该配方的用户id

    private String projectId;

    @NotNull
    private List<Double> materialLeftBoundList;

    @NotNull
    private List<Double> materialRightBoundList;

    @NotNull
    private List<Double> nutritionStandardLeftBoundList;

    @NotNull
    private List<Double> nutritionStandardRightBoundList;

    @Override
    public String toString() {
        return "FormulationParams{" +
                "formulationId='" + formulationId + '\'' +
                ", formulationCode='" + formulationCode + '\'' +
                ", formulationName='" + formulationName + '\'' +
                ", materialIdList=" + materialIdList +
                ", nutritionStandardId='" + nutritionStandardId + '\'' +
                ", userId='" + userId + '\'' +
                ", projectId='" + projectId + '\'' +
                ", materialLeftBoundList=" + materialLeftBoundList +
                ", materialRightBoundList=" + materialRightBoundList +
                ", nutritionStandardLeftBoundList=" + nutritionStandardLeftBoundList +
                ", nutritionStandardRightBoundList=" + nutritionStandardRightBoundList +
                '}';
    }

    public String getFormulationId() {
        return formulationId;
    }

    public void setFormulationId(String formulationId) {
        this.formulationId = formulationId;
    }

    public String getFormulationCode() {
        return formulationCode;
    }

    public void setFormulationCode(String formulationCode) {
        this.formulationCode = formulationCode;
    }

    public String getFormulationName() {
        return formulationName;
    }

    public void setFormulationName(String formulationName) {
        this.formulationName = formulationName;
    }

    public List<Double> getMaterialLeftBoundList() {
        return materialLeftBoundList;
    }

    public void setMaterialLeftBoundList(List<Double> materialLeftBoundList) {
        this.materialLeftBoundList = materialLeftBoundList;
    }

    public List<Double> getMaterialRightBoundList() {
        return materialRightBoundList;
    }

    public void setMaterialRightBoundList(List<Double> materialRightBoundList) {
        this.materialRightBoundList = materialRightBoundList;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public List<Integer> getMaterialIdList() {
        return materialIdList;
    }

    public void setMaterialIdList(List<Integer> materialIdList) {
        this.materialIdList = materialIdList;
    }

    public String getNutritionStandardId() {
        return nutritionStandardId;
    }

    public void setNutritionStandardId(String nutritionStandardId) {
        this.nutritionStandardId = nutritionStandardId;
    }

    public List<Double> getNutritionStandardRightBoundList() {
        return nutritionStandardRightBoundList;
    }

    public void setNutritionStandardRightBoundList(List<Double> nutritionStandardRightBoundList) {
        this.nutritionStandardRightBoundList = nutritionStandardRightBoundList;
    }

    public List<Double> getNutritionStandardLeftBoundList() {
        return nutritionStandardLeftBoundList;
    }

    public void setNutritionStandardLeftBoundList(List<Double> nutritionStandardLeftBoundList) {
        this.nutritionStandardLeftBoundList = nutritionStandardLeftBoundList;
    }
}
