package com.kuo.artemis.server.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.kuo.artemis.server.core.common.MaterialIndicator;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.Date;
@JsonInclude(value = JsonInclude.Include.NON_NULL)
public class Material {
    @MaterialIndicator(isIndicator = false, name = "原料id", isIdentity = false)
    private Integer id;

    @MaterialIndicator(isIndicator = false, name = "原料创建者id", isIdentity = false)
    private Integer userId;

    @MaterialIndicator(isIndicator = false, name = "原料名称")
    private String materialName;

    @MaterialIndicator(name = "价格")
    private BigDecimal materialPrice;

    @MaterialIndicator(name = "标准水份(%)")
    private BigDecimal waterContentStandard;

    @MaterialIndicator(name = "实际水份(%)")
    private BigDecimal waterContentActual;

    @MaterialIndicator(name = "电解质平衡值")
    private BigDecimal dietaryElectrolyteBalance;

    @MaterialIndicator(name = "实际电解质平衡值")
    private BigDecimal dietaryElectrolyteBalanceActual;

    @MaterialIndicator(name = "钠Na(%)")
    private BigDecimal natrium;

    @MaterialIndicator(name = "实际钠Na(%)")
    private BigDecimal natriumActual;

    @MaterialIndicator(name = "钾K(%)")
    private BigDecimal kalium;

    @MaterialIndicator(name = "实际钾K(%)")
    private BigDecimal kaliumActual;

    @MaterialIndicator(name = "氯Cl(%)")
    private BigDecimal chlorine;

    @MaterialIndicator(name = "实际氯Cl(%)")
    private BigDecimal chlorineActual;

    @MaterialIndicator(name = "标准消化能DE kcal/kg")
    private BigDecimal digestiveEnergyStandard;

    @MaterialIndicator(name = "实际消化能DE kcal/kg")
    private BigDecimal digestiveEnergyActual;

    @MaterialIndicator(name = "净能NE kcal/kg")
    private BigDecimal netEnergy;

    @MaterialIndicator(name = "实际净能NE kcal/kg")
    private BigDecimal netEnergyActual;

    @MaterialIndicator(name = "亚油酸(%)")
    private BigDecimal linolicAcid;

    @MaterialIndicator(name = "实际亚油酸(%)")
    private BigDecimal linolicAcidActual;

    @MaterialIndicator(name = "粗蛋白质CP(%)")
    private BigDecimal crudeProtein;

    @MaterialIndicator(name = "实际粗蛋白质CP(%)")
    private BigDecimal crudeProteinActual;

    @MaterialIndicator(name = "粗脂肪EE(%)")
    private BigDecimal crudeFat;

    @MaterialIndicator(name = "实际粗脂肪EE(%)")
    private BigDecimal crudeFatActual;

    @MaterialIndicator(name = "粗纤维CF(%)")
    private BigDecimal crudeFiber;

    @MaterialIndicator(name = "实际粗纤维CF(%)")
    private BigDecimal crudeFiberActual;

    @MaterialIndicator(name = "粗灰分Ash(%)")
    private BigDecimal crudeAsh;

    @MaterialIndicator(name = "实际粗灰分Ash(%)")
    private BigDecimal crudeAshActual;

    @MaterialIndicator(name = "中性洗涤纤维NDF(%)")
    private BigDecimal nertralDetergentFiber;

    @MaterialIndicator(name = "实际中性洗涤纤维NDF(%)")
    private BigDecimal neutralDetergentFiberActual;

    @MaterialIndicator(name = "酸性洗涤纤维ADF(%)")
    private BigDecimal acidDetergentFiber;

    @MaterialIndicator(name = "实际酸性洗涤纤维ADF(%)")
    private BigDecimal acidDetergentFiberActual;

    @MaterialIndicator(name = "钙Ca(%)")
    private BigDecimal calcium;

    @MaterialIndicator(name = "实际钙Ca(%)")
    private BigDecimal calciumActual;

    @MaterialIndicator(name = "总磷P(%)")
    private BigDecimal totalPhosphor;

    @MaterialIndicator(name = "实际总磷P(%)")
    private BigDecimal totalPhosphorActual;

    @MaterialIndicator(name = "有效磷A-P(%)")
    private BigDecimal availablePhosphor;

