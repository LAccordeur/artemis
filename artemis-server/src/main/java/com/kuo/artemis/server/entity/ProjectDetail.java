package com.kuo.artemis.server.entity;

import java.util.Date;

public class ProjectDetail {
    private Integer id;

    private Integer projectId;

    private Integer treatmentNum;

    private Integer replicationNum;

    private Short houseStyle;

    private Short groupMethod;

    private Short genderMethod;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getTreatmentNum() {
        return treatmentNum;
    }

    public void setTreatmentNum(Integer treatmentNum) {
        this.treatmentNum = treatmentNum;
    }

    public Integer getReplicationNum() {
        return replicationNum;
    }

    public void setReplicationNum(Integer replicationNum) {
        this.replicationNum = replicationNum;
    }

    public Short getHouseStyle() {
        return houseStyle;
    }

    public void setHouseStyle(Short houseStyle) {
        this.houseStyle = houseStyle;
    }

    public Short getGroupMethod() {
        return groupMethod;
    }

    public void setGroupMethod(Short groupMethod) {
        this.groupMethod = groupMethod;
    }

    public Short getGenderMethod() {
        return genderMethod;
    }

    public void setGenderMethod(Short genderMethod) {
        this.genderMethod = genderMethod;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}