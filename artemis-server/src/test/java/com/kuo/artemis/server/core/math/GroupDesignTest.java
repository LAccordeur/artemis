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
    public void checkCoefficientVariation() throws Exception {
        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        animal.setTreatment("4");
        animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        animal1.setTreatment("2");
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        animal2.setTreatment("3");
        animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        animal3.setTreatment("2");
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        animal4.setTreatment("3");
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        animal5.setTreatment("1");
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        animal6.setTreatment("1");
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        animal7.setTreatment("4");
        animals.add(animal7);
        System.out.println(GroupDesign.checkCoefficientVariation(animals, 2, 5D));

    }

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
        param.setCoefficientVariation(5D);
        param.setMaximumRunningFrequency(10);

        GroupDesign.groupByRandomizedCompleteBlockDesign(animals, param);

    }


}