    @MaterialIndicator(name = "实际有效磷A-P(%)")
    private BigDecimal availablePhosphorActual;

    @MaterialIndicator(name = "赖氨酸Lys(%)")
    private BigDecimal lysine;

    @MaterialIndicator(name = "实际赖氨酸Lys(%)")
    private BigDecimal lysineActual;

    @MaterialIndicator(name = "蛋氨酸Met(%)")
    private BigDecimal methionine;

    @MaterialIndicator(name = "实际蛋氨酸Met(%)")
    private BigDecimal methionineActual;

    @MaterialIndicator(name = "色氨酸Trp(%)")
    private BigDecimal tryptophan;

    @MaterialIndicator(name = "实际色氨酸Trp(%)")
    private BigDecimal tryptophanActual;

    @MaterialIndicator(name = "苏氨酸Thr(%)")
    private BigDecimal threonine;

    @MaterialIndicator(name = "实际苏氨酸Thr(%)")
    private BigDecimal threonineActual;

    @MaterialIndicator(name = "缬氨酸Val(%)")
    private BigDecimal valine;

    @MaterialIndicator(name = "实际缬氨酸Val(%)")
    private BigDecimal valineActual;

    @MaterialIndicator(name = "精氨酸Arg(%)")
    private BigDecimal arginine;

    @MaterialIndicator(name = "实际精氨酸Arg(%)")
    private BigDecimal arginineActual;

    @MaterialIndicator(name = "异亮氨酸Ile(%)")
    private BigDecimal isoleucine;

    @MaterialIndicator(name = "实际异亮氨酸Ile(%)")
    private BigDecimal isoleucineActual;

    @MaterialIndicator(name = "亮氨酸Leu(%)")
    private BigDecimal leucine;

    @MaterialIndicator(name = "实际亮氨酸Leu(%)")
    private BigDecimal leucineActual;

    @MaterialIndicator(name = "胱氨酸Cys(%)")
    private BigDecimal cystine;

    @MaterialIndicator(name = "实际胱氨酸Cys(%)")
    private BigDecimal cystineActual;

    @MaterialIndicator(name = "蛋+胱 (%)")
    private BigDecimal methionineCystine;

    @MaterialIndicator(name = "实际蛋+胱 (%)")
    private BigDecimal methionineCystineActual;

    @MaterialIndicator(name = "可消化赖氨酸Lys(%)")
    private BigDecimal digestibleLysine;

    @MaterialIndicator(name = "实际可消化赖氨酸Lys(%)")
    private BigDecimal digestibleLysineActual;

    @MaterialIndicator(name = "可消化蛋氨酸Met(%)")
    private BigDecimal digestibleMethionine;

    @MaterialIndicator(name = "实际可消化蛋氨酸Met(%)")
    private BigDecimal digestibleMethionineActual;

    @MaterialIndicator(name = "可消化色氨酸Trp(%)")
    private BigDecimal digestibleTryptophan;

    @MaterialIndicator(name = "实际可消化色氨酸Trp(%)")
    private BigDecimal digestibleTryptophanActual;

    @MaterialIndicator(name = "可消化苏氨酸Thr(%)")
    private BigDecimal digestibleThreonine;

    @MaterialIndicator(name = "实际可消化苏氨酸Thr(%)")
    private BigDecimal digestibleThreonineActual;

    @MaterialIndicator(name = "可消化缬氨酸Val(%)")
    private BigDecimal digestibleValine;

    @MaterialIndicator(name = "实际可消化缬氨酸Val(%)")
    private BigDecimal digestibleValineActual;

    @MaterialIndicator(name = "可消化精氨酸Arg(%)")
    private BigDecimal digestibleArginine;

    @MaterialIndicator(name = "实际可消化精氨酸Arg(%)")
    private BigDecimal digestibleArginineActual;

    @MaterialIndicator(name = "可消化异亮氨酸Ile(%)")
    private BigDecimal digestibleIsoleucine;

    @MaterialIndicator(name = "实际可消化异亮氨酸Ile(%)")
    private BigDecimal digestibleIsoleucineActual;

    @MaterialIndicator(name = "可消化亮氨酸Leu(%)")
    private BigDecimal digestibleLeucine;

    @MaterialIndicator(name = "实际可消化亮氨酸Leu(%)")
    private BigDecimal digestibleLeucineActual;

