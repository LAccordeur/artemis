package com.kuo.artemis.server.core.jwt;

import org.junit.Test;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

public class JwtHelperTest {


    @Test
    public void createToken() throws Exception {

        Map<String, Object> payload = new HashMap<String, Object>();
        payload.put("uid", "123456");
        Date date = new Date();
        payload.put("ctm", date.getTime());
        payload.put("ext", date.getTime() + 1000);

        String token = JwtHelper.createToken(payload);
        System.out.println(token);

    }

    @Test
    public void validToken() throws Exception {

        Map<String, Object> result;
        Map<String, Object> payload = new HashMap<String, Object>();
        payload.put("uid", "123456");
        Date date = new Date();
        payload.put("ctm", date.getTime());
        payload.put("ext", date.getTime() + 1000 * 10);

        String token = JwtHelper.createToken(payload);
        System.out.println(token);


        result = JwtHelper.validToken(token);
        System.out.println(result.get("state"));
        System.out.println(result.get("data"));
        //System.out.println(result.get("ext"));

    }

}