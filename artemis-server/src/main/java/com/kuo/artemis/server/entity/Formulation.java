package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

//@JsonInclude(JsonInclude.Include.NON_NULL)
public class Formulation {
    private Integer id;

    @NotNull
    private Integer userId;

    @NotNull
    private Integer projectId;

    @NotNull
    private String formulationCode;

    @NotNull
    private String formulationName;

    private BigDecimal formulationMaterialCost;

    private Date createTime;

    private Date modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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