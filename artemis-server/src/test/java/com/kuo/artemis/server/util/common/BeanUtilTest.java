package com.kuo.artemis.server.util.common;

import com.kuo.artemis.server.entity.Animal;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class BeanUtilTest {
    @Test
    public void spaceFieldToCamel() throws Exception {

        System.out.println(BeanUtil.spaceFieldToCamel("E.Col"));
    }

    @Test
    public void spaceFieldToUnderline() throws Exception {

        System.out.println(BeanUtil.spaceFieldToUnderline("  Fdasfdf32   "));

        Object i = 9;
        boolean b;
        if (i instanceof Integer) {
            b = true;
        } else {
            b = false;
        }
        System.out.println(b);
    }

    @Test
    public void beanToMap() throws Exception {

        Animal animal = new Animal();
        animal.setAnimalInitWeight(new BigDecimal(32));
        System.out.println(BeanUtil.beanToMap(animal));
    }

}