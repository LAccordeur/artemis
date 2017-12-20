package com.kuo.artemis.server.entity;

public class FormulationAnimalKey {
    private Integer formulationId;

    private String animalId;

    public Integer getFormulationId() {
        return formulationId;
    }

    public void setFormulationId(Integer formulationId) {
        this.formulationId = formulationId;
    }

    public String getAnimalId() {
        return animalId;
    }

    public void setAnimalId(String animalId) {
        this.animalId = animalId == null ? null : animalId.trim();
    }
}