package com.kuo.artemis.server.util;

import JSci.maths.statistics.FDistribution;
/*import com.datumbox.common.dataobjects.AssociativeArray2D;
import com.datumbox.common.dataobjects.FlatDataCollection;
import com.datumbox.common.dataobjects.TransposeDataCollection;
import com.datumbox.common.dataobjects.TransposeDataCollection2D;
import com.datumbox.framework.statistics.anova.Anova;*/
import com.datumbox.framework.common.dataobjects.AssociativeArray2D;
import com.datumbox.framework.common.dataobjects.FlatDataCollection;
import com.datumbox.framework.common.dataobjects.TransposeDataCollection;
import com.datumbox.framework.common.dataobjects.TransposeDataCollection2D;
import com.datumbox.framework.core.statistics.anova.Anova;
import com.kuo.artemis.server.core.exception.MathException;
import jsc.distributions.NoncentralFishersF;
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
    public static Double independentSampleTTest(List<Double> sample1, List<Double> sample2) throws MathException {

        try {
            Double pValue = TestUtils.tTest(listToArray(sample1), listToArray(sample2));
            return pValue;
        } catch (Exception e) {
            e.printStackTrace();
            throw new MathException(e);
        }
    }

    /**
     * 单因素方差分析
     * @param dataList
     * @return 返回p值
     */
    public static Double oneWayAnalysisOfVariance(List<List<Double>> dataList) {

        try {
            List<double[]> sampleList = listListToArrayList(dataList);
            Double pValue = TestUtils.oneWayAnovaPValue(sampleList);
            return pValue;
        } catch (Exception e) {
            e.printStackTrace();
            throw new MathException(e);
        }
    }

    /**
     * 两因素方差分析
     * @param dataMap
     * @return 返回p值
     */
    public static AssociativeArray2D twoWayAnalysisOfVariance(Map<String, Map<String, List<Object>>> dataMap) {

        try {
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
        } catch (Exception e) {
            e.printStackTrace();
            throw new MathException(e);
        }

    }

    /**
     * 求平均数
     * @param data
     * @return
     */
    public static Double mean(List<Double> data)  {
        try {
            Double mean = MathUtil.computeAverage(data);
            return mean;
        } catch (Exception e) {
            e.printStackTrace();
            throw new MathException(e);
        }
    }

    /**
     * 标准误差
     * @param data
     * @return
     */
    public static Double standardError(List<Double> data) {
        try {
            return MathUtil.calculateStandardError(data);
        } catch (Exception e) {
            throw new MathException(e);
        }
    }


    /**
     * 计算重复数
     * @param alpha
     * @param treatmentNum
     * @param sst
     * @param mse
     * @param power
     * @return
     */
    private static Integer calculateReplicationNum(Double alpha, Integer treatmentNum, Double sst, Double mse, Double power) {

        boolean flag = false;
        Integer result = 0;
        for (int n = 2; n < 51; n++) {
            //double sstPE = sst / n;    //处理效应平方和
            int df1 = treatmentNum - 1;    //处理自由度
            int df2 = treatmentNum * n - treatmentNum;    //残差自由度

            double lambda = sst / mse;
            FDistribution fDistribution = new FDistribution(df1, df2);    //jsci库的F分布
            double fcrit = fDistribution.inverse(1 - alpha);

            NoncentralFishersF noncentralFishersF = new NoncentralFishersF(df1, df2, lambda);
            double rtPower = 1 - noncentralFishersF.cdf(fcrit);
            if (rtPower > power) {
                flag = true;
                result = n;
                break;
            }
        }

        if (flag) {
            return result;
        }

        return 0;
    }

    /**
     * 计算重复数
     * @param alpha
     * @param power
     * @param dataList
     * @return
     */
    public static Integer calculateReplicationNum(Double alpha, Double power, List<List<Double>> dataList) {
        try {
            int n = dataList.get(0).size();   //每个处理组内的个体数
            //int df1 = treatmentNum - 1;    //样本间的自由度
            Integer treatmentNum = dataList.size();
            int df2 = treatmentNum * (n - 1);    //样本内的自由度

            //计算每个处理组的平均数
            List<Double> treatmentMeanList = new ArrayList<Double>();
            for (int i = 0; i < dataList.size(); i++) {
                Double treatmentMean = MathUtil.computeAverage(dataList.get(i));
                treatmentMeanList.add(treatmentMean);
            }

            //计算处理间平方和
            Double sst = n * MathUtil.computerSS(treatmentMeanList);

            //计算处理内平方和
            Double sse = 0D;
            for (int i = 0; i < dataList.size(); i++) {
                Double treatmentSse = MathUtil.computerSS(dataList.get(i));
                sse = sse + treatmentSse;
            }
            //计算残差
            Double mse = sse / df2;

            return calculateReplicationNum(alpha, treatmentNum, sst, mse, power);
        } catch (Exception e) {
            e.printStackTrace();
            throw new MathException(e);
        }
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
