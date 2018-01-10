package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.entity.Animal;
import com.kuo.artemis.server.util.MathUtil;

import java.util.*;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public class GroupDesign {


    /**
     * 完全随机区组设计，在每个区组内对个试验单元以随机方式实施不同处理  TODO 对数据进行判断看是否满足完全随机区组的要求
     * @param animals
     * @param param
     * @return
     */
    public static GroupDesignResult groupByRandomizedCompleteBlockDesign(List<Animal> animals, GroupDesignParam param) {
        GroupDesignResult result = new GroupDesignResult();

        //1.对动物数据按体重从大到小排序
        Collections.sort(animals, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });

        //2.按重复数确定区组个数
        int replication = param.getReplication();


        //3.依次将每个区组中的动物随机分配到各处理组
        int treatment = param.getTreatment();
        int unitNum = param.getUnitNumber();  //每个圈舍的动物数
        Double coefficientVariation = param.getCoefficientVariation();
        int maximumLoop = param.getMaximumRunningFrequency();
        int groupCount = treatment * unitNum;
        for (int i = 0; i < replication; i++) {

            List<Animal> animalGroup = animals.subList(i*groupCount, (i+1)*groupCount);
            multiRandomInGroup(animalGroup, treatment, unitNum, i+1, coefficientVariation, maximumLoop);
        }

        for (Animal animal : animals) {
            System.out.println(animal);
        }

        return result;
    }

    /**
     * 同一区组内进行随机分配处理组（考虑变异系数的情况）
     * @param animalList
     * @param treatmentNum
     * @param unitNum
     * @param replication
     * @param coefficientVariationAllowance
     * @param maximumLoop
     */
    private static void multiRandomInGroup(List<Animal> animalList, int treatmentNum, int unitNum, int replication, Double coefficientVariationAllowance, int maximumLoop) {

        int loopCount = 0;

        do {
            randomInGroup(animalList, treatmentNum, unitNum, replication);
            boolean isSatisfied = checkCoefficientVariation(animalList, unitNum, coefficientVariationAllowance);

            if (isSatisfied) {
                break;
            }
            loopCount++;
        } while (loopCount <= maximumLoop);
        System.out.println("迭代次数：" + loopCount);

    }

    /**
     * 同一区组里进行随机分配处理组（不考虑每个处理组中动物的性别分布）
     * @param animalGroup
     * @param treatmentNum
     * @param unitNum
     * @param replication
     */
    private static void randomInGroup(List<Animal> animalGroup, int treatmentNum, int unitNum, int replication) {

        //1.构建分组序列 111 222 333代表同一重复组下不同的处理组
        List<Integer> groupList = new ArrayList<Integer>();
        for (int i = 0; i < treatmentNum; i++) {
            for (int j = 0; j < unitNum; j++) {
                groupList.add(i+1);
            }
        }

        //2.将分组序列随机打乱
        Collections.shuffle(groupList, new Random(System.currentTimeMillis()));

        //3.为改组中的动物分配处理组
        for (int i = 0; i < animalGroup.size(); i++) {
            animalGroup.get(i).setReplicate(String.valueOf(replication));
            animalGroup.get(i).setTreatment(String.valueOf(groupList.get(i)));
        }

    }

    /**
     * 判断每个区组的变异系数是否满足条件
     * @param animalList
     * @param unitNum
     * @param coefficientVariationAllowance
     * @return
     */
    public static boolean checkCoefficientVariation(List<Animal> animalList, Integer unitNum, Double coefficientVariationAllowance) {

        //1.对动物按照处理组大小进行从小到大排序
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getTreatment().compareTo(o2.getTreatment());
            }
        });

        List<Double> averageList = new ArrayList<Double>();  //每个圈舍的体重平均数
        //2.计算每个圈舍中动物体重的平均数
        int treatment = animalList.size() / unitNum;
        for (int i = 0; i < treatment; i++) {
            List<Double> data = new ArrayList<Double>();
            for (int j = i*unitNum; j < (i+1)*unitNum; j++) {
                Double value = animalList.get(j).getAnimalInitWeight().doubleValue();
                data.add(value);
            }
            Double averageValue = MathUtil.computeAverage(data);
            averageList.add(averageValue);
        }

        //3.计算每个区组的变异系数
        Double coefficientVariation = MathUtil.computeCoefficientVariation(averageList);
        if (coefficientVariation < coefficientVariationAllowance) {
            return true;
        }

        return false;
    }
}
