package com.kuo.artemis.server.entity;

import java.util.Date;

public class AnimalType {
    private Integer id;

    private String animalTypeName;

    private String animalTypeNameEnglish;

    private Date createTime;

    private Date modifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnimalTypeName() {
        return animalTypeName;
    }

    public void setAnimalTypeName(String animalTypeName) {
        this.animalTypeName = animalTypeName == null ? null : animalTypeName.trim();
    }

    public String getAnimalTypeNameEnglish() {
        return animalTypeNameEnglish;
    }

    public void setAnimalTypeNameEnglish(String animalTypeNameEnglish) {
        this.animalTypeNameEnglish = animalTypeNameEnglish == null ? null : animalTypeNameEnglish.trim();
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