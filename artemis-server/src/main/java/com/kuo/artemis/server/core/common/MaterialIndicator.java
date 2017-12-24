package com.kuo.artemis.server.core.common;


import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
@Documented
public @interface MaterialIndicator {
    String name();

    boolean isIndicator() default true;  //用于线性规划中获取指标字段的值

    boolean isIdentity() default true;  //用于equal比较
}
