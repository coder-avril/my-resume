package com.lding.resume.config;

import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean result = true;
        // 获取IP地址之后的URL部分（contextPath～）
        String url = request.getRequestURI();
        if (url.contains("admin")) {
            if (request.getSession().getAttribute("user") == null) {
                // 没登录成功过 跳转到登录页面
                response.sendRedirect(request.getContextPath());
                // 拦截 阻止后续当前请求后续方法被调用
                result = false;
            }
        }
        return result;
    }
}
