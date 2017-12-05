package com.kuo.artemis.server.core.Interceptor;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.common.AuthorityType;
import com.kuo.artemis.server.dao.UserPermissionMapper;
import com.kuo.artemis.server.entity.UserPermission;
import com.kuo.artemis.server.util.common.PropertiesHandler;
import com.kuo.artemis.server.util.common.PropsUtil;
import net.minidev.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

/**
 * @Author : guoyang
 * @Description : 用于权限验证
 * @Date : Created on 2017/10/29
 */
public class SecurityInterceptor extends HandlerInterceptorAdapter {

    protected static Logger logger = LoggerFactory.getLogger(SecurityInterceptor.class);

    private static boolean IS_OPEN_PERMISSION_AUTH_TOKEN = PropsUtil.getBoolean("IS_OPEN_PERMISSION_AUTH_TOKEN");

    private static final String AUTH_PARAM_USER_ID = "userId";

    private static final String AUTH_PARAM_PROJECT_ID = "projectId";

    @Inject
    private UserPermissionMapper userPermissionMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        logger.info("----------------------权限验证------------------------");
        if (IS_OPEN_PERMISSION_AUTH_TOKEN) {

            if (handler instanceof HandlerMethod) {

                HandlerMethod handlerMethod = (HandlerMethod) handler;
                //拦截有权限注解的方法
                Method method = handlerMethod.getMethod();
                Authority annotation = method.getAnnotation(Authority.class);

                if (annotation != null && (annotation.option()).equals(AuthorityType.Authority)) {
                    //该方法需要验证权限
                    //1.获取用户id和课题id来查询该用户的权限列表
                    String userId = request.getParameter(AUTH_PARAM_USER_ID);
                    String projectId = request.getParameter(AUTH_PARAM_PROJECT_ID);

                    //2.从注解中获取需要验证的权限名id
                    String permissionId = annotation.value();

                    //3.验证
                    if (userId != null && projectId != null && permissionId != null) {
                        //有权限
                        if (userPermissionMapper.selectByUserIdAndProjectIdAndPermissionId(Integer.valueOf(userId), Integer.valueOf(projectId), Integer.valueOf(permissionId)) != null) {
                            return true;
                        }

                        //没有权限
                        logger.info("------------权限不足--------------");
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("code", HttpStatus.UNAUTHORIZED.value());
                        jsonObject.put("msg", "权限不足");
                        output(jsonObject.toJSONString(), response);
                        return false;

                    } else {
                        logger.info("------------缺少参数--------------");
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("code", HttpStatus.NOT_FOUND.value());
                        jsonObject.put("msg", "缺少参数");
                        output(jsonObject.toJSONString(), response);
                        return false;
                    }


                }
            }
        }
        logger.info("---------------------------权限验证--------------------------");


        return true;
    }


    public void output(String jsonStr, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8;");
        response.setCharacterEncoding("UTF-8");
        ServletOutputStream out = response.getOutputStream();
        out.write(jsonStr.getBytes("UTF-8"));
        out.flush();
        out.close();
        //response.reset();
    }
}
