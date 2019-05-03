package com.lin.ssm.common.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 拦截器
 * @author 林
 */
public class AuthInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取session
        HttpSession session = request.getSession();
        // 判断是否有user属性
        final String name = "user";
        // 获取上下文路径
        String context = request.getServletContext().getContextPath();

        // 判断session是否有name值
        if (session.getAttribute(name) == null) {
            response.sendRedirect(context + "/login");
            return false;
        }
        return true;
    }
}
