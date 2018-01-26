package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.math.BigDecimal;
import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class FormulationMaterial {
    private Integer id;

    private Integer formulationId;

    private Integer materialId;

    private String materialName;

    private BigDecimal materialPrice;

    private BigDecimal optimalRatio;

    private BigDecimal materialRatioLowBound;

    private BigDecimal materialRatioHighBound;

    private BigDecimal ponderanceTon;

    private Date createTime;

    private Date modifiedTime;

    public BigDecimal getMaterialRatioLowBound() {
        return materialRatioLowBound;
    }

    public void setMaterialRatioLowBound(BigDecimal materialRatioLowBound) {
        this.materialRatioLowBound = materialRatioLowBound;
    }

    public BigDecimal getMaterialRatioHighBound() {
        return materialRatioHighBound;
    }

    public void setMaterialRatioHighBound(BigDecimal materialRatioHighBound) {
        this.materialRatioHighBound = materialRatioHighBound;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFormulationId() {
        return formulationId;
    }

    public void setFormulationId(Integer formulationId) {
        this.formulationId = formulationId;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }
}