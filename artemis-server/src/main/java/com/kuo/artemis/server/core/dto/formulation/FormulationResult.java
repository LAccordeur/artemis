package com.kuo.artemis.server.core.dto.formulation;

import com.kuo.artemis.server.entity.Formulation;
import com.kuo.artemis.server.entity.FormulationMaterial;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/21
 */
public class FormulationResult {

    private String userId;

    private String projectId;

    private String formulationCode;

    private String formulationName;

    private Double formulationMaterialCost;

    private Formulation formulation;

    private List<FormulationMaterial> formulationMaterials;

    @Override
    public String toString() {
        return "FormulationResult{" +
                "userId='" + userId + '\'' +
                ", projectId='" + projectId + '\'' +
                ", formulationCode='" + formulationCode + '\'' +
                ", formulationName='" + formulationName + '\'' +
                ", formulationMaterialCost='" + formulationMaterialCost + '\'' +
                ", formulationMaterials=" + formulationMaterials +
                '}';
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
