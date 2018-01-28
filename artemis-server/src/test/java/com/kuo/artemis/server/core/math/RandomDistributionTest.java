package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.core.dto.animal.RandomDistributionParam;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionResult;
import com.kuo.artemis.server.entity.AnimalHouse;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class RandomDistributionTest {
    @Test
    public void randomTreatmentDistribution() throws Exception {

        List<AnimalHouse> animalHouseList = new ArrayList<AnimalHouse>();
        AnimalHouse animalHouse1 = new AnimalHouse();
        animalHouse1.setHouseCode("t1");
        animalHouse1.setReplicate("1");
        animalHouseList.add(animalHouse1);

        AnimalHouse animalHouse2 = new AnimalHouse();
        animalHouse2.setHouseCode("t2");
        animalHouse2.setReplicate("1");
        animalHouseList.add(animalHouse2);

        AnimalHouse animalHouse3 = new AnimalHouse();
        animalHouse3.setHouseCode("t3");
        animalHouse3.setReplicate("1");
        animalHouseList.add(animalHouse3);

        AnimalHouse animalHouse4 = new AnimalHouse();
        animalHouse4.setHouseCode("t4");
        animalHouse4.setReplicate("2");
        animalHouseList.add(animalHouse4);

        AnimalHouse animalHouse5 = new AnimalHouse();
        animalHouse5.setHouseCode("t5");
        animalHouse5.setReplicate("2");
        animalHouseList.add(animalHouse5);

        AnimalHouse animalHouse6 = new AnimalHouse();
        animalHouse6.setHouseCode("t6");
        animalHouse6.setReplicate("2");
        animalHouseList.add(animalHouse6);

        RandomDistributionParam param = new RandomDistributionParam();
        param.setReplicationNum(2);
        param.setTreatmentNum(3);
        param.setAnimalHouseList(animalHouseList);
        RandomDistributionResult result = RandomDistribution.randomTreatmentDistribution(param);

        List<AnimalHouse> resultList = result.getAnimalHouseList();
        for(AnimalHouse house : resultList) {
            System.out.println(house);
        }


    }

    @Test
    public void randomUnitDistribution() throws Exception {
        RandomDistributionParam param = new RandomDistributionParam();
        param.setReplicationNum(4);
        param.setTreatmentNum(5);

        //System.out.println(RandomDistribution.randomUnitDistribution(param));

    }

}