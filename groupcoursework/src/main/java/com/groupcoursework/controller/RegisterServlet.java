package com.groupcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.groupcoursework.service.RegisterService;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String dob = request.getParameter("dob");
			String password = request.getParameter("password");
			String address = request.getParameter("address");
			String gender = request.getParameter("gender");

			RegisterService service = new RegisterService();
			service.registerUser(fullname, email, phone, dob, password, address, gender);

			response.sendRedirect(request.getContextPath() + "/login");

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Registration Failed: " + e.getMessage());
		}
	}
}