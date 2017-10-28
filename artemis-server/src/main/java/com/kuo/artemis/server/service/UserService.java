package com.kuo.artemis.server.service;

import com.kuo.artemis.server.core.dto.LoginCommend;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.User;

public interface UserService {

    Response login(LoginCommend loginCommend);

    Response register(User user);

    Response getUserByPhone(String phone);

    Response checkUser(String phone);
}
