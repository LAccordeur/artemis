package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.entity.Animal;

import java.util.*;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public class GroupDesign {


    public static GroupDesignResult groupByRandomizedCompleteBlockDesign(List<Animal> animals, GroupDesignParam param) {
        GroupDesignResult result = new GroupDesignResult();

        //1.对动物数据按体重从大到小排序
        Collections.sort(animals, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getAnimalInitWeight().compareTo(o2.getAnimalInitWeight());
            }
        });

        //2.按重复数确定区组个数
        int replication = param.getReplication();


        //3.依次将每个区组中的动物随机分配到各处理组
        int treatment = param.getTreatment();
        int unitNum = param.getUnitNumber();
        int groupCount = treatment * unitNum;
        for (int i = 0; i < replication; i++) {

            List<Animal> animalGroup = animals.subList(i*groupCount, (i+1)*groupCount);
            randomInGroup(animalGroup, treatment, unitNum, i+1);
        }

        for (Animal animal : animals) {
            System.out.println(animal);
        }

        return result;
    }

    private static void randomInGroup(List<Animal> animalGroup, int treatmentNum, int unitNum, int replication) {

        //1.构建分组序列
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
}
