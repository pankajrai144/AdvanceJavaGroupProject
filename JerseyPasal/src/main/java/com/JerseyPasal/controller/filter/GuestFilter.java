package com.JerseyPasal.controller.filter;

import java.io.IOException;

import com.JerseyPasal.controller.model.UserModel;
import com.JerseyPasal.controller.utils.SessionUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class GuestFilter
 */
@WebFilter(urlPatterns = { "/login", "/register" })
public class GuestFilter extends HttpFilter implements Filter {

    private static final long serialVersionUID = 1L;

    public GuestFilter() {
        super();
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        httpResponse.setHeader("Pragma", "no-cache");
        httpResponse.setDateHeader("Expires", 0);

        Object loggedInUserObj = SessionUtil.getAttribute(httpRequest, "loggedInUser");

        if (loggedInUserObj != null) {

            UserModel loggedInUser = (UserModel) loggedInUserObj;
            String role = loggedInUser.getRole();

            if ("admin".equalsIgnoreCase(role)) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/admindashboard");
                return;
            }

            if ("user".equalsIgnoreCase(role)) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/userdashboard");
                return;
            }

            HttpSession session = httpRequest.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }
}