package com.groupcoursework.filter;

import java.io.IOException;

import com.groupcoursework.utils.SessionUtil;

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

/**
 * Servlet Filter implementation class GuestFilter
 */
@WebFilter(urlPatterns = { "/login", "/register" })
public class GuestFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;

	public GuestFilter() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		Object userEmail = SessionUtil.getAttribute(httpRequest, "userEmail");
		Object userRole = SessionUtil.getAttribute(httpRequest, "userRole");

		boolean isLoggedIn = userEmail != null;

		if (isLoggedIn) {
			if ("admin".equalsIgnoreCase(String.valueOf(userRole))) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/admindashboard");
			} else {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/userdashboard");
			}
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}