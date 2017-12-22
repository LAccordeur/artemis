package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.kuo.artemis.server.core.common.NutritionIndicator;

import java.math.BigDecimal;
import java.util.Date;

@JsonInclude(value = JsonInclude.Include.NON_NULL)
public class NutritionStandard {
    private Integer id;

    private Integer userId;

    private String nutritionStandardCode;

    private String nutritionStandardName;

    @NutritionIndicator(name = "标准水份(%)")
    private BigDecimal waterContentStandard;

    @NutritionIndicator(name = "实际水份(%)")
    private BigDecimal waterContentActual;

    @NutritionIndicator(name = "电解质平衡值")
    private BigDecimal dietaryElectrolyteBalance;

    @NutritionIndicator(name = "钠Na(%)")
    private BigDecimal natrium;

    @NutritionIndicator(name = "钾K(%)")
    private BigDecimal kalium;

    @NutritionIndicator(name = "氯Cl(%)")
    private BigDecimal chlorine;

    @NutritionIndicator(name = "标准消化能DE kcal/kg")
    private BigDecimal digestiveEnergyStandard;

    @NutritionIndicator(name = "实际消化能DE kcal/kg")
    private BigDecimal digestiveEnergyActual;

    @NutritionIndicator(name = "净能NE kcal/kg")
    private BigDecimal netEnergy;

    @NutritionIndicator(name = "亚油酸(%)")
    private BigDecimal linolicAcid;

    @NutritionIndicator(name = "粗蛋白质CP(%)")
    private BigDecimal crudeProtein;

    @NutritionIndicator(name = "粗脂肪EE(%)")
    private BigDecimal crudeFat;

    @NutritionIndicator(name = "粗纤维CF(%)")
    private BigDecimal crudeFiber;

    @NutritionIndicator(name = "粗灰分Ash(%)")
    private BigDecimal crudeAsh;

    @NutritionIndicator(name = "中性洗涤纤维NDF(%)")
    private BigDecimal nertralDetergentFiber;

    @NutritionIndicator(name = "酸性洗涤纤维ADF(%)")
    private BigDecimal acidDetergentFiber;

    @NutritionIndicator(name = "钙Ca(%)")
    private BigDecimal calcium;

    @NutritionIndicator(name = "总磷P(%)")
    private BigDecimal totalPhosphor;

    @NutritionIndicator(name = "有效磷A-P(%)")
    private BigDecimal availablePhosphor;

    @NutritionIndicator(name = "赖氨酸Lys(%)")
    private BigDecimal lysine;

    @NutritionIndicator(name = "蛋氨酸Met(%)")
    private BigDecimal methionine;

    @NutritionIndicator(name = "色氨酸Trp(%)")
    private BigDecimal tryptophan;

    @NutritionIndicator(name = "苏氨酸Thr(%)")
    private BigDecimal threonine;

    @NutritionIndicator(name = "缬氨酸Val(%)")
    private BigDecimal valine;

    @NutritionIndicator(name = "精氨酸Arg(%)")
    private BigDecimal arginine;

    @NutritionIndicator(name = "异亮氨酸Ile(%)")
    private BigDecimal isoleucine;

    @NutritionIndicator(name = "亮氨酸Leu(%)")
    private BigDecimal leucine;

    @NutritionIndicator(name = "胱氨酸Cys(%)")
    private BigDecimal cystine;

    @NutritionIndicator(name = "蛋+胱 (%)")
    private BigDecimal methionineCystine;

    @NutritionIndicator(name = "可消化赖氨酸Lys(%)")
    private BigDecimal digestibleLysine;

    @NutritionIndicator(name = "可消化蛋氨酸Met(%)")
    private BigDecimal digestibleMethionine;

    @NutritionIndicator(name = "可消化色氨酸Trp(%)")
    private BigDecimal digestibleTryptophan;

    @NutritionIndicator(name = "可消化苏氨酸Thr(%)")
    private BigDecimal digestibleThreonine;

    @NutritionIndicator(name = "可消化缬氨酸Val(%)")
    private BigDecimal digestibleValine;

    @NutritionIndicator(name = "可消化精氨酸Arg(%)")
    private BigDecimal digestibleArginine;

    @NutritionIndicator(name = "可消化异亮氨酸Ile(%)")
    private BigDecimal digestibleIsoleucine;

