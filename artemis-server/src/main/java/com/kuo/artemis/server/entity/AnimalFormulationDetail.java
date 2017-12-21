package com.kuo.artemis.server.entity;

import java.math.BigDecimal;
import java.util.Date;

public class AnimalFormulationDetail {
    private String animalId;

    private Integer userId;

    private Integer projectId;

    private BigDecimal animalInitWeight;

    private String house;

    private String code;

    private String idNumber;

    private String treatment;

    private String replicate;

    private Date startTime;

    private Date endTime;

    private Integer formulationId;

    private String formulationCode;

    private String formulationName;

    private BigDecimal formulationMaterialCost;

    public String getAnimalId() {
        return animalId;
    }

    public void setAnimalId(String animalId) {
        this.animalId = animalId == null ? null : animalId.trim();
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

    public BigDecimal getAnimalInitWeight() {
        return animalInitWeight;
    }

    public void setAnimalInitWeight(BigDecimal animalInitWeight) {
        this.animalInitWeight = animalInitWeight;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house == null ? null : house.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber == null ? null : idNumber.trim();
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment == null ? null : treatment.trim();
    }

    public String getReplicate() {
        return replicate;
    }

    public void setReplicate(String replicate) {
        this.replicate = replicate == null ? null : replicate.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getFormulationId() {
        return formulationId;
    }

    public void setFormulationId(Integer formulationId) {
        this.formulationId = formulationId;
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
}