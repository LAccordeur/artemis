package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.dao.redis.CacheRedisDao;
import com.kuo.artemis.server.service.CommonService;
import com.kuo.artemis.server.util.VerificationCodeUtil;
import com.kuo.artemis.server.util.common.AccountValidatorUtil;
import org.springframework.http.HttpStatus;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2018/3/1
 */
public class CommonServiceImpl implements CommonService {

    @Inject
    private CacheRedisDao cacheRedisDao;

    public Response sendSmsCode(String phone) {

        if (phone == null || "".equals(phone)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "参数不能为空");
        }

        //对手机号进行正则判断
        if (!AccountValidatorUtil.isMobile(phone)) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "手机号格式非法");
        }

        //发送验证码
        String smsCode = VerificationCodeUtil.sendSmsCode(phone);
        if (smsCode != null) {
            //将验证码放入缓存
            cacheRedisDao.saveStringToCache(phone, smsCode);
            return new Response(smsCode, HttpStatus.OK.value(), "发送成功");
        } else {
            return new Response(HttpStatus.NO_CONTENT.value(), "发送失败");
        }

    }
}
