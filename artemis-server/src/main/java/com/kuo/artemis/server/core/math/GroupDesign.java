package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.entity.Animal;
import com.kuo.artemis.server.util.MathUtil;

import java.math.BigDecimal;
import java.util.*;

/**
 * @author : guoyang
 * @Description :
 * @Date : Created on 2017/12/19
 */
public class GroupDesign {

    private static final Random random = new Random();

    /**
     * 不考虑性别的情况下的完全随机区组设计，在每个区组内对个试验单元以随机方式实施不同处理  TODO 对数据进行判断看是否满足完全随机区组的要求
     * @param animals
     * @param param
     * @return
     */
    public static boolean groupByRCBWithoutGender(List<Animal> animals, GroupDesignParam param) {

        List<Animal> animalList = checkAnimalListByRCBWithoutGender(animals, param);

        if (animalList == null) {
            return false;
        }

        //1.对动物数据按体重从大到小排序
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });

        //2.按重复数确定区组个数
        int replication = param.getReplicationNum();


        //3.依次将每个区组中的动物随机分配到各处理组
        int treatment = param.getTreatmentNum();
        int unitNum = param.getUnitNumber();  //每个圈舍的动物数
        Double coefficientVariation = param.getCoefficientAllowance();
        int maximumLoop = param.getMaximumLoop();
        int groupCount = treatment * unitNum;
        for (int i = 0; i < replication; i++) {

            List<Animal> animalGroup = animalList.subList(i*groupCount, (i+1)*groupCount);
            multiRandomInGroup(animalGroup, treatment, unitNum, i+1, coefficientVariation, maximumLoop);
        }

        for (Animal animal : animals) {
            System.out.println(animal);
        }

        return true;
    }


    /**
     * （待测试）在考虑性别的情况下，采用Gender balanced pens方式进行的完全随机区组分组
     * @param animalList
     * @param param
     */
    public static void groupByRCBWithGenderBalance(List<Animal> animalList, GroupDesignParam param) {

        int treatmentNum = param.getTreatmentNum();
        int unitMaleNum = param.getUnitMaleNum();
        int unitFemaleNum = param.getUnitFemaleNum();
        int replicationNum = param.getReplicationNum();
        Double coefficientAllowance = param.getCoefficientAllowance();
        int maximumLoop = param.getMaximumLoop();

        //1.根据对动物集进行检查 并返回合适的实验动物集
        List<Animal> animals = checkAnimalListByRCBWithGenderBalance(animalList, param);

        //2.为动物分配区组
        randomGroupByGenderBalance(animals, treatmentNum, unitMaleNum, unitFemaleNum, replicationNum);


        Collections.sort(animals, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getReplicate().compareTo(o2.getReplicate());
            }
        });

        //3.对每个区组进行处理组的随机分配
        int groupCount = treatmentNum * (unitFemaleNum + unitMaleNum);
        for (int i = 0; i < replicationNum; i++) {
            List<Animal> animalGroup = animals.subList(i*groupCount, (i+1)*groupCount);
            multiRandomInGroupByGender(animalGroup, treatmentNum, unitMaleNum, unitFemaleNum, i+1, coefficientAllowance, maximumLoop);
        }

        for (Animal animal : animalList) {
            System.out.println(animal);
        }
    }


    /**
     * 考虑性别的情况下，通过Gender as blocking factor的方式来进行完全随机区组分组
     * @param animalList
     * @param treatmentNum
     * @param maleReplicationNum
     * @param femaleReplicationNum
     * @param unitNum
     * @param coefficientAllowance
     * @param maximumLoop
     */
    public static void groupByRCBWithGenderAsBlockingFactor(List<Animal> animalList, int treatmentNum, int maleReplicationNum, int femaleReplicationNum, int unitNum, Double coefficientAllowance, int maximumLoop) {
        //1.按性别进行排序（雄性在前，雌性在后）
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getAnimalSex().compareTo(o2.getAnimalSex());
            }
        });

        int maleAnimalNum = unitNum * treatmentNum * maleReplicationNum;
        int femaleAnimalNum = unitNum * treatmentNum * femaleReplicationNum;

        //2.分别获取雄性雌性动物列表
        List<Animal> maleAnimalList = animalList.subList(0, maleAnimalNum);
        List<Animal> femaleAnimalList = animalList.subList(maleAnimalNum, animalList.size());  //TODO 数目写死了

        //3.分别对两个动物集进行分组
        int groupCount = treatmentNum * unitNum;
        for (int i = 0; i < maleReplicationNum; i++) {
            List<Animal> animalGroup = maleAnimalList.subList(i*groupCount, (i+1)*groupCount);
            multiRandomInGroup(animalGroup, treatmentNum, unitNum, i+1, coefficientAllowance, maximumLoop);
        }

        for (int i = 0; i < femaleReplicationNum; i++) {
            List<Animal> animalGroup = femaleAnimalList.subList(i*groupCount, (i+1)*groupCount);
            multiRandomInGroup(animalGroup, treatmentNum, unitNum, maleReplicationNum+i+1, coefficientAllowance, maximumLoop);
        }

        for (Animal animal : animalList) {
            System.out.println(animal);
        }

    }


    /**
     * 考虑性别的情况下，通过Different gender balances across the replications
     * @param animalList
     * @param treatmentNum
     * @param groupGenderParamList
     * @param coefficientAllowance
     * @param maximumLoop
     */
    public static void groupByRCBWithDifferentGenderBalances(List<Animal> animalList, int treatmentNum, List<GroupGenderParam> groupGenderParamList, Double coefficientAllowance, int maximumLoop) {

        //获取雄性动物数目
        int maleAnimalNum = computeMaleAnimalNum(animalList);
        int femaleAnimalNum = animalList.size() - maleAnimalNum;

        //1.进行重复组的分配
        randomGroupByDifferentGenderBalance(animalList, treatmentNum, groupGenderParamList, maleAnimalNum, femaleAnimalNum);

        //2.按重复组进行排序
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getReplicate().compareTo(o2.getReplicate());
            }
        });

        //3.对每个区组进行随机化分配处理组
        int index = 0;
        for (int i = 0; i < groupGenderParamList.size(); i++) {
            GroupGenderParam param = groupGenderParamList.get(i);
            int replicationBegin = param.getReplicationRangeBegin();
            int replicationEnd = param.getReplicationRangeEnd();
            int unitMaleNum = param.getUnitMaleNum();
            int unitFemaleNum = param.getUnitFemaleNum();

            int groupNum = treatmentNum * (unitFemaleNum + unitMaleNum);
            for (int j = replicationBegin; j <= replicationEnd; j++) {
                List<Animal> animalGroup = animalList.subList(index, index + groupNum);
                multiRandomInGroupByGender(animalGroup, treatmentNum, unitMaleNum, unitFemaleNum, j, coefficientAllowance, maximumLoop);
                index = index + groupNum;
            }

        }


        for (Animal animal : animalList) {
            System.out.println(animal);
        }


    }

    /**
     * 根据分组参数判断在不考虑性别情况下参与RCB分组的动物数目是否符合要求，数目过少直接返回null, 过多返回合适的动物列表
     * @param animalList
     * @param param
     */
    private static List<Animal> checkAnimalListByRCBWithoutGender(List<Animal> animalList, GroupDesignParam param) {
        int replicationNum = param.getReplicationNum();
        int treatmentNum = param.getTreatmentNum();
        int unitNum = param.getUnitNumber();

        int requiredAnimalNum = replicationNum * treatmentNum * unitNum;
        int actualAnimalNum = animalList.size();

        if (actualAnimalNum < requiredAnimalNum) {
            return null;
        } else if (actualAnimalNum == requiredAnimalNum) {
            return animalList;
        } else {
            //1.当前的动物集高于所需要的动物，按动物体重偏离中位数的程度排序，并选择偏离较小的前n个
            sortedByWeightMedianDiff(animalList);
            return animalList.subList(0, requiredAnimalNum);
        }

    }

    /**
     * 根据分组参数判断在考虑性别的情况下参与RCB-Gender balance pens分组的动物数目是否符合要求
     * @param animalList
     * @param param
     * @return
     */
    private static List<Animal> checkAnimalListByRCBWithGenderBalance(List<Animal> animalList, GroupDesignParam param) {
        int replicationNum = param.getReplicationNum();
        int treatmentNum = param.getTreatmentNum();
        int unitMaleNum = param.getUnitMaleNum();
        int unitFemaleNum = param.getUnitFemaleNum();

        int requiredMaleAnimalNum = replicationNum * treatmentNum * unitMaleNum;
        int requiredFemaleAnimalNum = replicationNum * treatmentNum * unitFemaleNum;
        int requiredAnimalNum = requiredFemaleAnimalNum + requiredMaleAnimalNum;
        int actualAnimalNum = animalList.size();
        int actualMaleAnimalNum = computeMaleAnimalNum(animalList);
        int actualFemaleAnimalNum = actualAnimalNum - actualMaleAnimalNum;

        //1.先判断数目够不够
        if (actualAnimalNum < requiredAnimalNum || actualFemaleAnimalNum < requiredFemaleAnimalNum || actualMaleAnimalNum < requiredMaleAnimalNum) {
            return null;
        } else if (actualAnimalNum == requiredAnimalNum && actualMaleAnimalNum == requiredMaleAnimalNum && actualFemaleAnimalNum == requiredFemaleAnimalNum) {
            return animalList;
        } else {
            //2.选取合适的动物进行分组
            //按性别进行排序
            Collections.sort(animalList, new Comparator<Animal>() {
                public int compare(Animal o1, Animal o2) {
                    return o1.getAnimalSex().compareTo(o2.getAnimalSex());
                }
            });
            List<Animal> maleAnimalList = animalList.subList(0, actualMaleAnimalNum);
            List<Animal> femaleAnimalList = animalList.subList(actualMaleAnimalNum, actualAnimalNum);

            //分别对两种性别的动物按体重偏离中位数的程度进行从小到大排序
            sortedByWeightMedianDiff(maleAnimalList);
            sortedByWeightMedianDiff(femaleAnimalList);

            //标记符合条件的动物
            for (int i = 0; i < requiredMaleAnimalNum; i++) {
                maleAnimalList.get(i).setSuitable(1);
            }

            for (int i = 0; i < requiredFemaleAnimalNum; i++) {
                femaleAnimalList.get(i).setSuitable(1);
            }

            //将合适的动物放到列表的前面并返回
            Collections.sort(animalList, new Comparator<Animal>() {
                public int compare(Animal o1, Animal o2) {
                    return o2.getSuitable().compareTo(o1.getSuitable());
                }
            });

            return animalList.subList(0, requiredAnimalNum);
        }

    }

    private static List<Animal> checkAnimalListByRCBWithGenderAsBlockingFactor(List<Animal> animalList, GroupDesign param) {

        

        return null;

    }

    /**
     * 按照体重偏离中位数的程度进行排序
     * @param animalList
     */
    public static void sortedByWeightMedianDiff(List<Animal> animalList) {
        //1.先按体重排序并找出中位数
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });
        Double median = 0D;
        int animalNum = animalList.size();
        if (animalNum % 2 == 0) {
            BigDecimal weightLeft = animalList.get(animalNum / 2 - 1).getAnimalInitWeight();
            BigDecimal weightRight = animalList.get(animalNum / 2).getAnimalInitWeight();
            median = weightLeft.add(weightRight).doubleValue() / 2;
        } else {
            median = animalList.get(animalNum / 2).getAnimalInitWeight().doubleValue();
        }

        //2.计算每个动物的体重偏离中位数的程度
        for (Animal animal : animalList) {
            BigDecimal weight = animal.getAnimalInitWeight();
            Double deviationFromMedian = weight.doubleValue() - median;
            animal.setDeviationFromMedian(Math.abs(deviationFromMedian));
        }

        //3.将动物按照偏离中位数的程度从小到大排序
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getDeviationFromMedian().compareTo(o2.getDeviationFromMedian());
            }
        });

    }

    /**
     * 计算雄性动物的数目
     * @param animalList
     * @return
     */
    private static int computeMaleAnimalNum(List<Animal> animalList) {

        int maleAnimalNum = 0;

        for (Animal animal : animalList) {
            if ((Byte.valueOf("1").equals(animal.getAnimalSex()))) {
                maleAnimalNum++;
            }
        }

        return maleAnimalNum;
    }

    /**
     * 在不同重复组的圈舍单元中的动物性别分配不同的情况下 ，为每个动物分配好所在的重复组
     * @param animalList
     * @param treatmentNum
     * @param groupGenderParamList
     */
    private static void randomGroupByDifferentGenderBalance(List<Animal> animalList, int treatmentNum, List<GroupGenderParam> groupGenderParamList, int maleAnimalNum, int femaleAnimalNum) {
        //1.动物按性别进行排序（雄性在前）
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getAnimalSex().compareTo(o2.getAnimalSex());
            }
        });

        //2.获取雄性雌性动物列表
        List<Animal> maleAnimalList = animalList.subList(0, maleAnimalNum);
        List<Animal> femaleAnimalList = animalList.subList(maleAnimalNum, maleAnimalNum + femaleAnimalNum);

        //按体重排序
        Collections.sort(maleAnimalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });
        Collections.sort(femaleAnimalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });

        //3.对雄性动物进行重复组的分配
        int maleIndex = 0;
        for (int i = 0; i < groupGenderParamList.size(); i++) {
            GroupGenderParam param = groupGenderParamList.get(i);
            int replicationBegin = param.getReplicationRangeBegin();
            int replicationEnd = param.getReplicationRangeEnd();
            int unitMaleNum = param.getUnitMaleNum();

            int groupMaleNum = unitMaleNum * treatmentNum;

            for (int j = replicationBegin; j <= replicationEnd; j++) {
                List<Animal> groupAnimalList = maleAnimalList.subList(maleIndex, maleIndex + groupMaleNum);
                randomInGroup(groupAnimalList, treatmentNum, unitMaleNum, j);
                maleIndex = maleIndex + groupMaleNum;
            }

        }

        //4.对雌性动物进行重复组的分配
        int femaleIndex = 0;
        for (int i = 0; i < groupGenderParamList.size(); i++) {
            GroupGenderParam param = groupGenderParamList.get(i);
            int replicationBegin = param.getReplicationRangeBegin();
            int replicationEnd = param.getReplicationRangeEnd();
            int unitFemaleNum = param.getUnitFemaleNum();

            int groupFemaleNum = unitFemaleNum * treatmentNum;

            for (int j = replicationBegin; j <= replicationEnd; j++) {
                List<Animal> groupAnimalList = femaleAnimalList.subList(femaleIndex, femaleIndex + groupFemaleNum);
                randomInGroup(groupAnimalList, treatmentNum, unitFemaleNum, j);
                femaleIndex = femaleIndex + groupFemaleNum;
            }

        }
    }

    /**
     *  进行重复组的分配  //将动物集分成雌雄两部分来进行多个区组下的分组（效果等效于针对每个区组分别进行分组）
     * @param animalList
     * @param treatmentNum
     * @param unitMaleNum
     * @param unitFemaleNum
     * @param replicationNum
     */
    private static void randomGroupByGenderBalance(List<Animal> animalList, int treatmentNum, int unitMaleNum, int unitFemaleNum, int replicationNum) {
        //1.按性别进行排序（雄性在前，雌性在后）
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getAnimalSex().compareTo(o2.getAnimalSex());
            }
        });

        //2.对于雄性动物组和雌性动物组分别进行处理组的随机分配
        int groupMaleNum = unitMaleNum * treatmentNum;    //每个区组中雄性的总个数
        int groupFemaleNum = unitFemaleNum * treatmentNum;
        List<Animal> maleAnimalList = animalList.subList(0,groupMaleNum*replicationNum);
        Collections.sort(maleAnimalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });
        List<Animal> femaleAnimalList = animalList.subList(groupMaleNum*replicationNum, animalList.size());
        Collections.sort(femaleAnimalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });

        for (int i = 0; i < replicationNum; i++) {
            List<Animal> animalGroup = maleAnimalList.subList(i*groupMaleNum, (i+1)*groupMaleNum);
            randomInGroup(animalGroup, treatmentNum, unitMaleNum, i+1);
        }

        for (int i = 0; i < replicationNum; i++) {
            List<Animal> animalGroup = femaleAnimalList.subList(i*groupFemaleNum, (i+1)*groupFemaleNum);
            randomInGroup(animalGroup, treatmentNum, unitFemaleNum, i+1);
        }

    }


    /**
     * 同一区组内进行随机分配处理组（考虑变异系数的情况）（不考虑每个处理组中的性别分布）
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
     * 同一区组内进行随机分配处理组（考虑变异系数的情况）（考虑每个处理组中的性别分布）（此方法只针对完全随机区组设计）
     * @param animalList  需保证该区组内的动物雄雌的个数是符合条件的
     * @param treatmentNum
     * @param unitMaleNum
     * @param unitFemaleNum
     * @param replication
     * @param coefficientVariationAllowance
     * @param maximumLoop
     */
    private static void multiRandomInGroupByGender(List<Animal> animalList, int treatmentNum, int unitMaleNum, int unitFemaleNum, int replication, Double coefficientVariationAllowance, int maximumLoop) {
        int loopCount = 0;

        do {
            randomInGroupByGender(animalList, treatmentNum, unitMaleNum, unitFemaleNum, replication);
            boolean isSatisfied = checkCoefficientVariation(animalList, unitFemaleNum + unitMaleNum, coefficientVariationAllowance);

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
        Collections.shuffle(groupList, new Random(System.currentTimeMillis() + random.nextLong()));

        Collections.sort(animalGroup, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });
        //3.为该组中的动物分配处理组
        for (int i = 0; i < animalGroup.size(); i++) {
            animalGroup.get(i).setReplicate(String.valueOf(replication));
            animalGroup.get(i).setTreatment(String.valueOf(groupList.get(i)));
        }

    }

    /**
     * 同一区组内进行处理组的随机配方，每个处理组中的动物需要考虑性别分布
     * @param animalList
     * @param treatmentNum
     * @param unitMaleNum 每个处理组中雄性的动物个数
     * @param unitFemaleNum 每个处理组中雌性的动物个数
     * @param replication
     */
    private static void randomInGroupByGender(List<Animal> animalList, int treatmentNum, int unitMaleNum, int unitFemaleNum, int replication) {

        //1.对动物list按性别进行排序（雄性在前，雌性在后）
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getAnimalSex().compareTo(o2.getAnimalSex());
            }
        });

        //2.对于雄性动物组和雌性动物组分别进行处理组的随机分配
        int totalMaleNum = unitMaleNum * treatmentNum;    //一个区组内雄性的总个数
        List<Animal> maleAnimalList = animalList.subList(0,totalMaleNum);
        List<Animal> femaleAnimalList = animalList.subList(totalMaleNum, animalList.size());

        randomInGroup(maleAnimalList, treatmentNum, unitMaleNum, replication);
        randomInGroup(femaleAnimalList, treatmentNum, unitFemaleNum, replication);


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
