package com.kuo.artemis.server.entity;

import java.math.BigDecimal;
import java.util.Date;

public class NutritionStandard {
    private Integer id;

    private Integer userId;

    private String nutritionStandardCode;

    private String nutritionStandardName;

    private BigDecimal waterContentStandard;

    private BigDecimal waterContentActual;

    private BigDecimal dietaryElectrolyteBalance;

    private BigDecimal natrium;

    private BigDecimal kalium;

    private BigDecimal chlorine;

    private BigDecimal digestiveEnergyStandard;

    private BigDecimal digestiveEnergyActual;

    private BigDecimal netEnergy;

    private BigDecimal linolicAcid;

    private BigDecimal crudeProtein;

    private BigDecimal crudeFa;

    private BigDecimal crudeFiber;

    private BigDecimal crudeAsh;

    private BigDecimal nertralDetergentFiber;

    private BigDecimal acidDetergentFiber;

    private BigDecimal calcium;

    private BigDecimal totalPhosphor;

    private BigDecimal availablePhosphor;

    private BigDecimal lysine;

    private BigDecimal methionine;

    private BigDecimal tryptophan;

    private BigDecimal threonine;

    private BigDecimal valine;

    private BigDecimal arginine;

    private BigDecimal isoleucine;

    private BigDecimal leucine;

    private BigDecimal cystine;

    private BigDecimal methionineCystine;

    private BigDecimal digestibleLysine;

    private BigDecimal digestibleMethionine;

    private BigDecimal digestibleTryptophan;

    private BigDecimal digestibleThreonine;

    private BigDecimal digestibleValine;

    private BigDecimal digestibleArginine;

    private BigDecimal digestibleIsoleucine;

    private BigDecimal digestibleLeucine;

    private BigDecimal digestibleCystine;

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
        this.nutritionStandardCode = nutritionStandardCode == null ? null : nutritionStandardCode.trim();
    }

    public String getNutritionStandardName() {
        return nutritionStandardName;
    }

    public void setNutritionStandardName(String nutritionStandardName) {
        this.nutritionStandardName = nutritionStandardName == null ? null : nutritionStandardName.trim();
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

    public BigDecimal getCrudeFa() {
        return crudeFa;
    }

    public void setCrudeFa(BigDecimal crudeFa) {
        this.crudeFa = crudeFa;
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