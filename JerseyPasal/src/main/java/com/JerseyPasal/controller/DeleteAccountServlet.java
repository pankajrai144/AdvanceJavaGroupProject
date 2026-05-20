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

/**
 * Servlet implementation class DeleteAccountServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/deleteaccount" })
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteAccountServlet() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(request.getContextPath() + "/userdashboard");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");
            String email = loggedInUser.getEmail();

            UserDAO dao = new UserDAO();

            // The account is soft deleted so the user record is kept but login is blocked.
            boolean deleted = dao.softDeleteUser(email);

            if (deleted) {
                // The session is cleared after deletion so the user cannot continue using the account.
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login?deleted=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/userdashboard?deleteError=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/userdashboard?deleteError=true");
        }
    }
}