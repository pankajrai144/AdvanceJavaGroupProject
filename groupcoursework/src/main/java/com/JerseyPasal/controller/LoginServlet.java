package com.JerseyPasal.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.JerseyPasal.controller.service.LoginService;
import com.JerseyPasal.controller.utils.SessionUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			LoginService service = new LoginService();
			String role = service.loginUser(email, password);
			
			if (role != null) {
				SessionUtil.setAttribute(request, "userEmail", email, 3600);
				SessionUtil.setAttribute(request, "userRole", role, 3600);
				
				if (role.equalsIgnoreCase("admin")) {
					response.sendRedirect(request.getContextPath() + "/admindashboard");
				} else {
					response.sendRedirect(request.getContextPath() + "/userdashboard");
				}
				
			} else {
				request.setAttribute("error", "Invalid email or password");
				request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Login failed. Please try again.");
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
		}
	}

}