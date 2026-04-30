package com.groupcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.groupcoursework.service.LoginService;

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
			// Get data from login.jsp form
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			// Call LoginService
			LoginService service = new LoginService();
			boolean isValidUser = service.loginUser(email, password);
			
			if (isValidUser) {
				// Create session after successful login
				HttpSession session = request.getSession();
				session.setAttribute("userEmail", email);
				
				// Redirect to dashboard after login
				response.sendRedirect(request.getContextPath() + "/userdashboard");
			} else {
				// Send error message back to login.jsp
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