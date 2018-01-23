package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.core.dto.animal.GroupDesignMovingSheet;
import com.kuo.artemis.server.core.dto.animal.GroupDesignSummary;
import com.kuo.artemis.server.core.dto.animal.GroupGenderParam;
import com.kuo.artemis.server.entity.Animal;
import com.kuo.artemis.server.entity.AnimalHouse;
import com.kuo.artemis.server.util.MathUtil;
import org.apache.commons.math.MathException;
import org.apache.commons.math.distribution.FDistribution;
import org.apache.commons.math.distribution.FDistributionImpl;

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
     * 采用完全随机的设计进行动物分组(此时不考虑变异系数)
     * @param animalList
     * @return
     */
    public static boolean groupByCRD(List<Animal> animalList, GroupDesignParam param) {
        List<Animal> animals = checkAnimalListWithoutGender(animalList, param);

        if (animals == null) {
            return false;
        }
        markIsSuitableField(animals);

        int treatmentNum = param.getTreatmentNum();
        int replicationNum = param.getReplicationNum();
        int unitNum = param.getUnitNumber();

        //1.将动物顺序随机打乱
        Collections.shuffle(animals);

        //2.依次指定重复组和处理组
        int groupNum = treatmentNum * unitNum;  //每个重复组中的动物数目
        for (int i = 0; i < replicationNum; i++) {
            int replication = i + 1;
            List<Animal> animalGroup = animals.subList(i*groupNum, (i+1)*groupNum);
            multiRandomInGroup(animalGroup, treatmentNum, unitNum, replication, 20D, 5);

            Collections.sort(animalGroup, new Comparator<Animal>() {
                public int compare(Animal o1, Animal o2) {
                    return o1.getTreatment().compareTo(o2.getTreatment());
                }
            });
        }


        for (Animal animal : animalList) {
            System.out.println(animal);
        }
        return true;
    }

    /**
     * 不考虑性别的情况下的完全随机区组设计，在每个区组内对个试验单元以随机方式实施不同处理
     * @param animals
     * @param param
     * @return
     */
    public static boolean groupByRCBWithoutGender(List<Animal> animals, GroupDesignParam param) {

        List<Animal> animalList = checkAnimalListWithoutGender(animals, param);

        if (animalList == null) {
            return false;
        }
        markIsSuitableField(animalList);

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
     * 在考虑性别的情况下，采用Gender balanced pens方式进行的完全随机区组分组
     * @param animalList
     * @param param
     * @return
     */
    public static boolean groupByRCBWithGenderBalance(List<Animal> animalList, GroupDesignParam param) {

        int treatmentNum = param.getTreatmentNum();
        Integer unitMaleNum = param.getUnitMaleNum();
        Integer unitFemaleNum = param.getUnitFemaleNum();
        int replicationNum = param.getReplicationNum();
        Double coefficientAllowance = param.getCoefficientAllowance();
        int maximumLoop = param.getMaximumLoop();

        //1.根据对动物集进行检查 并返回合适的实验动物集
        List<Animal> animals = checkAnimalListByRCBWithGenderBalance(animalList, param);

        if (animals == null) {
            return false;
        }

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
        return true;
    }


    /**
     * 考虑性别的情况下，通过Gender as blocking factor的方式来进行完全随机区组分组
     * @param animalList
     * @param param
     * @return
     */
    public static boolean groupByRCBWithGenderAsBlockingFactor(List<Animal> animalList, GroupDesignParam param) {

        int treatmentNum = param.getTreatmentNum();
        int maleReplicationNum = param.getMaleReplicationNum();
        int femaleReplicationNum = param.getFemaleReplicationNum();
        int unitNum = param.getUnitNumber();
        Double coefficientAllowance = param.getCoefficientAllowance();
        int maximumLoop = param.getMaximumLoop();

        List<Animal> animals = checkAnimalListByRCBWithGenderAsBlockingFactor(animalList, param);
        if (animals == null) {
            return false;
        }

        //1.按性别进行排序（雄性在前，雌性在后）
        Collections.sort(animals, new Comparator<Animal>() {
            public int compare(Animal o1, Animal o2) {
                return o1.getAnimalSex().compareTo(o2.getAnimalSex());
            }
        });

        int maleAnimalNum = unitNum * treatmentNum * maleReplicationNum;
        int femaleAnimalNum = unitNum * treatmentNum * femaleReplicationNum;

        //2.分别获取雄性雌性动物列表
        List<Animal> maleAnimalList = animals.subList(0, maleAnimalNum);
        List<Animal> femaleAnimalList = animals.subList(maleAnimalNum, animals.size());

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

        return true;
    }


    /**
     * 考虑性别的情况下，通过Different gender balances across the replications
     * @param animalList
     * @param groupDesignParam
     * @return
     */
    public static boolean groupByRCBWithDifferentGenderBalances(List<Animal> animalList, GroupDesignParam groupDesignParam) {

        int treatmentNum = groupDesignParam.getTreatmentNum();
        List<GroupGenderParam> groupGenderParamList = groupDesignParam.getDifferentGenderBalancesParamList();
        Double coefficientAllowance = groupDesignParam.getCoefficientAllowance();
        int maximumLoop = groupDesignParam.getMaximumLoop();

        List<Animal> animals = checkAnimalListByRCBWithDifferentGenderBalances(animalList, groupDesignParam);
        if (animals == null) {
            return false;
        }

        //获取雄性动物数目
        int maleAnimalNum = computeMaleAnimalNum(animals);
        int femaleAnimalNum = animals.size() - maleAnimalNum;

        //1.进行重复组的分配
        randomGroupByDifferentGenderBalance(animals, treatmentNum, groupGenderParamList, maleAnimalNum, femaleAnimalNum);

        //2.按重复组进行排序
        Collections.sort(animals, new Comparator<Animal>() {
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
                List<Animal> animalGroup = animals.subList(index, index + groupNum);
                multiRandomInGroupByGender(animalGroup, treatmentNum, unitMaleNum, unitFemaleNum, j, coefficientAllowance, maximumLoop);
                index = index + groupNum;
            }

        }


        for (Animal animal : animalList) {
            System.out.println(animal);
        }

        return true;

    }

    /**
     * 分组完成后 根据先前圈舍规划的结果 根据重复组和处理组为每个动物设置新的圈舍号
     * @param animalList
     * @param animalHouseList
     * @param groupStatus
     */
    public static void setAnimalGroupNewPen(List<Animal> animalList, List<AnimalHouse> animalHouseList, boolean groupStatus) {

        Map<String, Map<String, String>> map = getHouseCodeByReplicationAndTreatment(animalHouseList);

        if (groupStatus) {
            for (Animal animal : animalList) {
                if (1 == animal.getSuitable() || (animal.getReplicate() != null && animal.getTreatment() != null && !"".equals(animal.getReplicate()) && !"".equals(animal.getTreatment()))) {
                    String replication = animal.getReplicate();
                    String treatment = animal.getTreatment();
                    String houseCode = map.get(replication).get(treatment);
                    animal.setOldPen(animal.getHouse());
                    animal.setNewPen(houseCode);
                    animal.setHouse(houseCode);
                }
            }
        }
    }

    private static Map<String, Map<String, String>> getHouseCodeByReplicationAndTreatment(List<AnimalHouse> animalHouseList) {

        Set<String> replicationSet = new HashSet<String>();
        for (AnimalHouse animalHouse : animalHouseList) {
            String replication = animalHouse.getReplicate();
            if (replication != null) {
                replicationSet.add(replication);
            }
        }

        Map<String, Map<String, String>> resultMap = new HashMap<String, Map<String, String>>();
        Iterator<String> iterator = replicationSet.iterator();
        while (iterator.hasNext()) {
            String replicationKey = iterator.next();
            Map<String, String> map = new HashMap<String, String>();
            resultMap.put(replicationKey, map);
        }

        for (AnimalHouse animalHouse : animalHouseList) {
            String replication = animalHouse.getReplicate();
            String treatment = animalHouse.getTreatment();
            String houseCode = animalHouse.getHouseCode();
            Map<String, String> map = resultMap.get(replication);
            map.put(treatment, houseCode);
        }

        return resultMap;
    }

    /**
     * 分组完成后 设置分组总结  TODO 检验动物是否合适
     * @param animalList
     * @param result
     * @param groupStatus
     */
    public static void setAnimalGroupSummary(List<Animal> animalList, GroupDesignParam param, GroupDesignResult result, boolean groupStatus) throws MathException {

        int treatmentNum = param.getTreatmentNum();
        int replicationNum = param.getReplicationNum();
        GroupDesignSummary summary = null;

        if (groupStatus) {
            //初始化数据结构
            List<List<Double>> summaryOfAnimalAllotment = new ArrayList<List<Double>>();
            List<List<Double>> analysisOfVariance = new ArrayList<List<Double>>();
            for (int i = 0; i <= treatmentNum + 1; i++) {
                List<Double> list = new ArrayList<Double>();
                summaryOfAnimalAllotment.add(list);
            }

            for (int i = 0; i < 4; i++) {
                List<Double> list = new ArrayList<Double>();
                analysisOfVariance.add(list);
            }

            //设置animal allotment result
            summary = new GroupDesignSummary();
            summary.setAnimalAllotmentResult(animalList);

            //组装summary of animal allotment
            List<Double> meanListForAnalysis = new ArrayList();
            List<Double> meanList = new ArrayList<Double>();
            List<Double> cvList = new ArrayList<Double>();
            for (Animal animal : animalList) {
                if (animal.getSuitable() == 1  || (animal.getReplicate() != null && animal.getTreatment() != null && !"".equals(animal.getReplicate()) && !"".equals(animal.getTreatment()))) {
                    Double mean = animal.getWeightMean();
                    Double cv = animal.getCoefficientOfVariation();
                    if (!meanList.contains(mean)) {
                        if (mean != null) {
                            meanList.add(mean);
                        }
                    }
                    if (!cvList.contains(cv)) {
                        if (cv != null) {
                            cvList.add(cv);
                        }
                    }
                }
            }

            //将每个处理组的平均数填入表格
            for (int i = 0; i < meanList.size(); i++) {
                int rowIndex = i % treatmentNum;

                List<Double> rowData = summaryOfAnimalAllotment.get(rowIndex);
                rowData.add(meanList.get(i));
            }

            //计算每一列的平均数
            List<Double> rowMeanList = summaryOfAnimalAllotment.get(treatmentNum);
            for (int i = 0; i < replicationNum; i++) {
                List<Double> groupList = meanList.subList(i*treatmentNum, (i+1)*treatmentNum);
                Double colMean = MathUtil.computeAverage(groupList);
                rowMeanList.add(colMean);
            }
            //计算每一行的平均数
            for (int i = 0; i <= treatmentNum; i++) {
                List<Double> rowData = summaryOfAnimalAllotment.get(i);
                Double rowMean = MathUtil.computeAverage(rowData);
                rowData.add(rowMean);
                if (i != treatmentNum) {
                    meanListForAnalysis.add(rowMean);
                }
            }
            //设置CV行
            List<Double> cvRow = summaryOfAnimalAllotment.get(treatmentNum + 1);
            for (int i = 0; i < cvList.size(); i++) {
                cvRow.add(cvList.get(i));
            }
            cvRow.add(MathUtil.computeCoefficientVariation(meanListForAnalysis));

            //组装Analysis of Variance
            List<Double> repList = analysisOfVariance.get(0);
            Double repDf = replicationNum - 1.0;
            repList.add(repDf);
            Double repSs = MathUtil.computerSS(summaryOfAnimalAllotment.get(treatmentNum).subList(0, replicationNum));
            repList.add(repSs);
            Double repMs = repSs / repDf;
            repList.add(repMs);

            List<Double> trtList = analysisOfVariance.get(1);
            Double trtDf = treatmentNum - 1.0;
            trtList.add(trtDf);
            Double trtSs = MathUtil.computerSS(meanListForAnalysis);
            trtList.add(trtSs);
            Double trtMs = trtSs / trtDf;
            trtList.add(trtMs);

            List<Double> errorList = analysisOfVariance.get(2);
            Double errorDf = repDf * trtDf;
            errorList.add(errorDf);

            List<Double> totalList = analysisOfVariance.get(3);
            totalList.add(treatmentNum * replicationNum - 1.0);
            Double totalSs = MathUtil.computerSS(meanList);
            totalList.add(totalSs);

            Double errorSs = totalSs - trtSs - repSs;
            errorList.add(errorSs);
            Double errorMs = errorSs / errorDf;
            errorList.add(errorMs);

            Double repFValue = repMs / errorMs;
            repList.add(repFValue);
            FDistribution fDistributionRep = new FDistributionImpl(repDf, errorDf);
            Double repPrF = 1 - fDistributionRep.cumulativeProbability(repFValue);
            repList.add(repPrF);

            Double trtFValue = trtMs / errorMs;
            trtList.add(trtFValue);
            FDistribution fDistributionTrt = new FDistributionImpl(trtDf, errorDf);
            Double trtPrf = 1 - fDistributionTrt.cumulativeProbability(trtFValue);
            trtList.add(trtPrf);

            summary.setSummaryOfAnimalAllotment(summaryOfAnimalAllotment);
            summary.setAnalysisOfVariance(analysisOfVariance);


            result.setSummary(summary);

        }

    }


    /**
     * 分组完成后 设置动物分组结果的moving sheet  TODO 检测动物是否合适
     * @param animalList
     * @param result
     * @param groupStatus
     */
    public static void setAnimalGroupMovingSheet(List<Animal> animalList, GroupDesignResult result, boolean groupStatus) {

        GroupDesignMovingSheet movingSheet = null;
        if (groupStatus) {
            movingSheet = new GroupDesignMovingSheet();

            List<Animal> newAnimalList = new ArrayList<Animal>();
            Collections.addAll(newAnimalList, new Animal[animalList.size()]);
            Collections.copy(newAnimalList, animalList);

            List<Animal> oldAnimalList = new ArrayList<Animal>();
            Collections.addAll(oldAnimalList, new Animal[animalList.size()]);
            Collections.copy(oldAnimalList, animalList);

            //按旧的圈舍号排序
            Collections.sort(oldAnimalList, new Comparator<Animal>() {
                public int compare(Animal o1, Animal o2) {
                    if (o1.getOldPen() == null) {
                        return 1;
                    }
                    return o1.getOldPen().compareTo(o2.getOldPen());
                }
            });
            movingSheet.setAnimalListSortedByOldPenNum(oldAnimalList);

            //按新的圈舍号排序
            Collections.sort(newAnimalList, new Comparator<Animal>() {
                public int compare(Animal o1, Animal o2) {
                    if (o1.getNewPen() == null) {
                        return 1;
                    }
                    return o1.getNewPen().compareTo(o2.getNewPen());
                }
            });
            movingSheet.setAnimalListSortedByNewPenNum(newAnimalList);
        }

        result.setMovingSheet(movingSheet);
    }

    /**
     * 根据分组参数判断在不考虑性别情况下参与分组的动物数目是否符合要求，数目过少直接返回null, 过多返回合适的动物列表
     * @param animalList
     * @param param
     */
    private static List<Animal> checkAnimalListWithoutGender(List<Animal> animalList, GroupDesignParam param) {
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
        Integer unitMaleNum = param.getUnitMaleNum();
        Integer unitFemaleNum = param.getUnitFemaleNum();
        int unitNum = param.getUnitNumber();
        if (unitFemaleNum == null || unitMaleNum == null) {
            return null;
        }

        int requiredMaleAnimalNum = replicationNum * treatmentNum * unitMaleNum;
        int requiredFemaleAnimalNum = replicationNum * treatmentNum * unitFemaleNum;
        int requiredAnimalNum = requiredFemaleAnimalNum + requiredMaleAnimalNum;
        int actualAnimalNum = animalList.size();
        int actualMaleAnimalNum = computeMaleAnimalNum(animalList);
        int actualFemaleAnimalNum = actualAnimalNum - actualMaleAnimalNum;

        //对输入参数进行一个初步检查
        if (unitNum != (unitMaleNum + unitFemaleNum)) {
            return null;
        }

        return getSuitableAnimals(animalList, requiredMaleAnimalNum, requiredFemaleAnimalNum, requiredAnimalNum, actualAnimalNum, actualMaleAnimalNum, actualFemaleAnimalNum);


    }

    /**
     * 根据性别要求，得到合适的动物list
     * @param animalList
     * @param requiredMaleAnimalNum
     * @param requiredFemaleAnimalNum
     * @param requiredAnimalNum
     * @param actualAnimalNum
     * @param actualMaleAnimalNum
     * @param actualFemaleAnimalNum
     * @return
     */
    private static List<Animal> getSuitableAnimals(List<Animal> animalList, int requiredMaleAnimalNum, int requiredFemaleAnimalNum, int requiredAnimalNum, int actualAnimalNum, int actualMaleAnimalNum, int actualFemaleAnimalNum) {
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

    /**
     * 根据分组参数判断在考虑性别的情况下，参与RCB-Gender as a blocking factor分组的动物数目是否符合要求
     * @param animalList
     * @param param
     * @return
     */
    private static List<Animal> checkAnimalListByRCBWithGenderAsBlockingFactor(List<Animal> animalList, GroupDesignParam param) {

        int unitNum = param.getUnitNumber();
        int treatmentNum = param.getTreatmentNum();
        int replicationNum = param.getReplicationNum();
        Integer femaleReplicationNum = param.getFemaleReplicationNum();
        Integer maleReplicationNum = param.getMaleReplicationNum();
        if (femaleReplicationNum == null || maleReplicationNum == null) {
            return null;
        }

        int requiredAnimalNum = unitNum * treatmentNum * replicationNum;
        int requiredFemaleAnimalNum = unitNum * treatmentNum * femaleReplicationNum;
        int requiredMaleAnimalNum = unitNum * treatmentNum * maleReplicationNum;
        int actualAnimalNum = animalList.size();
        int actualMaleAnimalNum = computeMaleAnimalNum(animalList);
        int actualFemaleAnimalNum = actualAnimalNum - actualMaleAnimalNum;



        return getSuitableAnimals(animalList, requiredMaleAnimalNum, requiredFemaleAnimalNum, requiredAnimalNum, actualAnimalNum, actualMaleAnimalNum, actualFemaleAnimalNum);

    }


    /**
     * 根据分组参数判断在考虑性别的情况下，参与RCB-Different balance across the replications分组的动物数目是否符合要求
     * @param animalList
     * @param param
     * @return
     */
    private static List<Animal> checkAnimalListByRCBWithDifferentGenderBalances(List<Animal> animalList, GroupDesignParam param) {

        int treatmentNum = param.getTreatmentNum();
        int replicationNum = param.getReplicationNum();
        List<GroupGenderParam> differentGenderBalancesParamList = param.getDifferentGenderBalancesParamList();
        if (differentGenderBalancesParamList == null || differentGenderBalancesParamList.size() == 0) {
            return null;
        }

        int actualAnimalNum = animalList.size();
        int actualMaleAnimalNum = computeMaleAnimalNum(animalList);
        int actualFemaleAnimalNum = actualAnimalNum - actualMaleAnimalNum;

        int requiredAnimalNum = 0;
        int requiredMaleAnimalNum = 0;
        int requiredFemaleAnimalNum = 0;
        for (GroupGenderParam genderParam : differentGenderBalancesParamList) {
            int replicationRangeBegin = genderParam.getReplicationRangeBegin();
            int replicationRangeEnd = genderParam.getReplicationRangeEnd();
            int unitFemaleNum = genderParam.getUnitFemaleNum();
            int unitMaleNum = genderParam.getUnitMaleNum();

            requiredMaleAnimalNum = requiredMaleAnimalNum + (replicationRangeEnd - replicationRangeBegin + 1) * treatmentNum * unitMaleNum;
            requiredFemaleAnimalNum = requiredFemaleAnimalNum + (replicationRangeEnd - replicationRangeBegin + 1) * treatmentNum * unitFemaleNum;
        }
        requiredAnimalNum = requiredFemaleAnimalNum + requiredMaleAnimalNum;
        return getSuitableAnimals(animalList, requiredMaleAnimalNum, requiredFemaleAnimalNum, requiredAnimalNum, actualAnimalNum, actualMaleAnimalNum, actualFemaleAnimalNum);


    }


    private static void markIsSuitableField(List<Animal> animalList) {
        for (Animal animal : animalList) {
            animal.setSuitable(1);
        }
    }

    /**
     * 按照体重偏离中位数的程度进行排序
     * @param animalList
     */
    private static void sortedByWeightMedianDiff(List<Animal> animalList) {
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
    private static boolean checkCoefficientVariation(List<Animal> animalList, Integer unitNum, Double coefficientVariationAllowance) {

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
            //保存每个圈舍的平均体重
            for (int j = i*unitNum; j < (i+1)*unitNum; j++) {
                animalList.get(j).setWeightMean(averageValue);
            }
            averageList.add(averageValue);
        }

        //3.计算每个区组的变异系数
        Double coefficientVariation = MathUtil.computeCoefficientVariation(averageList);
        //保存变异系数
        for (Animal animal : animalList) {
            animal.setCoefficientOfVariation(coefficientVariation);
        }
        if (coefficientVariation < coefficientVariationAllowance) {
            return true;
        }

        return false;
    }
}
