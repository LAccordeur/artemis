package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 对应每个指标中的每个处理组的数据
 */
@JsonIgnoreProperties({"modifiedTime", "createTime", "id", "statisticsDetailRecordId"})
public class StatisticsDetailItem {
    private Integer id;

    private Integer statisticsDetailRecordId;

    private String itemCode;

    private BigDecimal itemMean;

    private BigDecimal itemStderr;

    private String factorA;

    private String factorB;

    private Date modifiedTime;

    private Date createTime;

    @Override
    public String toString() {
        return "StatisticsDetailItem{" +
                "id=" + id +
                ", statisticsDetailRecordId=" + statisticsDetailRecordId +
                ", itemCode='" + itemCode + '\'' +
                ", itemMean=" + itemMean +
                ", itemStderr=" + itemStderr +
                ", factorA='" + factorA + '\'' +
                ", factorB='" + factorB + '\'' +
                ", modifiedTime=" + modifiedTime +
                ", createTime=" + createTime +
                '}';
    }

    public String getFactorA() {
        return factorA;
    }

    public void setFactorA(String factorA) {
        this.factorA = factorA;
    }

    public String getFactorB() {
        return factorB;
    }

    public void setFactorB(String factorB) {
        this.factorB = factorB;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStatisticsDetailRecordId() {
        return statisticsDetailRecordId;
    }

    public void setStatisticsDetailRecordId(Integer statisticsDetailRecordId) {
        this.statisticsDetailRecordId = statisticsDetailRecordId;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode == null ? null : itemCode.trim();
    }

    public BigDecimal getItemMean() {
        return itemMean;
    }

    public void setItemMean(BigDecimal itemMean) {
        this.itemMean = itemMean;
    }

    public BigDecimal getItemStderr() {
        return itemStderr;
    }

    public void setItemStderr(BigDecimal itemStderr) {
        this.itemStderr = itemStderr;
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