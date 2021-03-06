package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;
@JsonIgnoreProperties({"id","buildingId","projectId"})
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AnimalHouse {
    private Integer id;

    private Integer buildingId;

    private Integer projectId;

    private String houseCode;

    private String treatment;

    private String replicate;

    private Integer sequence;

    private Date createTime;

    private Date modifiedTime;

    @Override
    public String toString() {
        return "AnimalHouse{" +
                "id=" + id +
                ", buildingId=" + buildingId +
                ", projectId=" + projectId +
                ", houseCode='" + houseCode + '\'' +
                ", treatment='" + treatment + '\'' +
                ", replicate='" + replicate + '\'' +
                ", sequence=" + sequence +
                ", createTime=" + createTime +
                ", modifiedTime=" + modifiedTime +
                '}';
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Integer buildingId) {
        this.buildingId = buildingId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getHouseCode() {
        return houseCode;
    }

    public void setHouseCode(String houseCode) {
        this.houseCode = houseCode == null ? null : houseCode.trim();
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