package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.UserDAO;
import com.JerseyPasal.controller.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Servlet implementation class AdmindashboardServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admindashboard" })
public class AdmindashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdmindashboardServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Object loggedInUserObj = session.getAttribute("loggedInUser");

       
        if (loggedInUserObj == null) {
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserModel loggedInUser = (UserModel) loggedInUserObj;
        String userRole = loggedInUser.getRole();

        
        if (!userRole.equalsIgnoreCase("admin")) {
            response.sendRedirect(request.getContextPath() + "/userdashboard");
            return;
        }

        try {
            UserDAO dao = new UserDAO();

            ArrayList<HashMap<String, String>> users = dao.getAllUsers();

            request.setAttribute("users", users);

            request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", "Unable to load users.");
            request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}