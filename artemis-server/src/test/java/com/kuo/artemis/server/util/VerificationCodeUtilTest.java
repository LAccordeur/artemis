package com.kuo.artemis.server.util;

import org.junit.Test;

import static org.junit.Assert.*;

public class VerificationCodeUtilTest {
    @Test
    public void randomNumericalCode() throws Exception {

        for (int i = 0; i < 1000; i++) {
            System.out.println(VerificationCodeUtil.randomNumericalCode());
        }

    }
}