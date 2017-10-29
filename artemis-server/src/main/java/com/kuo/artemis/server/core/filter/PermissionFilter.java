package com.kuo.artemis.server.core.filter;

import com.kuo.artemis.server.dao.UserPermissionMapper;
import com.kuo.artemis.server.entity.UserPermission;
import net.minidev.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author : guoyang
 * @Description : 用于验证用户是否拥有权限（暂未使用而改用拦截器实现权限管理）
 * @Date : Created on 2017/10/29
 */
@Component
public class PermissionFilter implements Filter {

    @Inject
    private UserPermissionMapper userPermissionMapper;

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String requestUrl = request.getRequestURI();
        String userId = request.getParameter("userId");
        String projectId = request.getParameter("projectId");
        String requestMethod = request.getMethod();

        if (requestUrl.endsWith("/data")) {
            if (userId != null && projectId != null) {
                List<UserPermission> userPermissions = userPermissionMapper.selectByUserIdAndProjectId(userId, projectId);

                if (userPermissions != null) {
                    for (UserPermission permission : userPermissions) {
                        if (requestUrl.endsWith(permission.getPermissionUrl()) && (requestMethod.toUpperCase()).equals(permission.getPermissionType().toUpperCase())) {
                            filterChain.doFilter(request, response);
                            return;
                        } else {
                            JSONObject jsonObject = new JSONObject();
                            jsonObject.put("code", HttpStatus.UNAUTHORIZED.value());
                            jsonObject.put("msg", "权限不足");
                            output(jsonObject.toJSONString(), response);
                        }
                    }
                } else {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("code", HttpStatus.UNAUTHORIZED.value());
                    jsonObject.put("msg", "权限不足");
                    output(jsonObject.toJSONString(), response);
                }

            } else {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("code", HttpStatus.UNAUTHORIZED.value());
                jsonObject.put("msg", "缺少参数");
                output(jsonObject.toJSONString(), response);
            }
        } else {
            filterChain.doFilter(request, response);
        }



    }

    public void destroy() {

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
