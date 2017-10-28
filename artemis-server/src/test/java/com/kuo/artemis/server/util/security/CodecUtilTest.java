package com.kuo.artemis.server.util.security;

import org.junit.Test;

import static org.junit.Assert.*;

public class CodecUtilTest {
    @Test
    public void encryptWithSHA256() throws Exception {
        System.out.println(CodecUtil.encryptWithSHA256("123456" + "13813331870"));
    }

}