package com.kuo.artemis.server.entity;

import java.math.BigDecimal;
import java.util.Date;

public class BuildingRecord {
    private Integer id;

    private Integer buildingId;

    private Integer projectId;

    private BigDecimal buildingTempetature;

    private BigDecimal buildingHumidity;

    private Date createTime;

    private Date modifiedTime;

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

    public BigDecimal getBuildingTempetature() {
        return buildingTempetature;
    }

    public void setBuildingTempetature(BigDecimal buildingTempetature) {
        this.buildingTempetature = buildingTempetature;
    }

    public BigDecimal getBuildingHumidity() {
        return buildingHumidity;
    }

    public void setBuildingHumidity(BigDecimal buildingHumidity) {
        this.buildingHumidity = buildingHumidity;
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