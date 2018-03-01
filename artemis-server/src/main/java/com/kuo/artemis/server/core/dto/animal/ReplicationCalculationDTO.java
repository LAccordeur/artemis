package com.kuo.artemis.server.core.dto.animal;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/1
 */
public class ReplicationCalculationDTO {

    private String treatment;

    private String data;

    @Override
    public String toString() {
        return "ReplicationCalculationDTO{" +
                "treatment='" + treatment + '\'' +
                ", data='" + data + '\'' +
                '}';
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
