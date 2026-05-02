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
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter(urlPatterns = { "/userdashboard", "/admindashboard", "/logout" })
public class AuthenticationFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;

	public AuthenticationFilter() {
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

		// Prevent browser from showing old dashboard page after logout
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		httpResponse.setHeader("Pragma", "no-cache");
		httpResponse.setDateHeader("Expires", 0);

		Object userEmail = SessionUtil.getAttribute(httpRequest, "userEmail");
		Object userRole = SessionUtil.getAttribute(httpRequest, "userRole");

		boolean isLoggedIn = userEmail != null;

		if (!isLoggedIn) {
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
			return;
		}

		String path = httpRequest.getServletPath();

		if (path.equals("/admindashboard")) {
			if ("admin".equalsIgnoreCase(String.valueOf(userRole))) {
				chain.doFilter(request, response);
			} else {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/userdashboard");
			}
			return;
		}

		if (path.equals("/userdashboard")) {
			if ("member".equalsIgnoreCase(String.valueOf(userRole))) {
				chain.doFilter(request, response);
			} else {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/admindashboard");
			}
			return;
		}

		// This allows /logout to continue to LogoutServlet
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}