package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.math.BigDecimal;
import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class FormulationNutrition {
    private String id;

    private Integer formulationId;

    private String nutritionIndicatorName;

    private BigDecimal nutritionContentActual;

    private BigDecimal nutritionContentIdeal;

    private BigDecimal nutritionContentLowBound;

    private BigDecimal nutritionContentHighBound;

    private BigDecimal shadowPrice;

    private Date createTime;

    private Date modifiedTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getFormulationId() {
        return formulationId;
    }

    public void setFormulationId(Integer formulationId) {
        this.formulationId = formulationId;
    }

    public String getNutritionIndicatorName() {
        return nutritionIndicatorName;
    }

    public void setNutritionIndicatorName(String nutritionIndicatorName) {
        this.nutritionIndicatorName = nutritionIndicatorName == null ? null : nutritionIndicatorName.trim();
    }

    public BigDecimal getNutritionContentActual() {
        return nutritionContentActual;
    }

    public void setNutritionContentActual(BigDecimal nutritionContentActual) {
        this.nutritionContentActual = nutritionContentActual;
    }

    public BigDecimal getNutritionContentIdeal() {
        return nutritionContentIdeal;
    }

    public void setNutritionContentIdeal(BigDecimal nutritionContentIdeal) {
        this.nutritionContentIdeal = nutritionContentIdeal;
    }

    public BigDecimal getNutritionContentLowBound() {
        return nutritionContentLowBound;
    }

    public void setNutritionContentLowBound(BigDecimal nutritionContentLowBound) {
        this.nutritionContentLowBound = nutritionContentLowBound;
    }

    public BigDecimal getNutritionContentHighBound() {
        return nutritionContentHighBound;
    }

    public void setNutritionContentHighBound(BigDecimal nutritionContentHighBound) {
        this.nutritionContentHighBound = nutritionContentHighBound;
    }

    public BigDecimal getShadowPrice() {
        return shadowPrice;
    }

    public void setShadowPrice(BigDecimal shadowPrice) {
        this.shadowPrice = shadowPrice;
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