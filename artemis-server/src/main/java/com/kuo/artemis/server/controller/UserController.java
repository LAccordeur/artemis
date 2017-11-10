package com.kuo.artemis.server.controller;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.common.AuthorityType;
import com.kuo.artemis.server.core.dto.command.LoginCommend;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.UserDTO;
import com.kuo.artemis.server.entity.User;
import com.kuo.artemis.server.entity.UserProjectKey;
import com.kuo.artemis.server.service.UserInvitationApplicationService;
import com.kuo.artemis.server.service.UserProjectService;
import com.kuo.artemis.server.service.UserService;
import com.kuo.artemis.server.util.constant.PermissionConst;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @Inject
    private UserProjectService userProjectService;

    @Inject
    private UserInvitationApplicationService userInvitationApplicationService;


    /**
     * 登录
     * @param loginCommend
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody()
    public Response login(@RequestBody LoginCommend loginCommend) {
        return userService.login(loginCommend);
    }


    /**
     * 注册
     * @param user
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Response register(@RequestBody User user) {
        return userService.register(user);
    }


    /**
     * 通过id查询用户信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/{userId}/info", method = RequestMethod.GET)
    @ResponseBody
    public Response getUserById(@PathVariable("userId") String id) {
        return userService.getUserById(id);
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @RequestMapping(value = "/{userId}/info", method = RequestMethod.PUT)
    @ResponseBody
    public Response updateUserInfo(@RequestBody UserDTO user) {
        return userService.updateUserInfo(user);
    }


    /**
     * 检测账号是否已被注册
     * @param phone
     * @return
     */
    @RequestMapping(value = "/unique", method = RequestMethod.GET)
    @ResponseBody
    public Response checkUser(String phone) {
        return userService.checkUser(phone);
    }

    /**
     * 更改密码（未完成）
     * @return
     */
    @RequestMapping(value = "/{userId}/password", method = RequestMethod.PUT)
    @ResponseBody
    public Response changePassword() {
        return null;
    }


    /**
     * 忘记密码（未完成）
     * @return
     */
    @RequestMapping(value = "/{userId}/password", method = RequestMethod.POST)
    @ResponseBody
    public Response forgetPassword() {
        return null;
    }


    /**
     * 根据姓名关键词查询用户
     * @return
     */
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public Response searchUserByName(String keyword) {
        return null;
    }


    /**
     * 获取用户参与的课题
     * @param userId
     * @return
     */
    @RequestMapping(value = "/{userId}/project", method = RequestMethod.GET)
    @ResponseBody
    public Response listProjects(@PathVariable("userId") String userId) {
        return userProjectService.listProjectsByUserId(userId);
    }


    /**
     * 获取用户的课题邀请列表
     * @param userId
     * @return
     */
    @RequestMapping(value = "/{userId}/invitation", method = RequestMethod.GET)
    @ResponseBody
    public Response listInvitation(@PathVariable("userId") String userId) {
        return userInvitationApplicationService.listInvitation(userId);
    }



    @Authority(name = PermissionConst.ADD_DATA)
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