    @NutritionIndicator(name = "可消化亮氨酸Leu(%)")
    private BigDecimal digestibleLeucine;

    @NutritionIndicator(name = "可消化胱氨酸Cys(%)")
    private BigDecimal digestibleCystine;

    @NutritionIndicator(name = "可消化蛋+胱氨酸(%)")
    private BigDecimal digestibleMethionineCystine;

    private Date createTime;

    private Date modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getNutritionStandardCode() {
        return nutritionStandardCode;
    }

    public void setNutritionStandardCode(String nutritionStandardCode) {
        this.nutritionStandardCode = nutritionStandardCode;
    }

    public String getNutritionStandardName() {
        return nutritionStandardName;
    }

    public void setNutritionStandardName(String nutritionStandardName) {
        this.nutritionStandardName = nutritionStandardName;
    }

    public BigDecimal getWaterContentStandard() {
        return waterContentStandard;
    }

    public void setWaterContentStandard(BigDecimal waterContentStandard) {
        this.waterContentStandard = waterContentStandard;
    }

    public BigDecimal getWaterContentActual() {
        return waterContentActual;
    }

    public void setWaterContentActual(BigDecimal waterContentActual) {
        this.waterContentActual = waterContentActual;
    }

    public BigDecimal getDietaryElectrolyteBalance() {
        return dietaryElectrolyteBalance;
    }

    public void setDietaryElectrolyteBalance(BigDecimal dietaryElectrolyteBalance) {
        this.dietaryElectrolyteBalance = dietaryElectrolyteBalance;
    }

    public BigDecimal getNatrium() {
        return natrium;
    }

    public void setNatrium(BigDecimal natrium) {
        this.natrium = natrium;
    }

    public BigDecimal getKalium() {
        return kalium;
    }

    public void setKalium(BigDecimal kalium) {
        this.kalium = kalium;
    }

    public BigDecimal getChlorine() {
        return chlorine;
    }

    public void setChlorine(BigDecimal chlorine) {
        this.chlorine = chlorine;
    }

    public BigDecimal getDigestiveEnergyStandard() {
        return digestiveEnergyStandard;
    }

    public void setDigestiveEnergyStandard(BigDecimal digestiveEnergyStandard) {
        this.digestiveEnergyStandard = digestiveEnergyStandard;
    }

    public BigDecimal getDigestiveEnergyActual() {
        return digestiveEnergyActual;
    }

    public void setDigestiveEnergyActual(BigDecimal digestiveEnergyActual) {
        this.digestiveEnergyActual = digestiveEnergyActual;
    }

    public BigDecimal getNetEnergy() {
        return netEnergy;
    }

    public void setNetEnergy(BigDecimal netEnergy) {
        this.netEnergy = netEnergy;
    }

    public BigDecimal getLinolicAcid() {
        return linolicAcid;
    }

    public void setLinolicAcid(BigDecimal linolicAcid) {
        this.linolicAcid = linolicAcid;
    }

    public BigDecimal getCrudeProtein() {
        return crudeProtein;
    }

    public void setCrudeProtein(BigDecimal crudeProtein) {
        this.crudeProtein = crudeProtein;
    }

    public BigDecimal getCrudeFat() {
        return crudeFat;
    }

    public void setCrudeFat(BigDecimal crudeFat) {
        this.crudeFat = crudeFat;
    }

    public BigDecimal getCrudeFiber() {
        return crudeFiber;
    }

    public void setCrudeFiber(BigDecimal crudeFiber) {
        this.crudeFiber = crudeFiber;
    }

    public BigDecimal getCrudeAsh() {
        return crudeAsh;
    }

    public void setCrudeAsh(BigDecimal crudeAsh) {
        this.crudeAsh = crudeAsh;
    }

    public BigDecimal getNertralDetergentFiber() {
        return nertralDetergentFiber;
    }

    public void setNertralDetergentFiber(BigDecimal nertralDetergentFiber) {
        this.nertralDetergentFiber = nertralDetergentFiber;
    }

    public BigDecimal getAcidDetergentFiber() {
        return acidDetergentFiber;
    }

    public void setAcidDetergentFiber(BigDecimal acidDetergentFiber) {
        this.acidDetergentFiber = acidDetergentFiber;
    }

    public BigDecimal getCalcium() {
        return calcium;
    }

    public void setCalcium(BigDecimal calcium) {
        this.calcium = calcium;
    }

