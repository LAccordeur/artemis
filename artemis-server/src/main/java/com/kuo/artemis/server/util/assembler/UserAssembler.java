package com.kuo.artemis.server.util.assembler;

import com.kuo.artemis.server.core.dto.command.LoginCommend;
import com.kuo.artemis.server.core.dto.UserDTO;
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

    public static User UserDTOToUser(UserDTO userDTO) {
        User user = new User();

        if (userDTO != null ) {
            if (userDTO.getId() != null) {
                user.setId(Integer.parseInt(userDTO.getId()));
            }
            user.setUserName(userDTO.getUserName());
            user.setUniversity(userDTO.getUniversity());
            if (userDTO.getUserGender() != null) {
                user.setUserGender(Byte.valueOf(userDTO.getUserGender()));
            }
            user.setUserEmail(userDTO.getUserEmail());
            if (userDTO.getUserIdentity() != null) {
                user.setUserIdentity(Byte.valueOf(userDTO.getUserIdentity()));
            }
        }

        return user;
    }
}
