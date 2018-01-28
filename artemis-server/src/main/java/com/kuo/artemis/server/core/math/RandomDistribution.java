package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.core.dto.animal.RandomDistributionParam;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionResult;
import com.kuo.artemis.server.entity.AnimalHouse;

import java.util.*;

/**
 * @Author : guoyang
 * @Description : 圈舍的随机规划
 * @Date : Created on 2018/1/17
 */
public class RandomDistribution {

    /**
     * 圈舍规划
     * @param param
     * @return
     */
    /*@Deprecated
    public static RandomDistributionResult randomUnitDistribution(RandomDistributionParam param) {

        int replicationNum = param.getReplicationNum();
        int treatmentNum = param.getTreatmentNum();
        RandomDistributionResult result = new RandomDistributionResult();

        List<List> randomResult = new ArrayList<List>();
        for (int i = 0; i < replicationNum; i++) {
            List replicationResult = new ArrayList();
            for (int j = 0; j < treatmentNum; j++) {
                replicationResult.add(j+1);
            }
            Collections.shuffle(replicationResult, new Random(System.currentTimeMillis()+i));
            randomResult.add(replicationResult);
        }

        result.setRandomResult(randomResult);
        result.setParam(param);
        return result;
    }*/

    public static RandomDistributionResult randomTreatmentDistribution(RandomDistributionParam param) {
        RandomDistributionResult result = new RandomDistributionResult();

        List<AnimalHouse> animalHouseList = param.getAnimalHouseList();
        Integer replicationNum = param.getReplicationNum();
        Integer treatmentNum = param.getTreatmentNum();

        Collections.sort(animalHouseList, new Comparator<AnimalHouse>() {
            public int compare(AnimalHouse o1, AnimalHouse o2) {
                if (o1.getReplicate() == null) {
                    o1.setReplicate("");
                }
                if (o2.getReplicate() == null) {
                    o2.setReplicate("");
                }
                return o2.getReplicate().compareTo(o1.getReplicate());
            }
        });

        for (int i = 0; i < replicationNum; i++) {
            List<AnimalHouse> groupList = animalHouseList.subList(i*treatmentNum, (i+1)*treatmentNum);

            List<Integer> randomIntList = new ArrayList<Integer>();
            for (int m = 0; m < groupList.size(); m++) {
                randomIntList.add(m+1);
            }
            Collections.shuffle(randomIntList, new Random(System.currentTimeMillis()+i));

            for (int j = 0; j < groupList.size(); j++) {
                AnimalHouse animalHouse = groupList.get(j);

                animalHouse.setTreatment(String.valueOf(randomIntList.get(j)));
            }

        }

        Collections.sort(animalHouseList, new Comparator<AnimalHouse>() {
            public int compare(AnimalHouse o1, AnimalHouse o2) {
                return o1.getSequence().compareTo(o2.getSequence());
            }
        });


        result.setAnimalHouseList(animalHouseList);
        param.setAnimalHouseList(null);
        result.setParam(param);
        return result;
    }
}
