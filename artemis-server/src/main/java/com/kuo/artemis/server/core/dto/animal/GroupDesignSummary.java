package com.kuo.artemis.server.core.dto.animal;

import com.kuo.artemis.server.entity.Animal;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/17
 */
public class GroupDesignSummary {

    private List<Animal> animalAllotmentResult;

    private List<List<Double>> summaryOfAnimalAllotment;

    private List<List<Double>> analysisOfVariance;

    @Override
    public String toString() {
        return "GroupDesignSummary{" +
                "animalAllotmentResult=" + animalAllotmentResult +
                ", summaryOfAnimalAllotment=" + summaryOfAnimalAllotment +
                ", analysisOfVariance=" + analysisOfVariance +
                '}';
    }

    public List<Animal> getAnimalAllotmentResult() {
        return animalAllotmentResult;
    }

    public void setAnimalAllotmentResult(List<Animal> animalAllotmentResult) {
        this.animalAllotmentResult = animalAllotmentResult;
    }

    public List<List<Double>> getSummaryOfAnimalAllotment() {
        return summaryOfAnimalAllotment;
    }

    public void setSummaryOfAnimalAllotment(List<List<Double>> summaryOfAnimalAllotment) {
        this.summaryOfAnimalAllotment = summaryOfAnimalAllotment;
    }

    public List<List<Double>> getAnalysisOfVariance() {
        return analysisOfVariance;
    }

    public void setAnalysisOfVariance(List<List<Double>> analysisOfVariance) {
        this.analysisOfVariance = analysisOfVariance;
    }
}
