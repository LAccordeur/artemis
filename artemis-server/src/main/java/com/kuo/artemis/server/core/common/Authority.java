package com.kuo.artemis.server.core.common;


import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface Authority {
    //默认不验证
    AuthorityType value() default AuthorityType.NoAuthority;
}
