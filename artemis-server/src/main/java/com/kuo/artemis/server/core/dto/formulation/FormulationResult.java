package com.kuo.artemis.server.core.dto.formulation;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.kuo.artemis.server.entity.Formulation;
import com.kuo.artemis.server.entity.FormulationMaterial;
import com.kuo.artemis.server.entity.FormulationNutrition;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/21
 */
//@JsonInclude(JsonInclude.Include.NON_NULL)
public class FormulationResult {

    @NotNull
    private String userId;

    @NotNull
    private String projectId;

    private String formulationId;

    private String formulationCode;

    private String formulationName;

    @NotNull
    private Double formulationMaterialCost;   //配方价格

    private String programmingStatus;  //规划状态



    private Formulation formulation;

    @NotNull
    private List<FormulationMaterial> formulationMaterials;

    @NotNull
    private List<FormulationNutrition> formulationNutritions;

    @Override
    public String toString() {
        return "FormulationResult{" +
                "userId='" + userId + '\'' +
                ", projectId='" + projectId + '\'' +
                ", formulationId='" + formulationId + '\'' +
                ", formulationCode='" + formulationCode + '\'' +
                ", formulationName='" + formulationName + '\'' +
                ", formulationMaterialCost=" + formulationMaterialCost +
                ", programmingStatus='" + programmingStatus + '\'' +
                ", formulation=" + formulation +
                ", formulationMaterials=" + formulationMaterials +
                ", formulationNutritions=" + formulationNutritions +
                '}';
    }

    public String getFormulationId() {
        return formulationId;
    }

    public void setFormulationId(String formulationId) {
        this.formulationId = formulationId;
    }

    public List<FormulationNutrition> getFormulationNutritions() {
        return formulationNutritions;
    }

    public void setFormulationNutritions(List<FormulationNutrition> formulationNutritions) {
        this.formulationNutritions = formulationNutritions;
    }

    public String getProgrammingStatus() {
        return programmingStatus;
    }

    public void setProgrammingStatus(String programmingStatus) {
        this.programmingStatus = programmingStatus;
    }

    public Formulation getFormulation() {
        return formulation;
    }

    public void setFormulation(Formulation formulation) {
        this.formulation = formulation;
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

    public Double getFormulationMaterialCost() {
        return formulationMaterialCost;
    }

    public void setFormulationMaterialCost(Double formulationMaterialCost) {
        this.formulationMaterialCost = formulationMaterialCost;
    }

    public List<FormulationMaterial> getFormulationMaterials() {
        return formulationMaterials;
    }

    public void setFormulationMaterials(List<FormulationMaterial> formulationMaterials) {
        this.formulationMaterials = formulationMaterials;
    }
}
