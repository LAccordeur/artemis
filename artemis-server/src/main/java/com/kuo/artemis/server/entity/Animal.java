package com.kuo.artemis.server.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Animal {
    private String id;

    private Integer animalTypeId;

    private Integer userId;

    private Integer projectId;

    private Short animalSex;

    private BigDecimal animalInitWeight;

    private String house;

    private String code;

    private String idNumber;

    private String treatment;

    private String replicate;

    private Date animalBirthday;

    private Date createTime;

    private Date modifiedTime;

    @Override
    public String toString() {
        return "Animal{" +
                "id='" + id + '\'' +
                ", animalInitWeight=" + animalInitWeight +
                ", treatment='" + treatment + '\'' +
                ", replicate='" + replicate + '\'' +
                ", animalBirthday=" + animalBirthday +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getAnimalTypeId() {
        return animalTypeId;
    }

    public void setAnimalTypeId(Integer animalTypeId) {
        this.animalTypeId = animalTypeId;
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

    public Short getAnimalSex() {
        return animalSex;
    }

    public void setAnimalSex(Short animalSex) {
        this.animalSex = animalSex;
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

    public Date getAnimalBirthday() {
        return animalBirthday;
    }

    public void setAnimalBirthday(Date animalBirthday) {
        this.animalBirthday = animalBirthday;
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