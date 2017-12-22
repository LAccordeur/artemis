package com.kuo.artemis.server.core.common;


import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
@Documented
public @interface NutritionIndicator {

    String name();
}
