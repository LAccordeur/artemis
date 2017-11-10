package com.kuo.artemis.server.core.Interceptor;

import com.kuo.artemis.server.dao.UserMapper;
import com.kuo.artemis.server.entity.User;
import com.kuo.artemis.server.util.common.PropertiesHandler;
import com.kuo.artemis.server.util.common.PropsUtil;
import net.minidev.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author : guoyang
 * @Description :用于验证用户是否已认证身份
 * @Date : Created on 2017/11/8
 */
public class IdentityAuthenticationInterceptor extends HandlerInterceptorAdapter {

    protected static Logger logger = LoggerFactory.getLogger(IdentityAuthenticationInterceptor.class);

    private static boolean IS_OPEN_IDENTITY_AUTH_TOKEN = PropsUtil.getBoolean("IS_OPEN_IDENTITY_AUTH_TOKEN");

    private final String AUTH_PARAM_USER_ID = "userId";

    @Inject
    private UserMapper userMapper;



    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        if (IS_OPEN_IDENTITY_AUTH_TOKEN) {
            User user = null;
            String userId = request.getParameter(AUTH_PARAM_USER_ID);
            if (userId != null) {
                user = userMapper.selectById(Integer.valueOf(userId));

                //判断用户的认证状态
                if (user.getStatus() == 1) {
                    return true;
                } else {
                    logger.info("------------未认证--------------");
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("code", HttpStatus.NOT_FOUND.value());
                    jsonObject.put("msg", "未认证");
                    output(jsonObject.toJSONString(), response);
                    return false;
                }
            } else {
                logger.info("------------缺少用户id--------------");
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("code", HttpStatus.NOT_FOUND.value());
                jsonObject.put("msg", "缺少参数");
                output(jsonObject.toJSONString(), response);
                return false;
            }

        }

        return true;
    }

    public void output(String jsonStr, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8;");
        response.setCharacterEncoding("UTF-8");
        ServletOutputStream out = response.getOutputStream();
        out.write(jsonStr.getBytes("UTF-8"));
        out.flush();
        out.close();

    }
}
