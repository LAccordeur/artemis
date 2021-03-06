package com.kuo.artemis.server.entity;

import java.util.Date;

public class AnimalIndicator {
    private Integer id;

    private String indicatorName;

    private String indicatorNameEnglish;

    private Short indicatorType;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIndicatorName() {
        return indicatorName;
    }

    @Override
    public String toString() {
        return "AnimalIndicator{" +
                "id=" + id +
                ", indicatorName='" + indicatorName + '\'' +
                ", indicatorNameEnglish='" + indicatorNameEnglish + '\'' +
                ", indicatorType=" + indicatorType +
                ", createTime=" + createTime +
                '}';
    }

    public void setIndicatorName(String indicatorName) {
        this.indicatorName = indicatorName == null ? null : indicatorName.trim();
    }

    public String getIndicatorNameEnglish() {
        return indicatorNameEnglish;
    }

    public void setIndicatorNameEnglish(String indicatorNameEnglish) {
        this.indicatorNameEnglish = indicatorNameEnglish == null ? null : indicatorNameEnglish.trim();
    }

    public Short getIndicatorType() {
        return indicatorType;
    }

    public void setIndicatorType(Short indicatorType) {
        this.indicatorType = indicatorType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}