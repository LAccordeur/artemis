package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.entity.Animal;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import static org.junit.Assert.*;

public class GroupDesignTest {
    @Test
    public void groupByRandomizedCompleteBlockDesign() throws Exception {

        List<Animal> animals = new ArrayList<Animal>();


        for (int i = 0; i < 24; i++) {
            Animal animal = new Animal();
            Random random = new Random();
            BigDecimal weight = new BigDecimal(Math.abs(random.nextInt()));
            animal.setAnimalInitWeight(weight);
            animals.add(animal);
        }

        GroupDesignParam param = new GroupDesignParam();
        param.setTreatment(3);
        param.setReplication(4);
        param.setUnitNumber(2);

        GroupDesign.groupByRandomizedCompleteBlockDesign(animals, param);

    }


}