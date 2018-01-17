package com.kuo.artemis.server.util;

import com.kuo.artemis.server.core.factory.DecimalFormatFactory;

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
}
