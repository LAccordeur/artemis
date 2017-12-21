package com.kuo.artemis.server.core.dto.formulation;

import java.util.List;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public class FormulationParams {

    private String formulationCode;    //配方编号

    private String formulationName;    //配方名称

    private List<Integer> materialIdList;    //选取的配方id集合

    private String nutritionStandardId;    //营养标准id

    private String userId;    //生成该配方的用户id

    private String projectId;

    private List<Double> materialLeftBoundList;

    private List<Double> materialRightBoundList;

    private List<Double> nutritionStandardLeftBoundList;

    private List<Double> nutritionStandardRightBoundList;

    @Override
    public String toString() {
        return "FormulationParams{" +
                "materialIdList=" + materialIdList +
                ", nutritionStandardId='" + nutritionStandardId + '\'' +
                ", userId='" + userId + '\'' +
                ", projectId='" + projectId + '\'' +
                ", materialLeftBoundList=" + materialLeftBoundList +
                ", materialRightBoundList=" + materialRightBoundList +
                ", nutritionStandardRightBoundList=" + nutritionStandardRightBoundList +
                ", nutritionStandardLeftBoundList=" + nutritionStandardLeftBoundList +
                '}';
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
