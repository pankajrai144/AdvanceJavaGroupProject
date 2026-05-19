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

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter(urlPatterns = { 
		"/userdashboard", 
		"/admindashboard", 
		"/profile", 
		"/editprofile", 
		"/cart", 
		"/wishlist", 
		"/review", 
		"/payment", 
		"/paymentsuccess", 
		"/confirmdelete", 
		"/deleteaccount", 
		"/updateorderstatus", 
		"/adminproduct", 
		"/editproduct", 
		"/deleteproduct", 
		"/approveuser", 
		"/denyuser", 
		"/logout" 
})
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

		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		httpResponse.setHeader("Pragma", "no-cache");
		httpResponse.setDateHeader("Expires", 0);

		Object loggedInUserObj = SessionUtil.getAttribute(httpRequest, "loggedInUser");

		if (loggedInUserObj == null) {
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
			return;
		}

		UserModel loggedInUser = (UserModel) loggedInUserObj;
		String userRole = loggedInUser.getRole();

		if (userRole == null || userRole.trim().isEmpty()) {
			httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}

		String path = httpRequest.getServletPath();

		if (path.equals("/admindashboard") ||
			path.equals("/updateorderstatus") ||
			path.equals("/adminproduct") ||
			path.equals("/editproduct") ||
			path.equals("/deleteproduct") ||
			path.equals("/approveuser") ||
			path.equals("/denyuser")) {

			if ("admin".equalsIgnoreCase(userRole)) {
				chain.doFilter(request, response);
			} else {
				httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
			}
			return;
		}

		if (path.equals("/userdashboard") ||
			path.equals("/profile") ||
			path.equals("/editprofile") ||
			path.equals("/cart") ||
			path.equals("/wishlist") ||
			path.equals("/review") ||
			path.equals("/payment") ||
			path.equals("/paymentsuccess") ||
			path.equals("/confirmdelete") ||
			path.equals("/deleteaccount")) {

			if ("user".equalsIgnoreCase(userRole)) {
				chain.doFilter(request, response);
			} else {
				httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
			}
			return;
		}

		if (path.equals("/logout")) {
			chain.doFilter(request, response);
			return;
		}

		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}