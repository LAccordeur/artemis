package com.kuo.artemis.server.util;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

public class MathUtilTest {
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