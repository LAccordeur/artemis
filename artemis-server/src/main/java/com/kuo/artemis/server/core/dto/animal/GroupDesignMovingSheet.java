package com.kuo.artemis.server.core.dto.animal;

import com.kuo.artemis.server.entity.Animal;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/17
 */
public class GroupDesignMovingSheet {

    private List<Animal> animalListSortedByOldPenNum; //根据旧的圈舍编号排序

    private List<Animal> animalListSortedByNewPenNum;  //根据新的圈舍编号排序

    @Override
    public String toString() {
        return "GroupDesignMovingSheet{" +
                "animalListSortedByOldPenNum=" + animalListSortedByOldPenNum +
                ", animalListSortedByNewPenNum=" + animalListSortedByNewPenNum +
                '}';
    }

    public List<Animal> getAnimalListSortedByOldPenNum() {
        return animalListSortedByOldPenNum;
    }

    public void setAnimalListSortedByOldPenNum(List<Animal> animalListSortedByOldPenNum) {
        this.animalListSortedByOldPenNum = animalListSortedByOldPenNum;
    }

    public List<Animal> getAnimalListSortedByNewPenNum() {
        return animalListSortedByNewPenNum;
    }

    public void setAnimalListSortedByNewPenNum(List<Animal> animalListSortedByNewPenNum) {
        this.animalListSortedByNewPenNum = animalListSortedByNewPenNum;
    }
}
