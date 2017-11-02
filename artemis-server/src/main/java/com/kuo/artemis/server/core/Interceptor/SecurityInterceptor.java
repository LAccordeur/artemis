package com.kuo.artemis.server.core.Interceptor;

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.common.AuthorityType;
import com.kuo.artemis.server.dao.UserPermissionMapper;
import com.kuo.artemis.server.entity.UserPermission;
import net.minidev.json.JSONObject;
import org.springframework.http.HttpStatus;
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

    @Inject
    private UserPermissionMapper userPermissionMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String requestUrl = request.getRequestURI();
        String requestMethod = request.getMethod();

        if (handler instanceof HandlerMethod) {

            HandlerMethod handlerMethod = (HandlerMethod) handler;
            //拦截有权限注解的方法
            Method method = handlerMethod.getMethod();
            Authority annotation = method.getAnnotation(Authority.class);
            if (annotation != null && (annotation.value()).equals(AuthorityType.Authority)) {
                //该方法需要验证权限
                //1.获取用户id和课题id来查询该用户的权限列表
                String userId = request.getParameter("userId");
                String projectId = request.getParameter("projectId");
                List<UserPermission> userPermissions = null;

                if (userId != null && projectId != null) {
                    userPermissions = userPermissionMapper.selectByUserIdAndProjectId(Integer.valueOf(userId), Integer.valueOf(projectId));
                    //2.验证该用户是否拥有权限
                    for (UserPermission userPermission : userPermissions) {
                        if (requestUrl.endsWith(userPermission.getPermissionUrl()) && (requestMethod.toUpperCase()).equals(userPermission.getPermissionType().toUpperCase())) {
                            //拥有权限，则放行
                            return true;
                        }
                    }

                    //没有权限
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("code", HttpStatus.UNAUTHORIZED.value());
                    jsonObject.put("msg", "权限不足");
                    output(jsonObject.toJSONString(), response);
                    return false;

                } else {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("code", HttpStatus.NO_CONTENT.value());
                    jsonObject.put("msg", "缺少参数");
                    output(jsonObject.toJSONString(), response);
                    return false;
                }


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
        //response.reset();
    }
}
