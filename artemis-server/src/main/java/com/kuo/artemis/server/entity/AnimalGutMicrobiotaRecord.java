package com.kuo.artemis.server.entity;

import java.math.BigDecimal;

public class AnimalGutMicrobiotaRecord {
    private Integer id;

    private String animalId;

    private BigDecimal eColi;

    private BigDecimal bifidobacterium;

    private BigDecimal lacticAcidBacteria;

    private BigDecimal totalBacteria;

    private BigDecimal liveYeast;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnimalId() {
        return animalId;
    }

    public void setAnimalId(String animalId) {
        this.animalId = animalId;
    }

    public BigDecimal geteColi() {
        return eColi;
    }

    public void seteColi(BigDecimal eColi) {
        this.eColi = eColi;
    }

    public BigDecimal getBifidobacterium() {
        return bifidobacterium;
    }

    public void setBifidobacterium(BigDecimal bifidobacterium) {
        this.bifidobacterium = bifidobacterium;
    }

    public BigDecimal getLacticAcidBacteria() {
        return lacticAcidBacteria;
    }

    public void setLacticAcidBacteria(BigDecimal lacticAcidBacteria) {
        this.lacticAcidBacteria = lacticAcidBacteria;
    }

    public BigDecimal getTotalBacteria() {
        return totalBacteria;
    }

    public void setTotalBacteria(BigDecimal totalBacteria) {
        this.totalBacteria = totalBacteria;
    }

    public BigDecimal getLiveYeast() {
        return liveYeast;
    }

    public void setLiveYeast(BigDecimal liveYeast) {
        this.liveYeast = liveYeast;
    }
}