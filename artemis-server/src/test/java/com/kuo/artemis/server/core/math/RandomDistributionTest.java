package com.kuo.artemis.server.core.math;

import com.kuo.artemis.server.core.dto.animal.RandomDistributionParam;
import org.junit.Test;

import static org.junit.Assert.*;

public class RandomDistributionTest {
    @Test
    public void randomUnitDistribution() throws Exception {
        RandomDistributionParam param = new RandomDistributionParam();
        param.setReplicationNum(4);
        param.setTreatmentNum(5);

        System.out.println(RandomDistribution.randomUnitDistribution(param));

    }

}