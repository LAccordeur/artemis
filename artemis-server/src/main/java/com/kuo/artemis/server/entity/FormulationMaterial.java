package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.math.BigDecimal;
import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class FormulationMaterial {
    private String id;

    private Integer formulationId;

    private Integer materialId;

    private String materialName;

    private BigDecimal materialPrice;

    private BigDecimal optimalRatio;

    private BigDecimal ponderanceTon;

    private Date createTime;

    private Date modifiedTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
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