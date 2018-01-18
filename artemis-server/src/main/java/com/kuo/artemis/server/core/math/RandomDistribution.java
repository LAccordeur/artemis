package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.core.dto.animal.RandomDistributionParam;
import com.kuo.artemis.server.core.dto.animal.RandomDistributionResult;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * @Author : guoyang
 * @Description : 圈舍的随机规划
 * @Date : Created on 2018/1/17
 */
public class RandomDistribution {


    /**
     * 圈舍规划
     * @param param
     * @return
     */
    public static RandomDistributionResult randomUnitDistribution(RandomDistributionParam param) {

        int replicationNum = param.getReplicationNum();
        int treatmentNum = param.getTreatmentNum();
        RandomDistributionResult result = new RandomDistributionResult();

        List<List> randomResult = new ArrayList<List>();
        for (int i = 0; i < replicationNum; i++) {
            List replicationResult = new ArrayList();
            for (int j = 0; j < treatmentNum; j++) {
                replicationResult.add(j+1);
            }
            Collections.shuffle(replicationResult, new Random(System.currentTimeMillis()+i));
            randomResult.add(replicationResult);
        }

        result.setRandomResult(randomResult);
        result.setParam(param);
        return result;
    }
}
