package com.kuo.artemis.server.core.helper;

import com.kuo.artemis.server.core.math.GroupDesign;
import com.kuo.artemis.server.core.math.GroupDesignParam;
import com.kuo.artemis.server.core.math.GroupDesignResult;
import com.kuo.artemis.server.entity.Animal;
import com.kuo.artemis.server.entity.AnimalHouse;
import com.kuo.artemis.server.util.constant.GroupDesignStatus;
import org.apache.commons.math.MathException;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/18
 */
public class AnimalGroupHelper {

    public static GroupDesignResult groupByCRD(List<Animal> animalList, GroupDesignParam param, List<AnimalHouse> animalHouseList) throws MathException {

        GroupDesignResult result = new GroupDesignResult();


        boolean groupStatus = GroupDesign.groupByCRD(animalList, param);
        if (!groupStatus) {
            return null;
        }
        assembleResult(animalList, param, animalHouseList, result, groupStatus);

        return result;
    }

    public static GroupDesignResult groupByRCBWithoutGender(List<Animal> animalList, GroupDesignParam param, List<AnimalHouse> animalHouseList) throws MathException {
        GroupDesignResult result = new GroupDesignResult();

        boolean groupStatus = GroupDesign.groupByRCBWithoutGender(animalList, param);
        if (!groupStatus) {
            return null;
        }
        assembleResult(animalList, param, animalHouseList, result, groupStatus);

        return result;
    }

    public static GroupDesignResult groupByRCBWithGenderBalance(List<Animal> animalList, GroupDesignParam param, List<AnimalHouse> animalHouseList) throws MathException {
        GroupDesignResult result = new GroupDesignResult();

        boolean groupStatus = GroupDesign.groupByRCBWithGenderBalance(animalList, param);
        if (!groupStatus) {
            return null;
        }
        assembleResult(animalList, param, animalHouseList, result, groupStatus);

        return result;
    }

    public static GroupDesignResult groupByRCBWithGenderAsBlockingFactor(List<Animal> animalList, GroupDesignParam param, List<AnimalHouse> animalHouseList) throws MathException {
        GroupDesignResult result = new GroupDesignResult();

        boolean groupStatus = GroupDesign.groupByRCBWithGenderAsBlockingFactor(animalList, param);
        if (!groupStatus) {
            return null;
        }
        assembleResult(animalList, param, animalHouseList, result, groupStatus);

        return result;
    }

    public static GroupDesignResult groupByRCBWithDifferentGenderBalances(List<Animal> animalList, GroupDesignParam param, List<AnimalHouse> animalHouseList) throws MathException {
        GroupDesignResult result = new GroupDesignResult();

        boolean groupStatus = GroupDesign.groupByRCBWithDifferentGenderBalances(animalList, param);
        if (!groupStatus) {
            return null;
        }
        assembleResult(animalList, param, animalHouseList, result, groupStatus);

        return result;
    }

    public static void assembleResult(List<Animal> animalList, GroupDesignParam param, List<AnimalHouse> animalHouseList, GroupDesignResult result, boolean groupStatus) throws MathException {
        Integer animalNumber = param.getAnimalNumber();
        if (groupStatus) {
            GroupDesign.setAnimalGroupNewPen(animalList, animalHouseList, groupStatus);
            GroupDesign.setAnimalGroupSummary(animalList, param, result, groupStatus);
            GroupDesign.setAnimalGroupMovingSheet(animalList, result, groupStatus);
            result.setStatus(GroupDesignStatus.SUCCESS);
        } else {
            result.setStatus(GroupDesignStatus.FAILURE);
        }
    }

}
