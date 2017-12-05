package com.kuo.artemis.server.core.common;


import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface Authority {
    //默认验证
    AuthorityType option() default AuthorityType.Authority;

    String value() default "0";


}
