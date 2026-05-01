package com.groupcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

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
			String terms = request.getParameter("terms");

			String error = validateRegisterForm(fullname, email, phone, dob, password, address, gender, terms);

			if (error != null) {
				request.setAttribute("error", error);
				request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
				return;
			}

			RegisterService service = new RegisterService();
			service.registerUser(fullname, email, phone, dob, password, address, gender);

			response.sendRedirect(request.getContextPath() + "/login");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Registration failed. Please try again.");
			request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
		}
	}

	private String validateRegisterForm(String fullname, String email, String phone, String dob,
			String password, String address, String gender, String terms) {

		if (fullname == null || fullname.trim().isEmpty()) {
			return "Full name is required.";
		}

		if (email == null || email.trim().isEmpty()) {
			return "Email address is required.";
		}

		if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
			return "Please enter a valid email address.";
		}

		if (phone == null || phone.trim().isEmpty()) {
			return "Phone number is required.";
		}

		if (!phone.matches("[0-9]{10}")) {
			return "Phone number must contain exactly 10 digits.";
		}

		if (dob == null || dob.trim().isEmpty()) {
			return "Date of birth is required.";
		}

		try {
			LocalDate birthDate = LocalDate.parse(dob);

			if (birthDate.isEqual(LocalDate.now()) || birthDate.isAfter(LocalDate.now())) {
				return "Date of birth cannot be today or in the future.";
			}

		} catch (DateTimeParseException e) {
			return "Date of birth must be in YYYY-MM-DD format.";
		}

		if (password == null || password.trim().isEmpty()) {
			return "Password is required.";
		}

		if (password.length() < 6) {
			return "Password must be at least 6 characters long.";
		}

		if (address == null || address.trim().isEmpty()) {
			return "Address is required.";
		}

		if (gender == null || gender.trim().isEmpty()) {
			return "Please select your gender.";
		}

		if (terms == null || !terms.equals("agree")) {
			return "You must agree to the Terms & Conditions.";
		}

		return null;
	}
}