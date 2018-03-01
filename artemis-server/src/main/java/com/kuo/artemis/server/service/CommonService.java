package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.Response;

public interface CommonService {

    /**
     * 发送手机验证码
     * @param phone
     * @return
     */
    Response sendSmsCode(String phone);
}
