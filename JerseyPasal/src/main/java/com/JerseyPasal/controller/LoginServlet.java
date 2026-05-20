package com.JerseyPasal.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberEmail".equals(cookie.getName())) {
                    // Saved email is loaded so the login form can be pre-filled.
                    request.setAttribute("rememberedEmail", cookie.getValue());
                    request.setAttribute("rememberChecked", "checked");
                    break;
                }
            }
        }

        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");

            if (email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {

                request.setAttribute("error", "Email and password are required.");
                request.setAttribute("rememberedEmail", email);

                if ("yes".equals(remember)) {
                    request.setAttribute("rememberChecked", "checked");
                }

                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                return;
            }

            email = email.trim().toLowerCase();
            password = password.trim();

            if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
                request.setAttribute("error", "Please enter a valid email address.");
                request.setAttribute("rememberedEmail", email);

                if ("yes".equals(remember)) {
                    request.setAttribute("rememberChecked", "checked");
                }

                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                return;
            }

            LoginService service = new LoginService();
            UserModel loggedInUser = service.loginUser(email, password);

            if (loggedInUser != null) {

                if ("yes".equals(remember)) {
                    Cookie emailCookie = new Cookie("rememberEmail", email);
                    emailCookie.setMaxAge(7 * 24 * 60 * 60);
                    emailCookie.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
                    emailCookie.setHttpOnly(true);
                    response.addCookie(emailCookie);
                } else {
                    Cookie emailCookie = new Cookie("rememberEmail", "");
                    emailCookie.setMaxAge(0);
                    emailCookie.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
                    emailCookie.setHttpOnly(true);
                    response.addCookie(emailCookie);
                }

                HttpSession oldSession = request.getSession(false);

                if (oldSession != null) {
                    // The old session is cleared before creating a fresh login session.
                    oldSession.invalidate();
                }

                SessionUtil.setAttribute(request, "loggedInUser", loggedInUser, 3600);

                String role = loggedInUser.getRole();

                // Users are redirected based on their role after successful login.
                if (role != null && role.equalsIgnoreCase("admin")) {
                    response.sendRedirect(request.getContextPath() + "/admindashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/userdashboard");
                }

            } else {

                // Separate checks give clearer messages for denied or deleted accounts.
                if (service.isUserDenied(email, password)) {

                    request.setAttribute("error", "Your account is not approved yet. Please wait for admin approval.");

                } else if (service.isUserDeleted(email, password)) {

                    request.setAttribute("error", "Your account has been deleted and cannot be used to login.");

                } else {

                    request.setAttribute("error", "Invalid email or password");
                }

                request.setAttribute("rememberedEmail", email);

                if ("yes".equals(remember)) {
                    request.setAttribute("rememberChecked", "checked");
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