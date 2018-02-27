package com.kuo.artemis.server.util;

import com.kuo.artemis.server.core.factory.DecimalFormatFactory;
import org.apache.commons.math3.stat.descriptive.moment.StandardDeviation;

import java.text.DecimalFormat;
import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/1/10
 */
public class MathUtil {

    /**
     * 求平均数
     * @param data
     * @return
     */
    public static double computeAverage(List<Double> data) {
        double result = 0D;

        //求和
        for (int i = 0; i < data.size(); i++) {
            result = result + data.get(i);
        }
        //求均值
        result = result / data.size();

        //DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();
        //String formatString = decimalFormat.format(result);
        return result;

    }

    public static Double setFiveScale(Double value) {
        DecimalFormat decimalFormat = DecimalFormatFactory.getDecimalFormatInstance();
        return Double.valueOf(decimalFormat.format(value));
    }

    /**
     * 计算样本标准差
     * @param data
     * @return
     */
    public static double computeStandardDeviation(List<Double> data) {
        double result = 0;

        //获取平均数
        double averageNumber = computeAverage(data);
        for (int i = 0; i < data.size(); i++) {
            double value = data.get(i);
            result = result + (value - averageNumber) * (value - averageNumber);
        }

        result = result / (data.size() - 1);

        return Math.sqrt(result);
    }

    private static double computeCoefficientVariation(Double standardDeviation, Double average) {
        return standardDeviation / average * 100;
    }

    /**
     * 计算变异系数
     * @param data
     * @return
     */
    public static double computeCoefficientVariation(List<Double> data) {
        double standardDeviation = computeStandardDeviation(data);
        double average = computeAverage(data);
        return computeCoefficientVariation(standardDeviation, average);
    }


    /**
     * 计算离均差平方和
     * @param data
     * @return
     */
    public static double computerSS(List<Double> data) {
        double result = 0D;

        double averageNum = computeAverage(data);

        for (int i = 0; i < data.size(); i++) {
            double value = data.get(i);
            result = result + (value - averageNum) * (value - averageNum);
        }

        return result;
    }


    /**
     * 定义参见wiki https://zh.wikipedia.org/wiki/%E6%A0%87%E5%87%86%E8%AF%AF
     * @param data
     * @return
     */
    public static double calculateStandardError(List<Double> data) {
        double result = 0D;

        StandardDeviation standardDeviation = new StandardDeviation();
        double standardDeviationValue = standardDeviation.evaluate(listToArray(data));
        result = standardDeviationValue / Math.sqrt(data.size());

        return result;
    }

    private static double[] listToArray(List<Double> doubleList) {
        int length = doubleList.size();
        double[] result = new double[length];

        for (int i = 0; i < length; i++) {
            result[i] = doubleList.get(i);
        }


        return result;
    }
}
