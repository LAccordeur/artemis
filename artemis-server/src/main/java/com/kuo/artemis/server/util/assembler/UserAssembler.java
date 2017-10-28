package com.kuo.artemis.server.util.assembler;

import com.kuo.artemis.server.core.dto.LoginCommend;
import com.kuo.artemis.server.entity.User;
import com.kuo.artemis.server.util.common.StringUtil;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/10/26
 */
public final class UserAssembler {

    /**
     * 将登录命令中的属性拷贝至User对象中
     * @param loginCommend
     * @return
     */
    public static User toUser(LoginCommend loginCommend) {
        User user = new User();

        if (loginCommend != null && StringUtil.isNotEmpty(loginCommend.getPassword()) && StringUtil.isNotEmpty(loginCommend.getPhone())) {
            user.setUserPhone(loginCommend.getPhone());
            user.setUserPassword(loginCommend.getPassword());
        }
        return user;
    }
}
