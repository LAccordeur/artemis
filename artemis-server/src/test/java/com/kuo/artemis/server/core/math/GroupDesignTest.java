package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.core.dto.animal.GroupGenderParam;
import com.kuo.artemis.server.entity.Animal;
import org.apache.commons.math.distribution.FDistribution;
import org.apache.commons.math.distribution.FDistributionImpl;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class GroupDesignTest {
    @Test
    public void groupByCRD() throws Exception {
        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        animal.setOldPen("1");
        animal.setNewPen("2");
        animals.add(animal);


        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animal1.setOldPen("1");
        animal1.setNewPen("2");
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        animal2.setOldPen("1");
        animal2.setNewPen("2");
        animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animal3.setOldPen("1");
        animal3.setNewPen("3");
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animal4.setOldPen("1");
        animal4.setNewPen("3");
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animal5.setOldPen("2");
        animal5.setNewPen("3");
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animal6.setOldPen("2");
        animal6.setNewPen("4");
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animal7.setOldPen("2");
        animal7.setNewPen("4");
        animals.add(animal7);

        Animal animal8 = new Animal();
        animal8.setAnimalInitWeight(new BigDecimal(12.86));
        //animal.setTreatmentNum("4");
        animal8.setAnimalSex(Byte.valueOf("1"));
        animal8.setOldPen("2");
        animal8.setNewPen("4");
        animals.add(animal8);

        Animal animal9 = new Animal();
        animal9.setAnimalInitWeight(new BigDecimal(10.98));
        //animal1.setTreatmentNum("2");
        animal9.setAnimalSex(Byte.valueOf("2"));
        animal9.setOldPen("3");
        animal9.setNewPen("5");
        animals.add(animal9);

        Animal animal10 = new Animal();
        animal10.setAnimalInitWeight(new BigDecimal(10.52));
        //animal2.setTreatmentNum("3");
        animal10.setAnimalSex(Byte.valueOf("1"));
        animal10.setOldPen("3");
        animal10.setNewPen("5");
        animals.add(animal10);

        Animal animal11 = new Animal();
        animal11.setAnimalInitWeight(new BigDecimal(10.36));
        //animal3.setTreatmentNum("2");
        animal11.setAnimalSex(Byte.valueOf("1"));
        animal11.setOldPen("3");
        animal11.setNewPen("6");
        animals.add(animal11);

        Animal animal12 = new Animal();
        animal12.setAnimalInitWeight(new BigDecimal(11.76));
        //animal4.setTreatmentNum("3");
        animal12.setAnimalSex(Byte.valueOf("2"));
        animal12.setOldPen("3");
        animal12.setNewPen("6");
        animals.add(animal12);

        Animal animal13 = new Animal();
        animal13.setAnimalInitWeight(new BigDecimal(11.28));
        //animal5.setTreatmentNum("1");
        animal13.setAnimalSex(Byte.valueOf("2"));
        animal13.setOldPen("3");
        animal13.setNewPen("7");
        animals.add(animal13);

        Animal animal14 = new Animal();
        animal14.setAnimalInitWeight(new BigDecimal(11.73));
        //animal6.setTreatmentNum("1");
        animal14.setAnimalSex(Byte.valueOf("1"));
        animal14.setOldPen("3");
        animal14.setNewPen("7");
        animals.add(animal14);

        Animal animal15 = new Animal();
        animal15.setAnimalInitWeight(new BigDecimal(10.68));
        //animal7.setTreatmentNum("4");
        animal15.setAnimalSex(Byte.valueOf("2"));
        animal15.setOldPen("4");
        animal15.setNewPen("7");
        animals.add(animal15);

        GroupDesignParam param = new GroupDesignParam();

        param.setUnitNumber(2);
        param.setTreatmentNum(2);
        param.setReplicationNum(2);

        System.out.println(GroupDesign.groupByCRD(animals, param));
        System.out.println("------------------------------------------");

        GroupDesignResult result = new GroupDesignResult();
        GroupDesign.setAnimalGroupMovingSheet(animals, result, true);
        System.out.println(result);

        FDistribution fDistribution = new FDistributionImpl(3D, 12D);
        System.out.println(1 - fDistribution.cumulativeProbability(0.65));
    }

    @Test
    public void groupByRCBWithoutGender() throws Exception {

        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        //animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        //animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal7);

        Animal animal8 = new Animal();
        animal8.setAnimalInitWeight(new BigDecimal(12.86));
        //animal.setTreatmentNum("4");
        animal8.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal8);

        Animal animal9 = new Animal();
        animal9.setAnimalInitWeight(new BigDecimal(10.98));
        //animal1.setTreatmentNum("2");
        animal9.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal9);

        Animal animal10 = new Animal();
        animal10.setAnimalInitWeight(new BigDecimal(10.52));
        //animal2.setTreatmentNum("3");
        animal10.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal10);

        Animal animal11 = new Animal();
        animal11.setAnimalInitWeight(new BigDecimal(10.36));
        //animal3.setTreatmentNum("2");
        animal11.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal11);

        Animal animal12 = new Animal();
        animal12.setAnimalInitWeight(new BigDecimal(11.76));
        //animal4.setTreatmentNum("3");
        animal12.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal12);

        Animal animal13 = new Animal();
        animal13.setAnimalInitWeight(new BigDecimal(11.28));
        //animal5.setTreatmentNum("1");
        animal13.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal13);

        Animal animal14 = new Animal();
        animal14.setAnimalInitWeight(new BigDecimal(11.73));
        //animal6.setTreatmentNum("1");
        animal14.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal14);

        Animal animal15 = new Animal();
        animal15.setAnimalInitWeight(new BigDecimal(10.68));
        //animal7.setTreatmentNum("4");
        animal15.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal15);

        GroupDesignParam param = new GroupDesignParam();
        param.setMaximumLoop(30);
        param.setUnitNumber(2);
        param.setTreatmentNum(3);
        param.setReplicationNum(2);
        param.setCoefficientAllowance(5D);

        System.out.println(GroupDesign.groupByRCBWithoutGender(animals, param));
    }

    @Test
    public void groupByRCBWithGenderBalance1() throws Exception {
        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        //animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        //animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal7);

        Animal animal8 = new Animal();
        animal8.setAnimalInitWeight(new BigDecimal(12.86));
        //animal.setTreatmentNum("4");
        animal8.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal8);

        Animal animal9 = new Animal();
        animal9.setAnimalInitWeight(new BigDecimal(10.98));
        //animal1.setTreatmentNum("2");
        animal9.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal9);

        Animal animal10 = new Animal();
        animal10.setAnimalInitWeight(new BigDecimal(10.52));
        //animal2.setTreatmentNum("3");
        animal10.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal10);

        Animal animal11 = new Animal();
        animal11.setAnimalInitWeight(new BigDecimal(10.36));
        //animal3.setTreatmentNum("2");
        animal11.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal11);

        Animal animal12 = new Animal();
        animal12.setAnimalInitWeight(new BigDecimal(11.76));
        //animal4.setTreatmentNum("3");
        animal12.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal12);

        Animal animal13 = new Animal();
        animal13.setAnimalInitWeight(new BigDecimal(11.28));
        //animal5.setTreatmentNum("1");
        animal13.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal13);

        Animal animal14 = new Animal();
        animal14.setAnimalInitWeight(new BigDecimal(11.73));
        //animal6.setTreatmentNum("1");
        animal14.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal14);

        Animal animal15 = new Animal();
        animal15.setAnimalInitWeight(new BigDecimal(10.68));
        //animal7.setTreatmentNum("4");
        animal15.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal15);

        GroupDesignParam param = new GroupDesignParam();
        param.setCoefficientAllowance(5D);
        param.setReplicationNum(2);
        param.setTreatmentNum(2);
        param.setUnitNumber(3);
        param.setUnitMaleNum(1);
        param.setUnitFemaleNum(2);
        param.setMaximumLoop(30);
        System.out.println(GroupDesign.groupByRCBWithGenderBalance(animals, param));

    }

    @Test
    public void groupByRCBWithGenderAsBlockingFactor1() throws Exception {
        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        //animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        //animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal7);

        Animal animal8 = new Animal();
        animal8.setAnimalInitWeight(new BigDecimal(12.86));
        //animal.setTreatmentNum("4");
        animal8.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal8);

        Animal animal9 = new Animal();
        animal9.setAnimalInitWeight(new BigDecimal(10.98));
        //animal1.setTreatmentNum("2");
        animal9.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal9);

        Animal animal10 = new Animal();
        animal10.setAnimalInitWeight(new BigDecimal(10.52));
        //animal2.setTreatmentNum("3");
        animal10.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal10);

        Animal animal11 = new Animal();
        animal11.setAnimalInitWeight(new BigDecimal(10.36));
        //animal3.setTreatmentNum("2");
        animal11.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal11);

        Animal animal12 = new Animal();
        animal12.setAnimalInitWeight(new BigDecimal(11.76));
        //animal4.setTreatmentNum("3");
        animal12.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal12);

        Animal animal13 = new Animal();
        animal13.setAnimalInitWeight(new BigDecimal(11.28));
        //animal5.setTreatmentNum("1");
        animal13.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal13);

        Animal animal14 = new Animal();
        animal14.setAnimalInitWeight(new BigDecimal(11.73));
        //animal6.setTreatmentNum("1");
        animal14.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal14);

        Animal animal15 = new Animal();
        animal15.setAnimalInitWeight(new BigDecimal(10.68));
        //animal7.setTreatmentNum("4");
        animal15.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal15);

        GroupDesignParam param = new GroupDesignParam();
        param.setTreatmentNum(2);
        param.setReplicationNum(2);
        param.setFemaleReplicationNum(1);
        param.setMaleReplicationNum(1);
        param.setUnitNumber(3);

        System.out.println(GroupDesign.groupByRCBWithGenderAsBlockingFactor(animals, param));


    }

    @Test
    public void groupByRCBWithDifferentGenderBalances1() throws Exception {

        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal7);

        Animal animal8 = new Animal();
        animal8.setAnimalInitWeight(new BigDecimal(12.86));
        //animal.setTreatmentNum("4");
        animal8.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal8);

        Animal animal9 = new Animal();
        animal9.setAnimalInitWeight(new BigDecimal(10.98));
        //animal1.setTreatmentNum("2");
        animal9.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal9);

        Animal animal10 = new Animal();
        animal10.setAnimalInitWeight(new BigDecimal(10.52));
        //animal2.setTreatmentNum("3");
        animal10.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal10);

        Animal animal11 = new Animal();
        animal11.setAnimalInitWeight(new BigDecimal(10.36));
        //animal3.setTreatmentNum("2");
        animal11.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal11);

        Animal animal12 = new Animal();
        animal12.setAnimalInitWeight(new BigDecimal(11.76));
        //animal4.setTreatmentNum("3");
        animal12.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal12);

        Animal animal13 = new Animal();
        animal13.setAnimalInitWeight(new BigDecimal(11.28));
        //animal5.setTreatmentNum("1");
        animal13.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal13);

        Animal animal14 = new Animal();
        animal14.setAnimalInitWeight(new BigDecimal(11.73));
        //animal6.setTreatmentNum("1");
        animal14.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal14);

        Animal animal15 = new Animal();
        animal15.setAnimalInitWeight(new BigDecimal(10.68));
        //animal7.setTreatmentNum("4");
        animal15.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal15);

        GroupDesignParam param = new GroupDesignParam();
        param.setReplicationNum(3);
        param.setTreatmentNum(2);

        List<GroupGenderParam> genderParams = new ArrayList<GroupGenderParam>();
        GroupGenderParam groupGenderParam = new GroupGenderParam();
        groupGenderParam.setUnitFemaleNum(1);
        groupGenderParam.setUnitMaleNum(1);
        groupGenderParam.setReplicationRangeBegin(1);
        groupGenderParam.setReplicationRangeEnd(1);
        genderParams.add(groupGenderParam);

        GroupGenderParam groupGenderParam1 = new GroupGenderParam();
        groupGenderParam1.setUnitFemaleNum(1);
        groupGenderParam1.setUnitMaleNum(2);
        groupGenderParam1.setReplicationRangeBegin(2);
        groupGenderParam1.setReplicationRangeEnd(2);
        genderParams.add(groupGenderParam1);

        param.setDifferentGenderBalancesParamList(genderParams);

        System.out.println(GroupDesign.groupByRCBWithDifferentGenderBalances(animals, param));

    }

    @Test
    public void sortedByWeightMedianDiff() throws Exception {

        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        //animals.add(animal7);

        //GroupDesign.sortedByWeightMedianDiff(animals);

    }

    @Test
    public void groupByRCBWithDifferentGenderBalances() throws Exception {
        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        //animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        //animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal7);

        Animal animal8 = new Animal();
        animal8.setAnimalInitWeight(new BigDecimal(12.86));
        //animal.setTreatmentNum("4");
        animal8.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal8);

        Animal animal9 = new Animal();
        animal9.setAnimalInitWeight(new BigDecimal(10.98));
        //animal1.setTreatmentNum("2");
        animal9.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal9);

        Animal animal10 = new Animal();
        animal10.setAnimalInitWeight(new BigDecimal(10.52));
        //animal2.setTreatmentNum("3");
        animal10.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal10);

        Animal animal11 = new Animal();
        animal11.setAnimalInitWeight(new BigDecimal(10.36));
        //animal3.setTreatmentNum("2");
        animal11.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal11);

        Animal animal12 = new Animal();
        animal12.setAnimalInitWeight(new BigDecimal(11.76));
        //animal4.setTreatmentNum("3");
        animal12.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal12);

        Animal animal13 = new Animal();
        animal13.setAnimalInitWeight(new BigDecimal(11.28));
        //animal5.setTreatmentNum("1");
        animal13.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal13);

        Animal animal14 = new Animal();
        animal14.setAnimalInitWeight(new BigDecimal(11.73));
        //animal6.setTreatmentNum("1");
        animal14.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal14);

        Animal animal15 = new Animal();
        animal15.setAnimalInitWeight(new BigDecimal(10.68));
        //animal7.setTreatmentNum("4");
        animal15.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal15);


        List<GroupGenderParam> groupGenderParamList = new ArrayList<GroupGenderParam>();
        GroupGenderParam groupGenderParam = new GroupGenderParam();
        groupGenderParam.setReplicationRangeBegin(1);
        groupGenderParam.setReplicationRangeEnd(2);
        groupGenderParam.setUnitMaleNum(1);
        groupGenderParam.setUnitFemaleNum(1);
        groupGenderParamList.add(groupGenderParam);

        GroupGenderParam groupGenderParam1 = new GroupGenderParam();
        groupGenderParam1.setReplicationRangeBegin(3);
        groupGenderParam1.setReplicationRangeEnd(3);
        groupGenderParam1.setUnitMaleNum(1);
        groupGenderParam1.setUnitFemaleNum(2);
        groupGenderParamList.add(groupGenderParam1);

        //GroupDesign.groupByRCBWithDifferentGenderBalances(animals, 2, groupGenderParamList, 5D, 30);
    }

    @Test
    public void computeMaleAnimalNum() throws Exception {

        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal2);

        //System.out.println(GroupDesign.computeMaleAnimalNum(animals));
    }

    @Test
    public void groupByRCBWithGenderBalance() throws Exception {
        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal7);

        Animal animal8 = new Animal();
        animal8.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal8.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal8);

        GroupDesignParam param = new GroupDesignParam();
        param.setTreatmentNum(4);
        param.setReplicationNum(1);
        param.setUnitMaleNum(1);
        param.setUnitFemaleNum(1);
        param.setCoefficientAllowance(5D);
        param.setMaximumLoop(20);

        GroupDesign.groupByRCBWithGenderBalance(animals, param);
    }

    @Test
    public void groupByRCBWithGenderAsBlockingFactor() throws Exception {
        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal7);

        //GroupDesign.groupByRCBWithGenderAsBlockingFactor(animals, 2, 1, 1, 2, 5D, 30);
    }

    @Test
    public void multiRandomInGroupByGenderBalance() throws Exception {

        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        //animal.setTreatmentNum("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        //animal1.setTreatmentNum("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        //animal2.setTreatmentNum("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        //animal3.setTreatmentNum("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        //animal4.setTreatmentNum("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        //animal5.setTreatmentNum("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        //animal6.setTreatmentNum("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        //animal7.setTreatmentNum("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal7);

        //GroupDesign.groupByRCBWithGenderBalance(animals, 2, 1, 1, 2, 5D,30);

    }

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
        //System.out.println(GroupDesign.checkCoefficientVariation(animals, 2, 5D));

    }

    @Test
    public void groupByRandomizedCompleteBlockDesign() throws Exception {

        List<Animal> animals = new ArrayList<Animal>();


        for (int i = 0; i < 32; i++) {
            Animal animal = new Animal();
            Random random = new Random();
            BigDecimal weight = new BigDecimal(Math.abs(random.nextInt()));
            animal.setAnimalInitWeight(weight);
            animals.add(animal);
        }

        GroupDesignParam param = new GroupDesignParam();
        param.setTreatmentNum(3);
        param.setReplicationNum(4);
        param.setUnitNumber(2);
        param.setCoefficientAllowance(5D);
        param.setMaximumLoop(10);

        GroupDesign.groupByRCBWithoutGender(animals, param);

    }

    @Test
    public void randomInGroup() {
        List<Animal> animals = new ArrayList<Animal>();

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(10.86));
        animal.setTreatment("4");
        animal.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal);

        Animal animal1 = new Animal();
        animal1.setAnimalInitWeight(new BigDecimal(10.88));
        animal1.setTreatment("2");
        animal1.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal1);

        Animal animal2 = new Animal();
        animal2.setAnimalInitWeight(new BigDecimal(10.92));
        animal2.setTreatment("3");
        animal2.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal2);

        Animal animal3 = new Animal();
        animal3.setAnimalInitWeight(new BigDecimal(11.36));
        animal3.setTreatment("2");
        animal3.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal3);

        Animal animal4 = new Animal();
        animal4.setAnimalInitWeight(new BigDecimal(11.56));
        animal4.setTreatment("3");
        animal4.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal4);

        Animal animal5 = new Animal();
        animal5.setAnimalInitWeight(new BigDecimal(11.58));
        animal5.setTreatment("1");
        animal5.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal5);

        Animal animal6 = new Animal();
        animal6.setAnimalInitWeight(new BigDecimal(11.72));
        animal6.setTreatment("1");
        animal6.setAnimalSex(Byte.valueOf("1"));
        animals.add(animal6);

        Animal animal7 = new Animal();
        animal7.setAnimalInitWeight(new BigDecimal(11.88));
        animal7.setTreatment("4");
        animal7.setAnimalSex(Byte.valueOf("2"));
        animals.add(animal7);

        //GroupDesign.randomInGroupByGender(animals, 4, 1, 1, 1);
    }

}