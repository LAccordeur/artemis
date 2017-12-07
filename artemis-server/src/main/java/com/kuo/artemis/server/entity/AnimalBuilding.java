package com.kuo.artemis.server.entity;

import java.util.Date;

public class AnimalBuilding {
    private Integer id;

    private String buildingCode;

    private Integer houseNumber;

    private Short houseType;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBuildingCode() {
        return buildingCode;
    }

    public void setBuildingCode(String buildingCode) {
        this.buildingCode = buildingCode == null ? null : buildingCode.trim();
    }

    public Integer getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(Integer houseNumber) {
        this.houseNumber = houseNumber;
    }

    public Short getHouseType() {
        return houseType;
    }

    public void setHouseType(Short houseType) {
        this.houseType = houseType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}