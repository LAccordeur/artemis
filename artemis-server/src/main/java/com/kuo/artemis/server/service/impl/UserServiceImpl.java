package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.core.dto.UserDTO;
import com.kuo.artemis.server.core.dto.command.LoginCommend;
import com.kuo.artemis.server.core.jwt.JwtHelper;
import com.kuo.artemis.server.dao.UserMapper;
import com.kuo.artemis.server.entity.User;
import com.kuo.artemis.server.service.UserService;
import com.kuo.artemis.server.util.ValidationUtil;
import com.kuo.artemis.server.util.assembler.UserAssembler;
import com.kuo.artemis.server.util.security.CodecUtil;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {


    @Inject
    private UserMapper userMapper;

    /**
     * 登录
     *
     * @param loginCommend
     * @return
     */
    public Response login(LoginCommend loginCommend) {

        Response response = new Response();


        ValidationUtil.getInstance().validateParams(loginCommend);
        User user = UserAssembler.toUser(loginCommend);
        if (userMapper.selectByPhone(user.getUserPhone()) == null) {
            //1.账号不存在
            response.setCode(HttpStatus.NOT_FOUND.value());
            response.setMsg("账号不存在");
            response.setData(null);
            return response;

        } else {
            //2.账号存在
            String encryptPassword = CodecUtil.encryptWithSHA256(user.getUserPassword() + user.getUserPhone());
            user.setUserPassword(encryptPassword);
            User userResult = userMapper.selectByEntity(user);
            if (userResult == null) {
                //账号密码不匹配
                response.setCode(HttpStatus.FORBIDDEN.value());
                response.setMsg("账号和密码不匹配");
                response.setData(null);
            } else {
                //账号密码正确
                response.setCode(HttpStatus.OK.value());
                response.setMsg("登录成功");

                //生成token，用以后续验证登录状态
                String token = getToken(userResult);
                Map<String, Object> result = new HashMap<String, Object>(2);
                result.put("token", token);
                result.put("user", userResult);

                response.setData(result);

            }

        }


        return response;
    }


    /**
     * 注册
     *
     * @param user
     * @return
     */
    public Response register(User user) {

        Response response = new Response();

        String encryptPassword = CodecUtil.encryptWithSHA256(user.getUserPassword() + user.getUserPhone());
        user.setUserPassword(encryptPassword);


        if (userMapper.insertSelective(user) > 0) {
            response.setCode(HttpStatus.OK.value());
            response.setMsg("注册成功");
        } else {
            response.setCode(HttpStatus.NOT_FOUND.value());
            response.setMsg("注册失败");
        }

        return response;
    }

    /**
     * 通过手机号获取用户的详细信息
     *
     * @param phone
     * @return
     */
    public Response getUserByPhone(String phone) {
        Response response = new Response();


        User user = userMapper.selectByPhone(phone);
        if (user != null) {
            response.setCode(HttpStatus.OK.value());
            response.setMsg("查询用户存在");
            response.setData(user);
        } else {
            response.setCode(HttpStatus.NOT_FOUND.value());
            response.setMsg("用户不存在");
            response.setData(null);
        }


        return response;
    }


    /**
     * 查看手机号是否被注册
     *
     * @param phone
     * @return
     */
    public Response checkUser(String phone) {
        Response response = new Response(HttpStatus.UNAUTHORIZED.value(), "查询用户失败");


        User user = userMapper.selectByPhone(phone);
        if (user != null) {
            response.setCode(HttpStatus.CONFLICT.value());
            response.setMsg("该手机号已被注册");

        } else {
            response.setCode(HttpStatus.OK.value());
            response.setMsg("该手机号可以注册");

        }

        response.setData(null);
        return response;
    }


    /**
     * 通过用户id查询用户信息
     *
     * @param id
     * @return
     */
    public Response getUserById(String id) {
        Response response = new Response();


        User user = null;
        if (id != null) {
            user = userMapper.selectById(Integer.valueOf(id));
        }
        if (user != null) {
            response.setCode(HttpStatus.OK.value());
            response.setMsg("用户存在");
            response.setData(user);
        } else {
            response.setCode(HttpStatus.NOT_FOUND.value());
            response.setMsg("用户不存在");
            response.setData(null);
        }


        return response;
    }

    /**
     * 更新用户信息
     *
     * @param user
     * @return
     */
    public Response updateUserInfo(UserDTO user) {
        Response response = new Response();


        int result = userMapper.updateByPrimaryKeySelective(UserAssembler.UserDTOToUser(user));
        if (result > 0) {
            return new Response(HttpStatus.OK.value(), "更新成功");
        } else {
            return new Response(HttpStatus.FORBIDDEN.value(), "更新失败");
        }


    }

    private String getToken(User user) {
        Map<String, Object> payload = new HashMap<String, Object>();
        Date date = new Date();
        payload.put("uid", user.getId()); //用户ID
        payload.put("iat", date.getTime()); //生成时间
        payload.put("ext", date.getTime() + 1000 * 60 * 60); //过期时间1小时
        String token = JwtHelper.createToken(payload);

        return token;
    }
}
