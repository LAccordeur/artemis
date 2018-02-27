package com.kuo.artemis.server.util;

import com.datumbox.common.dataobjects.AssociativeArray2D;
import com.datumbox.common.dataobjects.FlatDataCollection;
import com.datumbox.common.dataobjects.TransposeDataCollection;
import com.datumbox.common.dataobjects.TransposeDataCollection2D;
import com.datumbox.framework.statistics.anova.Anova;
import org.apache.commons.math3.stat.descriptive.moment.GeometricMean;
import org.apache.commons.math3.stat.inference.TestUtils;

import java.util.*;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/2/6
 */
public class StatisticsUtil {

    /**
     * 独立样本t检验
     * @param sample1
     * @param sample2
     * @return  返回p值
     */
    public static Double independentSampleTTest(List<Double> sample1, List<Double> sample2) {

        Double pValue = TestUtils.tTest(listToArray(sample1), listToArray(sample2));

        return pValue;
    }

    /**
     * 单因素方差分析
     * @param dataList
     * @return 返回p值
     */
    public static Double oneWayAnalysisOfVariance(List<List<Double>> dataList) {

        List<double[]> sampleList = listListToArrayList(dataList);
        Double pValue = TestUtils.oneWayAnovaPValue(sampleList);
        return pValue;
    }

    /**
     * 两因素方差分析
     * @param dataMap
     * @return 返回p值
     */
    public static AssociativeArray2D twoWayAnalysisOfVariance(Map<String, Map<String, List<Object>>> dataMap) {
        //Anova.twoWayTestEqualCellsEqualVars()
        TransposeDataCollection2D twoFactorDataCollection = new TransposeDataCollection2D();

        Set<String> factorAKeySet = dataMap.keySet();
        for (String factorAKey : factorAKeySet) {
            Map<String, List<Object>> factorBMap = dataMap.get(factorAKey);
            Set<String> factorBKeySet = factorBMap.keySet();

            TransposeDataCollection transposeDataCollection = new TransposeDataCollection();
            for (String factorBKey : factorBKeySet) {
                transposeDataCollection.put(factorBKey, new FlatDataCollection(factorBMap.get(factorBKey)));
            }

            twoFactorDataCollection.put(factorAKey, transposeDataCollection);
        }

        double aLevel = 0.05;
        AssociativeArray2D outputTable = new AssociativeArray2D();
        boolean result = Anova.twoWayTestEqualCellsEqualVars(twoFactorDataCollection, aLevel, outputTable);

        return outputTable;
    }

    /**
     * 求平均数
     * @param data
     * @return
     */
    public static Double mean(List<Double> data) {
        Double mean = MathUtil.computeAverage(data);
        return mean;
    }

    /**
     * 标准误差
     * @param data
     * @return
     */
    public static Double standardError(List<Double> data) {
        return MathUtil.calculateStandardError(data);
    }


    private static double[] listToArray(List<Double> doubleList) {
        int length = doubleList.size();
        double[] result = new double[length];

        for (int i = 0; i < length; i++) {
            result[i] = doubleList.get(i);
        }


        return result;
    }

    private static List<double[]> listListToArrayList(List<List<Double>> dataList) {
        List<double[]> resultList = new ArrayList<double[]>();

        for (int i = 0; i < dataList.size(); i++) {
            List<Double> data = dataList.get(i);
            double[] sample = new double[data.size()];
            for (int j = 0; j < data.size(); j++) {
                sample[j] = data.get(j);
            }
            resultList.add(sample);
        }

        return resultList;
    }
}