    @MaterialIndicator(name = "可消化胱氨酸Cys(%)")
    private BigDecimal digestibleCystine;

    @MaterialIndicator(name = "实际可消化胱氨酸Cys(%)")
    private BigDecimal digestibleCystineActual;

    @MaterialIndicator(name = "可消化蛋+胱氨酸(%)")
    private BigDecimal digestibleMethionineCystine;

    @MaterialIndicator(name = "实际可消化蛋+胱氨酸(%)")
    private BigDecimal digestibleMethionineCystineActual;

    @MaterialIndicator(name = "赖氨酸Lys消化率(%)")
    private BigDecimal lysineDigestibility;

    @MaterialIndicator(name = "蛋氨酸Met消化率(%)")
    private BigDecimal methionineDigestibility;

    @MaterialIndicator(name = "色氨酸Trp消化率(%)")
    private BigDecimal tryptophanDigestibility;

    @MaterialIndicator(name = "苏氨酸Thr消化率(%)")
    private BigDecimal threonineDigestibility;

    @MaterialIndicator(name = "缬氨酸Val消化率(%)")
    private BigDecimal valineDigestibility;

    @MaterialIndicator(name = "精氨酸Arg消化率(%)")
    private BigDecimal arginineDigestibility;

    @MaterialIndicator(name = "异亮氨酸Ile消化率(%)")
    private BigDecimal isoleucineDigestibility;

    @MaterialIndicator(name = "亮氨酸Leu消化率(%)")
    private BigDecimal leucineDigestibility;

    @MaterialIndicator(name = "胱氨酸Cys消化率(%)")
    private BigDecimal cystineDigestibility;

    @MaterialIndicator(name = "蛋+胱消化率(%)")
    private BigDecimal methionineCystineDigestibility;

    @MaterialIndicator(name = "水分系数消化率(%)")
    private BigDecimal waterContentCoefficient;

    @MaterialIndicator(name = "粗蛋白系数消化率(%)")
    private BigDecimal crudeProteinCoefficient;

    @MaterialIndicator(name = "粗脂肪系数消化率(%)")
    private BigDecimal crudeFatCoefficient;

    @MaterialIndicator(name = "粗纤维系数消化率(%)")
    private BigDecimal crudeFiberCoefficient;

    @MaterialIndicator(name = "粗灰分系数消化率(%)")
    private BigDecimal crudeAshCoefficient;

    @MaterialIndicator(isIndicator = false, name = "创建日期", isIdentity = false)
    private Date createTime;

    @MaterialIndicator(isIndicator = false, name = "修改日期", isIdentity = false)
    private Date modifiedTime;

    @Override
    public int hashCode() {
        int hashCode = 2;
        Field[] fields = Material.class.getDeclaredFields();
        for (Field field : fields) {
            if (field.isAnnotationPresent(MaterialIndicator.class)) {
                MaterialIndicator annotation = field.getAnnotation(MaterialIndicator.class);
                if (annotation.isIdentity()) {
                    field.setAccessible(true);
                    Object value = null;
                    try {
                        value = field.get(this);
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                    hashCode = hashCode + (null == value ? 0 : value.hashCode());
                }

            }
        }

        return hashCode;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if ((obj == null) || (obj.getClass()) != this.getClass()) {
            return false;
        }

        Material comparedMaterial;
        if (obj instanceof Material) {
            comparedMaterial = (Material) obj;
        } else {
            return false;
        }

        Field[] fields = Material.class.getDeclaredFields();

        //依次比较它们带有注解的每个字段的值
        for (Field field : fields) {
            if (field.isAnnotationPresent(MaterialIndicator.class)) {
                MaterialIndicator annotation = field.getAnnotation(MaterialIndicator.class);
                if (annotation.isIdentity()) {
                    field.setAccessible(true);
                    try {
                        Object value = field.get(this);
                        Object comparedValue = field.get(comparedMaterial);

                        if (value == null) {
                            if (comparedValue != null) {
                                return false;
                            } else {
                                continue;
                            }
                        } else if (value != null) {
                            if (value.equals(comparedValue)) {
                                continue;
                            } else {
                                return false;
                            }
                        }

                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                        return false;
                    }
                }
            }
        }
        return true;
    }

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