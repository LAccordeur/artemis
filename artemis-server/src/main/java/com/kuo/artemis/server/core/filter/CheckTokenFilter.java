package com.kuo.artemis.server.core.filter;

import com.kuo.artemis.server.core.jwt.JwtHelper;
import com.kuo.artemis.server.core.jwt.TokenState;
import net.minidev.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * @Author : guoyang
 * @Description :通过token验证用户是否有合法身份
 * @Date : Created on 2017/10/28
 */
@Component
public class CheckTokenFilter implements Filter {

    protected static Logger logger = LoggerFactory.getLogger(CheckTokenFilter.class);

    //不进行Token认证的url
    private static String[] excludeUrls = new String[]{};

    public void init(FilterConfig filterConfig) throws ServletException {
        String excludeUrl = filterConfig.getInitParameter("excludeUrl"); //获得配置文件中的excludeUrl
        this.excludeUrls = excludeUrl.split(",");
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        //不需要验证的url直接放行
        for (int i = 0; i < excludeUrls.length; i++) {
            if (request.getRequestURI().endsWith(excludeUrls[i])) {
                filterChain.doFilter(request, response);
                return;
            }
        }

        //token is stored in the Header
        String token = request.getHeader("Authorization");

        //token不存在则说明用户未登录或者用户身份非法
        if (token == null) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", HttpStatus.UNAUTHORIZED.value());
            jsonObject.put("msg", "访问非法");
            output(jsonObject.toJSONString(), response);

        } else {
            //token存在则验证token是否合法
            Map<String, Object> resultMap = JwtHelper.validToken(token);
            String state = (String) resultMap.get("state");

            if ((TokenState.VALID.toString()).equals(state)) {
                //token有效
                filterChain.doFilter(request, response);
            } else if ((TokenState.EXPIRED.toString()).equals(state)) {
                //token过期
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("code", HttpStatus.UNAUTHORIZED.value());
                jsonObject.put("msg", "token已过期，请重新登录");
                output(jsonObject.toJSONString(), response);

            } else if ((TokenState.INVALID.toString()).equals(state)) {
                //token无效
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("code", HttpStatus.UNAUTHORIZED.value());
                jsonObject.put("msg", "token无效");
                output(jsonObject.toJSONString(), response);

            }

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
