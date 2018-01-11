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

    private static final Random random = new Random();

    /**
     * 不考虑性别的情况下的完全随机区组设计，在每个区组内对个试验单元以随机方式实施不同处理  TODO 对数据进行判断看是否满足完全随机区组的要求
     * @param animals
     * @param param
     * @return
     */
    public static GroupDesignResult groupByRCBWithoutGender(List<Animal> animals, GroupDesignParam param) {
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
     * 在考虑性别的情况下，采用Gender balanced pens方式进行的完全随机区组分组
     * @param animalList
     * @param treatmentNum
     * @param unitMaleNum
     * @param unitFemaleNum
     * @param replicationNum
     * @param coefficientAllowance
     * @param maximumLoop
     */
    public static void groupByRCBWithGenderBalance(List<Animal> animalList, int treatmentNum, int unitMaleNum, int unitFemaleNum, int replicationNum, Double coefficientAllowance, int maximumLoop) {

        randomGroupByGenderBalance(animalList, treatmentNum, unitMaleNum, unitFemaleNum, replicationNum);
        boolean isSatisfied = checkCoefficientVariation(animalList, unitMaleNum + unitFemaleNum, coefficientAllowance);
        if (isSatisfied) {
            return;
        }

        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getReplicate().compareTo(o2.getReplicate());
            }
        });

        int groupCount = treatmentNum * (unitFemaleNum + unitMaleNum);
        for (int i = 0; i < replicationNum; i++) {
            List<Animal> animalGroup = animalList.subList(i*groupCount, (i+1)*groupCount);
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
     * (待测试)  考虑性别的情况下，通过Different gender balances across the replications
     * @param animalList
     * @param treatmentNum
     * @param groupGenderParamList
     * @param coefficientAllowance
     * @param maximumLoop
     */
    public static void groupByRCBWithDifferentGenderBalances(List<Animal> animalList, int treatmentNum, List<GroupGenderParam> groupGenderParamList, Double coefficientAllowance, int maximumLoop) {

        //1.进行重复组的分配
        //randomGroupByDifferentGenderBalance(animalList, treatmentNum, groupGenderParamList);

        //2.按重复组进行排序
        Collections.sort(animalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getReplicate().compareTo(o2.getReplicate());
            }
        });

        //3.对每个区组进行随机化分配处理组
        for (int i = 0; i < groupGenderParamList.size(); i++) {
            GroupGenderParam param = groupGenderParamList.get(i);
            int replicationBegin = param.getReplicationRangeBegin();
            int replicationEnd = param.getReplicationRangeEnd();
            int unitMaleNum = param.getUnitMaleNum();
            int unitFemaleNum = param.getUnitFemaleNum();

            int groupNum = treatmentNum * (unitFemaleNum + unitMaleNum);
            for (int j = replicationBegin; j <= replicationEnd; j++) {
                List<Animal> animalGroup = animalList.subList((j-1)*groupNum, j*groupNum);
                multiRandomInGroupByGender(animalGroup, treatmentNum, unitMaleNum, unitFemaleNum, j, coefficientAllowance, maximumLoop);
            }

        }


        for (Animal animal : animalList) {
            System.out.println(animal);
        }


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

        //3.对雄性动物进行重复组的分配
        for (int i = 0; i < groupGenderParamList.size(); i++) {
            GroupGenderParam param = groupGenderParamList.get(i);
            int replicationBegin = param.getReplicationRangeBegin();
            int replicationEnd = param.getReplicationRangeEnd();
            int unitMaleNum = param.getUnitMaleNum();

            int groupMaleNum = unitMaleNum * treatmentNum;

            for (int j = replicationBegin; j <= replicationEnd; j++) {
                List<Animal> groupAnimalList = animalList.subList((j-1)*groupMaleNum, j*groupMaleNum);
                randomInGroup(groupAnimalList, treatmentNum, unitMaleNum, j);
            }

        }

        //4.对雌性动物进行重复组的分配
        for (int i = 0; i < groupGenderParamList.size(); i++) {
            GroupGenderParam param = groupGenderParamList.get(i);
            int replicationBegin = param.getReplicationRangeBegin();
            int replicationEnd = param.getReplicationRangeEnd();
            int unitFemaleNum = param.getUnitFemaleNum();

            int groupFemaleNum = unitFemaleNum * treatmentNum;

            for (int j = replicationBegin; j <= replicationEnd; j++) {
                List<Animal> groupAnimalList = animalList.subList((j-1)*groupFemaleNum, j*groupFemaleNum);
                randomInGroup(groupAnimalList, treatmentNum, unitFemaleNum, j);
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
        int totalMaleNum = unitMaleNum * treatmentNum;    //每个区组中雄性的总个数
        int totalFemaleNum = unitFemaleNum * treatmentNum;
        List<Animal> maleAnimalList = animalList.subList(0,totalMaleNum*replicationNum);
        Collections.sort(maleAnimalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });
        List<Animal> femaleAnimalList = animalList.subList(totalMaleNum*replicationNum, animalList.size());
        Collections.sort(femaleAnimalList, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o2.getAnimalInitWeight().compareTo(o1.getAnimalInitWeight());
            }
        });

        for (int i = 0; i < replicationNum; i++) {
            List<Animal> animalGroup = maleAnimalList.subList(i*totalMaleNum, (i+1)*totalMaleNum);
            randomInGroup(animalGroup, treatmentNum, unitMaleNum, i+1);
        }

        for (int i = 0; i < replicationNum; i++) {
            List<Animal> animalGroup = femaleAnimalList.subList(i*totalFemaleNum, (i+1)*totalFemaleNum);
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
