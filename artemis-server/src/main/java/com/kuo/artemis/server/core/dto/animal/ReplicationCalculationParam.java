package com.kuo.artemis.server.core.dto.animal;

import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;

/**
 * @Author : guoyang
 * @Description : 重复数计算参数
 * @Date : Created on 2018/3/1
 */
public class ReplicationCalculationParam {

    @NotNull
    private String alpha;

    @NotNull
    private String power;

    @NotNull
    private MultipartFile file;

    @Override
    public String toString() {
        return "ReplicationCalculationParam{" +
                "alpha='" + alpha + '\'' +
                ", power='" + power + '\'' +
                ", file=" + file +
                '}';
    }

    public ReplicationCalculationParam() {
        super();
    }

    public ReplicationCalculationParam(String alpha, String power, MultipartFile file) {
        this.alpha = alpha;
        this.power = power;
        this.file = file;
    }

    public String getAlpha() {
        return alpha;
    }

    public void setAlpha(String alpha) {
        this.alpha = alpha;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
