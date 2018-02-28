package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@JsonIgnoreProperties({"modifiedTime", "createTime", "id", "statisticsRecordId", "statisticsIndicatorId"})
public class StatisticsDetailRecord {
    private Integer id;

    private Integer statisticsRecordId;

    private Integer statisticsIndicatorId;

    private String statisticsIndicatorName;

    private BigDecimal pValue;

    private BigDecimal pValueFactorA;

    private BigDecimal pValueFactorB;

    private Date modifiedTime;

    private Date createTime;

    @Override
    public String toString() {
        return "StatisticsDetailRecord{" +
                "id=" + id +
                ", statisticsRecordId=" + statisticsRecordId +
                ", statisticsIndicatorId=" + statisticsIndicatorId +
                ", statisticsIndicatorName='" + statisticsIndicatorName + '\'' +
                ", pValue=" + pValue +
                ", pValueFactorA=" + pValueFactorA +
                ", pValueFactorB=" + pValueFactorB +
                ", modifiedTime=" + modifiedTime +
                ", createTime=" + createTime +
                ", statisticsDetailItemList=" + statisticsDetailItemList +
                '}';
    }

    private List<StatisticsDetailItem> statisticsDetailItemList;

    public List<StatisticsDetailItem> getStatisticsDetailItemList() {
        return statisticsDetailItemList;
    }

    public void setStatisticsDetailItemList(List<StatisticsDetailItem> statisticsDetailItemList) {
        this.statisticsDetailItemList = statisticsDetailItemList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStatisticsRecordId() {
        return statisticsRecordId;
    }

    public void setStatisticsRecordId(Integer statisticsRecordId) {
        this.statisticsRecordId = statisticsRecordId;
    }

    public Integer getStatisticsIndicatorId() {
        return statisticsIndicatorId;
    }

    public void setStatisticsIndicatorId(Integer statisticsIndicatorId) {
        this.statisticsIndicatorId = statisticsIndicatorId;
    }

    public String getStatisticsIndicatorName() {
        return statisticsIndicatorName;
    }

    public void setStatisticsIndicatorName(String statisticsIndicatorName) {
        this.statisticsIndicatorName = statisticsIndicatorName == null ? null : statisticsIndicatorName.trim();
    }

    public BigDecimal getpValue() {
        return pValue;
    }

    public void setpValue(BigDecimal pValue) {
        this.pValue = pValue;
    }

    public BigDecimal getpValueFactorA() {
        return pValueFactorA;
    }

    public void setpValueFactorA(BigDecimal pValueFactorA) {
        this.pValueFactorA = pValueFactorA;
    }

    public BigDecimal getpValueFactorB() {
        return pValueFactorB;
    }

    public void setpValueFactorB(BigDecimal pValueFactorB) {
        this.pValueFactorB = pValueFactorB;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}