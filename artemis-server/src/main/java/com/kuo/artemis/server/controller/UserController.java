package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.common.AuthorityType;
import com.kuo.artemis.server.core.dto.LoginCommend;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.User;
import com.kuo.artemis.server.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/10/26
 */
@Controller
@RequestMapping(value = "/api/user", produces = {"application/json;charset=utf8"})
public class UserController {


    @Inject
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody()
    public Response login(@RequestBody LoginCommend loginCommend) {
        return userService.login(loginCommend);
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Response register(@RequestBody User user) {
        return userService.register(user);
    }

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    @ResponseBody
    public Response getUserByPhone(String phone) {
        return userService.getUserByPhone(phone);
    }

    @RequestMapping(value = "/unique", method = RequestMethod.GET)
    @ResponseBody
    public Response checkUser(String phone) {
        return userService.checkUser(phone);
    }


    @Authority(value = AuthorityType.Authority)
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    @ResponseBody()
    public Response test() {
        User user = new User();
        user.setUserPhone("1111111");
        user.setUserName("哈哈哈");
        Response response = new Response();
        response.setData(user);
        return response;
    }

}
