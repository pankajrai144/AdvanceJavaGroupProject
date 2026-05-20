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

		// These headers stop protected pages from being shown again after logout using the browser back button.
		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		httpResponse.setHeader("Pragma", "no-cache");
		httpResponse.setDateHeader("Expires", 0);

		Object loggedInUserObj = SessionUtil.getAttribute(httpRequest, "loggedInUser");

		if (loggedInUserObj == null) {
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
			return;
		}

		// If the session has unexpected data, it is cleared before sending the user back to login.
		if (!(loggedInUserObj instanceof UserModel)) {
			HttpSession session = httpRequest.getSession(false);

			if (session != null) {
				session.invalidate();
			}

			httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
			return;
		}

		UserModel loggedInUser = (UserModel) loggedInUserObj;
		String userRole = loggedInUser.getRole();
		String path = httpRequest.getServletPath();

		if (path.equals("/logout")) {
			chain.doFilter(request, response);
			return;
		}

		if (userRole == null || userRole.trim().isEmpty()) {
			httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}

		userRole = userRole.trim();

		// Admin pages are only allowed for users with the admin role.
		if (isAdminPath(path)) {
			if ("admin".equalsIgnoreCase(userRole)) {
				chain.doFilter(request, response);
			} else {
				httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
			}
			return;
		}

		// Customer pages are only allowed for normal logged-in users.
		if (isUserPath(path)) {
			if ("user".equalsIgnoreCase(userRole)) {
				chain.doFilter(request, response);
			} else {
				httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
			}
			return;
		}

		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	private boolean isAdminPath(String path) {
		return path.equals("/admindashboard") ||
			   path.equals("/updateorderstatus") ||
			   path.equals("/adminproduct") ||
			   path.equals("/editproduct") ||
			   path.equals("/deleteproduct") ||
			   path.equals("/approveuser") ||
			   path.equals("/denyuser");
	}

	private boolean isUserPath(String path) {
		return path.equals("/userdashboard") ||
			   path.equals("/profile") ||
			   path.equals("/editprofile") ||
			   path.equals("/cart") ||
			   path.equals("/wishlist") ||
			   path.equals("/review") ||
			   path.equals("/payment") ||
			   path.equals("/paymentsuccess") ||
			   path.equals("/confirmdelete") ||
			   path.equals("/deleteaccount");
	}
}