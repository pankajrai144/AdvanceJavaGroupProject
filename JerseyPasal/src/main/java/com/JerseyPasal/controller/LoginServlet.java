package com.JerseyPasal.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.JerseyPasal.controller.model.UserModel;
import com.JerseyPasal.controller.service.LoginService;
import com.JerseyPasal.controller.utils.SessionUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {

                request.setAttribute("error", "Email and password are required.");
                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                return;
            }

            email = email.trim().toLowerCase();
            password = password.trim();

            LoginService service = new LoginService();
            UserModel loggedInUser = service.loginUser(email, password);

            if (loggedInUser != null) {

                SessionUtil.setAttribute(request, "loggedInUser", loggedInUser, 3600);

                String role = loggedInUser.getRole();

                if (role.equalsIgnoreCase("admin")) {
                    response.sendRedirect(request.getContextPath() + "/admindashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/userdashboard");
                }

            } else {

               
                if (service.isUserDenied(email, password)) {

                    request.setAttribute("error", "Your account has been denied by admin. Please contact support.");

                } else if (service.isUserDeleted(email, password)) {

                    request.setAttribute("error", "Your account has been deleted and cannot be used to login.");

                } else {

                    request.setAttribute("error", "Invalid email or password");
                }

                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", "Login failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
}