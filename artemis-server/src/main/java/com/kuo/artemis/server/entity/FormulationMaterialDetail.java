package com.kuo.artemis.server.entity;

import java.math.BigDecimal;

public class FormulationMaterialDetail {
    private Integer formulationId;

    private Integer userId;

    private Integer projectId;

    private String formulationCode;

    private String formulationName;

    private BigDecimal formulationMaterialCost;

    private String formulationMaterialRelationId;

    private Integer materialId;

    private String materialName;

    private BigDecimal materialPrice;

    private BigDecimal optimalRatio;

    private BigDecimal ponderanceTon;

    public Integer getFormulationId() {
        return formulationId;
    }

    public void setFormulationId(Integer formulationId) {
        this.formulationId = formulationId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getFormulationCode() {
        return formulationCode;
    }

    public void setFormulationCode(String formulationCode) {
        this.formulationCode = formulationCode == null ? null : formulationCode.trim();
    }

    public String getFormulationName() {
        return formulationName;
    }

    public void setFormulationName(String formulationName) {
        this.formulationName = formulationName == null ? null : formulationName.trim();
    }

    public BigDecimal getFormulationMaterialCost() {
        return formulationMaterialCost;
    }

    public void setFormulationMaterialCost(BigDecimal formulationMaterialCost) {
        this.formulationMaterialCost = formulationMaterialCost;
    }

    public String getFormulationMaterialRelationId() {
        return formulationMaterialRelationId;
    }

    public void setFormulationMaterialRelationId(String formulationMaterialRelationId) {
        this.formulationMaterialRelationId = formulationMaterialRelationId == null ? null : formulationMaterialRelationId.trim();
    }

    public Integer getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName == null ? null : materialName.trim();
    }

    public BigDecimal getMaterialPrice() {
        return materialPrice;
    }

    public void setMaterialPrice(BigDecimal materialPrice) {
        this.materialPrice = materialPrice;
    }

    public BigDecimal getOptimalRatio() {
        return optimalRatio;
    }

    public void setOptimalRatio(BigDecimal optimalRatio) {
        this.optimalRatio = optimalRatio;
    }

    public BigDecimal getPonderanceTon() {
        return ponderanceTon;
    }

    public void setPonderanceTon(BigDecimal ponderanceTon) {
        this.ponderanceTon = ponderanceTon;
    }
}