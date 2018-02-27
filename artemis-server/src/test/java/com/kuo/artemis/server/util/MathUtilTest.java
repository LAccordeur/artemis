package com.kuo.artemis.server.util;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class MathUtilTest {
    @Test
    public void calculateStandardError() throws Exception {
        List<Double> doubles = new ArrayList<Double>();
        doubles.add(10.96);
        doubles.add(10.43);
        doubles.add(10.00);
        doubles.add(9.72);
        doubles.add(9.27);

        System.out.println(MathUtil.calculateStandardError(doubles));
    }

    @Test
    public void computerSS() throws Exception {

        List<Double> doubles = new ArrayList<Double>();
        doubles.add(10.96);
        doubles.add(10.43);
        doubles.add(10.00);
        doubles.add(9.72);
        doubles.add(9.27);

        System.out.println(MathUtil.computerSS(doubles) * 4);
    }

    @Test
    public void computeCoefficientVariation() throws Exception {
        List<Double> data = Arrays.asList(10.61, 10.92, 10.69, 10.81);
        System.out.println(MathUtil.computeCoefficientVariation(data));

    }

    @Test
    public void average() throws Exception {

        List<Double> data = Arrays.asList(33.3,22.4,22.5);
        System.out.println(MathUtil.computeAverage(data));

    }

}