    public BigDecimal getTotalPhosphor() {
        return totalPhosphor;
    }

    public void setTotalPhosphor(BigDecimal totalPhosphor) {
        this.totalPhosphor = totalPhosphor;
    }

    public BigDecimal getAvailablePhosphor() {
        return availablePhosphor;
    }

    public void setAvailablePhosphor(BigDecimal availablePhosphor) {
        this.availablePhosphor = availablePhosphor;
    }

    public BigDecimal getLysine() {
        return lysine;
    }

    public void setLysine(BigDecimal lysine) {
        this.lysine = lysine;
    }

    public BigDecimal getMethionine() {
        return methionine;
    }

    public void setMethionine(BigDecimal methionine) {
        this.methionine = methionine;
    }

    public BigDecimal getTryptophan() {
        return tryptophan;
    }

    public void setTryptophan(BigDecimal tryptophan) {
        this.tryptophan = tryptophan;
    }

    public BigDecimal getThreonine() {
        return threonine;
    }

    public void setThreonine(BigDecimal threonine) {
        this.threonine = threonine;
    }

    public BigDecimal getValine() {
        return valine;
    }

    public void setValine(BigDecimal valine) {
        this.valine = valine;
    }

    public BigDecimal getArginine() {
        return arginine;
    }

    public void setArginine(BigDecimal arginine) {
        this.arginine = arginine;
    }

    public BigDecimal getIsoleucine() {
        return isoleucine;
    }

    public void setIsoleucine(BigDecimal isoleucine) {
        this.isoleucine = isoleucine;
    }

    public BigDecimal getLeucine() {
        return leucine;
    }

    public void setLeucine(BigDecimal leucine) {
        this.leucine = leucine;
    }

    public BigDecimal getCystine() {
        return cystine;
    }

    public void setCystine(BigDecimal cystine) {
        this.cystine = cystine;
    }

    public BigDecimal getMethionineCystine() {
        return methionineCystine;
    }

    public void setMethionineCystine(BigDecimal methionineCystine) {
        this.methionineCystine = methionineCystine;
    }

    public BigDecimal getDigestibleLysine() {
        return digestibleLysine;
    }

    public void setDigestibleLysine(BigDecimal digestibleLysine) {
        this.digestibleLysine = digestibleLysine;
    }

    public BigDecimal getDigestibleMethionine() {
        return digestibleMethionine;
    }

    public void setDigestibleMethionine(BigDecimal digestibleMethionine) {
        this.digestibleMethionine = digestibleMethionine;
    }

    public BigDecimal getDigestibleTryptophan() {
        return digestibleTryptophan;
    }

    public void setDigestibleTryptophan(BigDecimal digestibleTryptophan) {
        this.digestibleTryptophan = digestibleTryptophan;
    }

    public BigDecimal getDigestibleThreonine() {
        return digestibleThreonine;
    }

    public void setDigestibleThreonine(BigDecimal digestibleThreonine) {
        this.digestibleThreonine = digestibleThreonine;
    }

    public BigDecimal getDigestibleValine() {
        return digestibleValine;
    }

    public void setDigestibleValine(BigDecimal digestibleValine) {
        this.digestibleValine = digestibleValine;
    }

    public BigDecimal getDigestibleArginine() {
        return digestibleArginine;
    }

    public void setDigestibleArginine(BigDecimal digestibleArginine) {
        this.digestibleArginine = digestibleArginine;
    }

    public BigDecimal getDigestibleIsoleucine() {
        return digestibleIsoleucine;
    }

    public void setDigestibleIsoleucine(BigDecimal digestibleIsoleucine) {
        this.digestibleIsoleucine = digestibleIsoleucine;
    }

    public BigDecimal getDigestibleLeucine() {
        return digestibleLeucine;
    }

    public void setDigestibleLeucine(BigDecimal digestibleLeucine) {
        this.digestibleLeucine = digestibleLeucine;
    }

    public BigDecimal getDigestibleCystine() {
        return digestibleCystine;
    }

    public void setDigestibleCystine(BigDecimal digestibleCystine) {
        this.digestibleCystine = digestibleCystine;
    }

    public BigDecimal getDigestibleMethionineCystine() {
        return digestibleMethionineCystine;
    }

    public void setDigestibleMethionineCystine(BigDecimal digestibleMethionineCystine) {
        this.digestibleMethionineCystine = digestibleMethionineCystine;
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