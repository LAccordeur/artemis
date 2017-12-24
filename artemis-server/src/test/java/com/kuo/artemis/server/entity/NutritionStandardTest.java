package com.kuo.artemis.server.entity;

import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class NutritionStandardTest {
    @Test
    public void hashCodeTest() throws Exception {
    }

    @Test
    public void equalsTest() throws Exception {
        NutritionStandard nutritionStandard = new NutritionStandard();
        nutritionStandard.setCalcium(new BigDecimal("4"));
        //nutritionStandard.setArginine(new BigDecimal("3"));
        NutritionStandard nutritionStandard1 = new NutritionStandard();
        nutritionStandard1.setCalcium(new BigDecimal("4"));

        System.out.println(nutritionStandard.hashCode());
        System.out.println(nutritionStandard1.hashCode());
        System.out.println(nutritionStandard1.equals(nutritionStandard));
    }

}