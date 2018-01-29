package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.math.BigDecimal;
import java.util.Date;

@JsonIgnoreProperties({"id","houseId","animalBirthday","sequence","projectId"})
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Animal {
    private String id;

    private Integer animalTypeId;

    private Integer userId;

    private Integer projectId;

    private Integer houseId;

    private Byte animalSex;

    private BigDecimal animalInitWeight;

    private BigDecimal initialBw;

    private String house;

    private String code;

    private String idNumber;

    private String treatment;

    private String replicate;

    private Date animalBirthday;

    private Double deviationFromMedian; //用于动物分组使用

    private Integer suitable = 0;   //用于动物分组,默认为0不合适

    private String oldPen;    //旧的圈舍号  用于动物分组

    private String newPen;    //新的圈舍好 用于动物分组

    private Double weightMean;    //用于动物分组 所在处理组的体重平均数

    private Double CoefficientOfVariation;    //用于动物分组  所在重复组的变异系数

    private Integer sequence;

    private Integer version;

    private String fileIdentifier;

    private Date createTime;

    private Date modifiedTime;

    @Override
    public String toString() {
        return "Animal{" +
                "id='" + id + '\'' +
                ", animalTypeId=" + animalTypeId +
                ", userId=" + userId +
                ", projectId=" + projectId +
                ", houseId=" + houseId +
                ", animalSex=" + animalSex +
                ", animalInitWeight=" + animalInitWeight +
                ", initialBw=" + initialBw +
                ", house='" + house + '\'' +
                ", code='" + code + '\'' +
                ", idNumber='" + idNumber + '\'' +
                ", treatment='" + treatment + '\'' +
                ", replicate='" + replicate + '\'' +
                ", animalBirthday=" + animalBirthday +
                ", deviationFromMedian=" + deviationFromMedian +
                ", suitable=" + suitable +
                ", oldPen='" + oldPen + '\'' +
                ", newPen='" + newPen + '\'' +
                ", weightMean=" + weightMean +
                ", CoefficientOfVariation=" + CoefficientOfVariation +
                ", sequence=" + sequence +
                ", version=" + version +
                ", fileIdentifier='" + fileIdentifier + '\'' +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                '}';
    }


    public BigDecimal getInitialBw() {
        return initialBw;
    }

    public void setInitialBw(BigDecimal initialBw) {
        this.initialBw = initialBw;
    }

    public void setSuitable(Integer suitable) {
        this.suitable = suitable;
    }

    public Integer getSuitable() {
        return suitable;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getFileIdentifier() {
        return fileIdentifier;
    }

    public void setFileIdentifier(String fileIdentifier) {
        this.fileIdentifier = fileIdentifier;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public Double getWeightMean() {
        return weightMean;
    }

    public void setWeightMean(Double weightMean) {
        this.weightMean = weightMean;
    }

    public Double getCoefficientOfVariation() {
        return CoefficientOfVariation;
    }

    public void setCoefficientOfVariation(Double coefficientOfVariation) {
        CoefficientOfVariation = coefficientOfVariation;
    }



    public String getOldPen() {
        return oldPen;
    }

    public void setOldPen(String oldPen) {
        this.oldPen = oldPen;
    }

    public String getNewPen() {
        return newPen;
    }

    public void setNewPen(String newPen) {
        this.newPen = newPen;
    }

    public Double getDeviationFromMedian() {
        return deviationFromMedian;
    }

    public void setDeviationFromMedian(Double deviationFromMedian) {
        this.deviationFromMedian = deviationFromMedian;
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

    public Byte getAnimalSex() {
        return animalSex;
    }

    public void setAnimalSex(Byte animalSex) {
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