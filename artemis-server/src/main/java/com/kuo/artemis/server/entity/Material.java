package com.kuo.artemis.server.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Material {
    private Integer id;

    private Integer userId;

    private String materialName;

    private BigDecimal materialPrice;

    private BigDecimal waterContentStandard;

    private BigDecimal waterContentActual;

    private BigDecimal dietaryElectrolyteBalance;

    private BigDecimal dietaryElectrolyteBalanceActual;

    private BigDecimal natrium;

    private BigDecimal natriumActual;

    private BigDecimal kalium;

    private BigDecimal kaliumActual;

    private BigDecimal chlorine;

    private BigDecimal chlorineActual;

    private BigDecimal digestiveEnergyStandard;

    private BigDecimal digestiveEnergyActual;

    private BigDecimal netEnergy;

    private BigDecimal netEnergyActual;

    private BigDecimal linolicAcid;

    private BigDecimal linolicAcidActual;

    private BigDecimal crudeProtein;

    private BigDecimal crudeProteinActual;

    private BigDecimal crudeFat;

    private BigDecimal crudeFatActual;

    private BigDecimal crudeFiber;

    private BigDecimal crudeFiberActual;

    private BigDecimal crudeAsh;

    private BigDecimal crudeAshActual;

    private BigDecimal nertralDetergentFiber;

    private BigDecimal neutralDetergentFiberActual;

    private BigDecimal acidDetergentFiber;

    private BigDecimal acidDetergentFiberActual;

    private BigDecimal calcium;

    private BigDecimal calciumActual;

    private BigDecimal totalPhosphor;

    private BigDecimal totalPhosphorActual;

    private BigDecimal availablePhosphor;

    private BigDecimal availablePhosphorActual;

    private BigDecimal lysine;

    private BigDecimal lysineActual;

    private BigDecimal methionine;

    private BigDecimal methionineActual;

    private BigDecimal tryptophan;

    private BigDecimal tryptophanActual;

    private BigDecimal threonine;

    private BigDecimal threonineActual;

    private BigDecimal valine;

    private BigDecimal valineActual;

    private BigDecimal arginine;

    private BigDecimal arginineActual;

    private BigDecimal isoleucine;

    private BigDecimal isoleucineActual;

    private BigDecimal leucine;

    private BigDecimal leucineActual;

    private BigDecimal cystine;

    private BigDecimal cystineActual;

    private BigDecimal methionineCystine;

    private BigDecimal methionineCystineActual;

    private BigDecimal digestibleLysine;

    private BigDecimal digestibleLysineActual;

    private BigDecimal digestibleMethionine;

    private BigDecimal digestibleMethionineActual;

    private BigDecimal digestibleTryptophan;

    private BigDecimal digestibleTryptophanActual;

    private BigDecimal digestibleThreonine;

    private BigDecimal digestibleThreonineActual;

    private BigDecimal digestibleValine;

    private BigDecimal digestibleValineActual;

    private BigDecimal digestibleArginine;

    private BigDecimal digestibleArginineActual;

    private BigDecimal digestibleIsoleucine;

    private BigDecimal digestibleIsoleucineActual;

    private BigDecimal digestibleLeucine;

    private BigDecimal digestibleLeucineActual;

    private BigDecimal digestibleCystine;

    private BigDecimal digestibleCystineActual;

    private BigDecimal digestibleMethionineCystine;

    private BigDecimal digestibleMethionineCystineActual;

    private BigDecimal lysineDigestibility;

    private BigDecimal methionineDigestibility;

    private BigDecimal tryptophanDigestibility;

    private BigDecimal threonineDigestibility;

    private BigDecimal valineDigestibility;

    private BigDecimal arginineDigestibility;

    private BigDecimal isoleucineDigestibility;

    private BigDecimal leucineDigestibility;

    private BigDecimal cystineDigestibility;

    private BigDecimal methionineCystineDigestibility;

    private BigDecimal waterContentCoefficient;

    private BigDecimal crudeProteinCoefficient;

    private BigDecimal crudeFatCoefficient;

    private BigDecimal crudeFiberCoefficient;

    private BigDecimal crudeAshCoefficient;

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

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName == null ? null : materialName.trim();
    }

    public BigDecimal getMaterialPrice() {
        return materialPrice;
    }

    public void setMaterialPrice(BigDecimal materialPrice) {
        this.materialPrice = materialPrice;
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

    public BigDecimal getDietaryElectrolyteBalanceActual() {
        return dietaryElectrolyteBalanceActual;
    }

    public void setDietaryElectrolyteBalanceActual(BigDecimal dietaryElectrolyteBalanceActual) {
        this.dietaryElectrolyteBalanceActual = dietaryElectrolyteBalanceActual;
    }

    public BigDecimal getNatrium() {
        return natrium;
    }

    public void setNatrium(BigDecimal natrium) {
        this.natrium = natrium;
    }

    public BigDecimal getNatriumActual() {
        return natriumActual;
    }

    public void setNatriumActual(BigDecimal natriumActual) {
        this.natriumActual = natriumActual;
    }

    public BigDecimal getKalium() {
        return kalium;
    }

    public void setKalium(BigDecimal kalium) {
        this.kalium = kalium;
    }

    public BigDecimal getKaliumActual() {
        return kaliumActual;
    }

    public void setKaliumActual(BigDecimal kaliumActual) {
        this.kaliumActual = kaliumActual;
    }

    public BigDecimal getChlorine() {
        return chlorine;
    }

    public void setChlorine(BigDecimal chlorine) {
        this.chlorine = chlorine;
    }

    public BigDecimal getChlorineActual() {
        return chlorineActual;
    }

    public void setChlorineActual(BigDecimal chlorineActual) {
        this.chlorineActual = chlorineActual;
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

    public BigDecimal getNetEnergyActual() {
        return netEnergyActual;
    }

    public void setNetEnergyActual(BigDecimal netEnergyActual) {
        this.netEnergyActual = netEnergyActual;
    }

    public BigDecimal getLinolicAcid() {
        return linolicAcid;
    }

    public void setLinolicAcid(BigDecimal linolicAcid) {
        this.linolicAcid = linolicAcid;
    }

    public BigDecimal getLinolicAcidActual() {
        return linolicAcidActual;
    }

    public void setLinolicAcidActual(BigDecimal linolicAcidActual) {
        this.linolicAcidActual = linolicAcidActual;
    }

    public BigDecimal getCrudeProtein() {
        return crudeProtein;
    }

    public void setCrudeProtein(BigDecimal crudeProtein) {
        this.crudeProtein = crudeProtein;
    }

    public BigDecimal getCrudeProteinActual() {
        return crudeProteinActual;
    }

    public void setCrudeProteinActual(BigDecimal crudeProteinActual) {
        this.crudeProteinActual = crudeProteinActual;
    }

    public BigDecimal getCrudeFat() {
        return crudeFat;
    }

    public void setCrudeFat(BigDecimal crudeFat) {
        this.crudeFat = crudeFat;
    }

    public BigDecimal getCrudeFatActual() {
        return crudeFatActual;
    }

    public void setCrudeFatActual(BigDecimal crudeFatActual) {
        this.crudeFatActual = crudeFatActual;
    }

    public BigDecimal getCrudeFiber() {
        return crudeFiber;
    }

    public void setCrudeFiber(BigDecimal crudeFiber) {
        this.crudeFiber = crudeFiber;
    }

    public BigDecimal getCrudeFiberActual() {
        return crudeFiberActual;
    }

    public void setCrudeFiberActual(BigDecimal crudeFiberActual) {
        this.crudeFiberActual = crudeFiberActual;
    }

    public BigDecimal getCrudeAsh() {
        return crudeAsh;
    }

    public void setCrudeAsh(BigDecimal crudeAsh) {
        this.crudeAsh = crudeAsh;
    }

    public BigDecimal getCrudeAshActual() {
        return crudeAshActual;
    }

    public void setCrudeAshActual(BigDecimal crudeAshActual) {
        this.crudeAshActual = crudeAshActual;
    }

    public BigDecimal getNertralDetergentFiber() {
        return nertralDetergentFiber;
    }

    public void setNertralDetergentFiber(BigDecimal nertralDetergentFiber) {
        this.nertralDetergentFiber = nertralDetergentFiber;
    }

    public BigDecimal getNeutralDetergentFiberActual() {
        return neutralDetergentFiberActual;
    }

    public void setNeutralDetergentFiberActual(BigDecimal neutralDetergentFiberActual) {
        this.neutralDetergentFiberActual = neutralDetergentFiberActual;
    }

    public BigDecimal getAcidDetergentFiber() {
        return acidDetergentFiber;
    }

    public void setAcidDetergentFiber(BigDecimal acidDetergentFiber) {
        this.acidDetergentFiber = acidDetergentFiber;
    }

    public BigDecimal getAcidDetergentFiberActual() {
        return acidDetergentFiberActual;
    }

    public void setAcidDetergentFiberActual(BigDecimal acidDetergentFiberActual) {
        this.acidDetergentFiberActual = acidDetergentFiberActual;
    }

    public BigDecimal getCalcium() {
        return calcium;
    }

    public void setCalcium(BigDecimal calcium) {
        this.calcium = calcium;
    }

    public BigDecimal getCalciumActual() {
        return calciumActual;
    }

    public void setCalciumActual(BigDecimal calciumActual) {
        this.calciumActual = calciumActual;
    }

    public BigDecimal getTotalPhosphor() {
        return totalPhosphor;
    }

    public void setTotalPhosphor(BigDecimal totalPhosphor) {
        this.totalPhosphor = totalPhosphor;
    }

    public BigDecimal getTotalPhosphorActual() {
        return totalPhosphorActual;
    }

    public void setTotalPhosphorActual(BigDecimal totalPhosphorActual) {
        this.totalPhosphorActual = totalPhosphorActual;
    }

    public BigDecimal getAvailablePhosphor() {
        return availablePhosphor;
    }

    public void setAvailablePhosphor(BigDecimal availablePhosphor) {
        this.availablePhosphor = availablePhosphor;
    }

    public BigDecimal getAvailablePhosphorActual() {
        return availablePhosphorActual;
    }

    public void setAvailablePhosphorActual(BigDecimal availablePhosphorActual) {
        this.availablePhosphorActual = availablePhosphorActual;
    }

    public BigDecimal getLysine() {
        return lysine;
    }

    public void setLysine(BigDecimal lysine) {
        this.lysine = lysine;
    }

    public BigDecimal getLysineActual() {
        return lysineActual;
    }

    public void setLysineActual(BigDecimal lysineActual) {
        this.lysineActual = lysineActual;
    }

    public BigDecimal getMethionine() {
        return methionine;
    }

    public void setMethionine(BigDecimal methionine) {
        this.methionine = methionine;
    }

    public BigDecimal getMethionineActual() {
        return methionineActual;
    }

    public void setMethionineActual(BigDecimal methionineActual) {
        this.methionineActual = methionineActual;
    }

    public BigDecimal getTryptophan() {
        return tryptophan;
    }

    public void setTryptophan(BigDecimal tryptophan) {
        this.tryptophan = tryptophan;
    }

    public BigDecimal getTryptophanActual() {
        return tryptophanActual;
    }

    public void setTryptophanActual(BigDecimal tryptophanActual) {
        this.tryptophanActual = tryptophanActual;
    }

    public BigDecimal getThreonine() {
        return threonine;
    }

    public void setThreonine(BigDecimal threonine) {
        this.threonine = threonine;
    }

    public BigDecimal getThreonineActual() {
        return threonineActual;
    }

    public void setThreonineActual(BigDecimal threonineActual) {
        this.threonineActual = threonineActual;
    }

    public BigDecimal getValine() {
        return valine;
    }

    public void setValine(BigDecimal valine) {
        this.valine = valine;
    }

    public BigDecimal getValineActual() {
        return valineActual;
    }

    public void setValineActual(BigDecimal valineActual) {
        this.valineActual = valineActual;
    }

    public BigDecimal getArginine() {
        return arginine;
    }

    public void setArginine(BigDecimal arginine) {
        this.arginine = arginine;
    }

    public BigDecimal getArginineActual() {
        return arginineActual;
    }

    public void setArginineActual(BigDecimal arginineActual) {
        this.arginineActual = arginineActual;
    }

    public BigDecimal getIsoleucine() {
        return isoleucine;
    }

    public void setIsoleucine(BigDecimal isoleucine) {
        this.isoleucine = isoleucine;
    }

    public BigDecimal getIsoleucineActual() {
        return isoleucineActual;
    }

    public void setIsoleucineActual(BigDecimal isoleucineActual) {
        this.isoleucineActual = isoleucineActual;
    }

    public BigDecimal getLeucine() {
        return leucine;
    }

    public void setLeucine(BigDecimal leucine) {
        this.leucine = leucine;
    }

    public BigDecimal getLeucineActual() {
        return leucineActual;
    }

    public void setLeucineActual(BigDecimal leucineActual) {
        this.leucineActual = leucineActual;
    }

    public BigDecimal getCystine() {
        return cystine;
    }

    public void setCystine(BigDecimal cystine) {
        this.cystine = cystine;
    }

    public BigDecimal getCystineActual() {
        return cystineActual;
    }

    public void setCystineActual(BigDecimal cystineActual) {
        this.cystineActual = cystineActual;
    }

    public BigDecimal getMethionineCystine() {
        return methionineCystine;
    }

    public void setMethionineCystine(BigDecimal methionineCystine) {
        this.methionineCystine = methionineCystine;
    }

    public BigDecimal getMethionineCystineActual() {
        return methionineCystineActual;
    }

    public void setMethionineCystineActual(BigDecimal methionineCystineActual) {
        this.methionineCystineActual = methionineCystineActual;
    }

    public BigDecimal getDigestibleLysine() {
        return digestibleLysine;
    }

    public void setDigestibleLysine(BigDecimal digestibleLysine) {
        this.digestibleLysine = digestibleLysine;
    }

    public BigDecimal getDigestibleLysineActual() {
        return digestibleLysineActual;
    }

    public void setDigestibleLysineActual(BigDecimal digestibleLysineActual) {
        this.digestibleLysineActual = digestibleLysineActual;
    }

    public BigDecimal getDigestibleMethionine() {
        return digestibleMethionine;
    }

    public void setDigestibleMethionine(BigDecimal digestibleMethionine) {
        this.digestibleMethionine = digestibleMethionine;
    }

    public BigDecimal getDigestibleMethionineActual() {
        return digestibleMethionineActual;
    }

    public void setDigestibleMethionineActual(BigDecimal digestibleMethionineActual) {
        this.digestibleMethionineActual = digestibleMethionineActual;
    }

    public BigDecimal getDigestibleTryptophan() {
        return digestibleTryptophan;
    }

    public void setDigestibleTryptophan(BigDecimal digestibleTryptophan) {
        this.digestibleTryptophan = digestibleTryptophan;
    }

    public BigDecimal getDigestibleTryptophanActual() {
        return digestibleTryptophanActual;
    }

    public void setDigestibleTryptophanActual(BigDecimal digestibleTryptophanActual) {
        this.digestibleTryptophanActual = digestibleTryptophanActual;
    }

    public BigDecimal getDigestibleThreonine() {
        return digestibleThreonine;
    }

    public void setDigestibleThreonine(BigDecimal digestibleThreonine) {
        this.digestibleThreonine = digestibleThreonine;
    }

    public BigDecimal getDigestibleThreonineActual() {
        return digestibleThreonineActual;
    }

    public void setDigestibleThreonineActual(BigDecimal digestibleThreonineActual) {
        this.digestibleThreonineActual = digestibleThreonineActual;
    }

    public BigDecimal getDigestibleValine() {
        return digestibleValine;
    }

    public void setDigestibleValine(BigDecimal digestibleValine) {
        this.digestibleValine = digestibleValine;
    }

    public BigDecimal getDigestibleValineActual() {
        return digestibleValineActual;
    }

    public void setDigestibleValineActual(BigDecimal digestibleValineActual) {
        this.digestibleValineActual = digestibleValineActual;
    }

    public BigDecimal getDigestibleArginine() {
        return digestibleArginine;
    }

    public void setDigestibleArginine(BigDecimal digestibleArginine) {
        this.digestibleArginine = digestibleArginine;
    }

    public BigDecimal getDigestibleArginineActual() {
        return digestibleArginineActual;
    }

    public void setDigestibleArginineActual(BigDecimal digestibleArginineActual) {
        this.digestibleArginineActual = digestibleArginineActual;
    }

    public BigDecimal getDigestibleIsoleucine() {
        return digestibleIsoleucine;
    }

    public void setDigestibleIsoleucine(BigDecimal digestibleIsoleucine) {
        this.digestibleIsoleucine = digestibleIsoleucine;
    }

    public BigDecimal getDigestibleIsoleucineActual() {
        return digestibleIsoleucineActual;
    }

    public void setDigestibleIsoleucineActual(BigDecimal digestibleIsoleucineActual) {
        this.digestibleIsoleucineActual = digestibleIsoleucineActual;
    }

    public BigDecimal getDigestibleLeucine() {
        return digestibleLeucine;
    }

    public void setDigestibleLeucine(BigDecimal digestibleLeucine) {
        this.digestibleLeucine = digestibleLeucine;
    }

    public BigDecimal getDigestibleLeucineActual() {
        return digestibleLeucineActual;
    }

    public void setDigestibleLeucineActual(BigDecimal digestibleLeucineActual) {
        this.digestibleLeucineActual = digestibleLeucineActual;
    }

    public BigDecimal getDigestibleCystine() {
        return digestibleCystine;
    }

    public void setDigestibleCystine(BigDecimal digestibleCystine) {
        this.digestibleCystine = digestibleCystine;
    }

    public BigDecimal getDigestibleCystineActual() {
        return digestibleCystineActual;
    }

    public void setDigestibleCystineActual(BigDecimal digestibleCystineActual) {
        this.digestibleCystineActual = digestibleCystineActual;
    }

    public BigDecimal getDigestibleMethionineCystine() {
        return digestibleMethionineCystine;
    }

    public void setDigestibleMethionineCystine(BigDecimal digestibleMethionineCystine) {
        this.digestibleMethionineCystine = digestibleMethionineCystine;
    }

    public BigDecimal getDigestibleMethionineCystineActual() {
        return digestibleMethionineCystineActual;
    }

    public void setDigestibleMethionineCystineActual(BigDecimal digestibleMethionineCystineActual) {
        this.digestibleMethionineCystineActual = digestibleMethionineCystineActual;
    }

    public BigDecimal getLysineDigestibility() {
        return lysineDigestibility;
    }

    public void setLysineDigestibility(BigDecimal lysineDigestibility) {
        this.lysineDigestibility = lysineDigestibility;
    }

    public BigDecimal getMethionineDigestibility() {
        return methionineDigestibility;
    }

    public void setMethionineDigestibility(BigDecimal methionineDigestibility) {
        this.methionineDigestibility = methionineDigestibility;
    }

    public BigDecimal getTryptophanDigestibility() {
        return tryptophanDigestibility;
    }

    public void setTryptophanDigestibility(BigDecimal tryptophanDigestibility) {
        this.tryptophanDigestibility = tryptophanDigestibility;
    }

    public BigDecimal getThreonineDigestibility() {
        return threonineDigestibility;
    }

    public void setThreonineDigestibility(BigDecimal threonineDigestibility) {
        this.threonineDigestibility = threonineDigestibility;
    }

    public BigDecimal getValineDigestibility() {
        return valineDigestibility;
    }

    public void setValineDigestibility(BigDecimal valineDigestibility) {
        this.valineDigestibility = valineDigestibility;
    }

    public BigDecimal getArginineDigestibility() {
        return arginineDigestibility;
    }

    public void setArginineDigestibility(BigDecimal arginineDigestibility) {
        this.arginineDigestibility = arginineDigestibility;
    }

    public BigDecimal getIsoleucineDigestibility() {
        return isoleucineDigestibility;
    }

    public void setIsoleucineDigestibility(BigDecimal isoleucineDigestibility) {
        this.isoleucineDigestibility = isoleucineDigestibility;
    }

    public BigDecimal getLeucineDigestibility() {
        return leucineDigestibility;
    }

    public void setLeucineDigestibility(BigDecimal leucineDigestibility) {
        this.leucineDigestibility = leucineDigestibility;
    }

    public BigDecimal getCystineDigestibility() {
        return cystineDigestibility;
    }

    public void setCystineDigestibility(BigDecimal cystineDigestibility) {
        this.cystineDigestibility = cystineDigestibility;
    }

    public BigDecimal getMethionineCystineDigestibility() {
        return methionineCystineDigestibility;
    }

    public void setMethionineCystineDigestibility(BigDecimal methionineCystineDigestibility) {
        this.methionineCystineDigestibility = methionineCystineDigestibility;
    }

    public BigDecimal getWaterContentCoefficient() {
        return waterContentCoefficient;
    }

    public void setWaterContentCoefficient(BigDecimal waterContentCoefficient) {
        this.waterContentCoefficient = waterContentCoefficient;
    }

    public BigDecimal getCrudeProteinCoefficient() {
        return crudeProteinCoefficient;
    }

    public void setCrudeProteinCoefficient(BigDecimal crudeProteinCoefficient) {
        this.crudeProteinCoefficient = crudeProteinCoefficient;
    }

    public BigDecimal getCrudeFatCoefficient() {
        return crudeFatCoefficient;
    }

    public void setCrudeFatCoefficient(BigDecimal crudeFatCoefficient) {
        this.crudeFatCoefficient = crudeFatCoefficient;
    }

    public BigDecimal getCrudeFiberCoefficient() {
        return crudeFiberCoefficient;
    }

    public void setCrudeFiberCoefficient(BigDecimal crudeFiberCoefficient) {
        this.crudeFiberCoefficient = crudeFiberCoefficient;
    }

    public BigDecimal getCrudeAshCoefficient() {
        return crudeAshCoefficient;
    }

    public void setCrudeAshCoefficient(BigDecimal crudeAshCoefficient) {
        this.crudeAshCoefficient = crudeAshCoefficient;
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