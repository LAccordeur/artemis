package com.kuo.artemis.server.util;

import com.datumbox.common.dataobjects.AssociativeArray2D;
import org.junit.Test;

import java.util.*;

public class StatisticsUtilTest {
    @Test
    public void calculateReplicationNum() throws Exception {

        //System.out.println(StatisticsUtil.calculateReplicationNum(0.05, 3, 3640.0, 296.67, 0.8));

        List<List<Double>> dataList = new ArrayList<List<Double>>();
        List<Double> data1 = Arrays.asList(new Double[]{270D, 300D, 280D, 280D, 270D});
        List<Double> data2 = Arrays.asList(new Double[]{290D, 250D, 280D, 290D, 280D});
        List<Double> data3 = Arrays.asList(new Double[]{290D, 340D, 330D, 300D, 300D});
        dataList.add(data1);
        dataList.add(data2);
        dataList.add(data3);

        System.out.println(StatisticsUtil.calculateReplicationNum(0.05, 0.8, dataList));
    }

    @Test
    public void twoWayAnalysisOfVariance() throws Exception {

        Map<String, Map<String, List<Object>>> dataMap = new HashMap<String, Map<String, List<Object>>>();

        Map<String, List<Object>> factorAMap = new HashMap<String, List<Object>>();
        factorAMap.put("1", Arrays.asList(new Object[]{1,2,3,4}));
        factorAMap.put("2", Arrays.asList(new Object[]{2,3,4,5}));
        dataMap.put("A", factorAMap);

        Map<String, List<Object>> factorBMap = new HashMap<String, List<Object>>();
        factorBMap.put("1", Arrays.asList(new Object[]{1,2,3,4}));
        factorBMap.put("2", Arrays.asList(new Object[]{1,3,4,5}));
        dataMap.put("B", factorBMap);

        AssociativeArray2D outputTable = StatisticsUtil.twoWayAnalysisOfVariance(dataMap);
        System.out.println(outputTable.get2d("AFactor", "p"));

    }

    @Test
    public void factorAnalysisOfVariance() throws Exception {
        List<Double> sample1 = new ArrayList<Double>();
        sample1.add(8D);
        sample1.add(16D);
        sample1.add(12D);
        //sample1.add(17D);

        List<Double> sample2 = new ArrayList<Double>();
        sample2.add(8D);
        sample2.add(16D);
        sample2.add(12D);
        sample2.add(14D);

        List<List<Double>> sampleList = new ArrayList<List<Double>>();
        sampleList.add(sample1);
        sampleList.add(sample2);

        Double pValue = StatisticsUtil.oneWayAnalysisOfVariance(sampleList);
        System.out.println(pValue);

    }

    @Test
    public void independentSampleTTest() throws Exception {

        List<Double> sample1 = new ArrayList<Double>();
        sample1.add(8D);
        //sample1.add(16D);
        //sample1.add(12D);
        //sample1.add(17D);

        List<Double> sample2 = new ArrayList<Double>();
        sample2.add(8D);
        //sample2.add(16D);
        //sample2.add(12D);
        //sample2.add(17D);

        Double pValue = StatisticsUtil.independentSampleTTest(sample1, sample2);
        System.out.println(pValue);
    }

}