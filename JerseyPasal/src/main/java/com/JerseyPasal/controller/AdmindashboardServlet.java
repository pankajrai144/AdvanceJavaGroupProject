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

        if (userRole == null || !userRole.equalsIgnoreCase("admin")) {
            response.sendRedirect(request.getContextPath() + "/userdashboard");
            return;
        }

        try {
            UserDAO dao = new UserDAO();

            ArrayList<HashMap<String, String>> users = dao.getAllUsers();

            String adminMessage = "";

            if ("true".equals(request.getParameter("denied"))) {
                adminMessage = "<p class='success-message'>User account has been denied successfully.</p>";
            } else if ("true".equals(request.getParameter("error"))) {
                adminMessage = "<p class='error-message'>Something went wrong. Please try again.</p>";
            }

            StringBuilder userRows = new StringBuilder();

            if (users != null && !users.isEmpty()) {

                for (HashMap<String, String> user : users) {

                    String userid = user.get("userid");
                    String fullname = user.get("fullname");
                    String email = user.get("email");
                    String status = user.get("approval_status");

                    if (userid == null) {
                        userid = "";
                    }

                    if (fullname == null) {
                        fullname = "";
                    }

                    if (email == null) {
                        email = "";
                    }

                    if (status == null || status.trim().isEmpty()) {
                        status = "approved";
                    }

                    String statusHtml;
                    String actionHtml;

                    if ("denied".equalsIgnoreCase(status)) {
                        statusHtml = "<span class='badge denied'>Denied</span>";
                        actionHtml = "<button disabled>Denied</button>";
                    } else if ("deleted".equalsIgnoreCase(status)) {
                        statusHtml = "<span class='badge denied'>Deleted</span>";
                        actionHtml = "<button disabled>Deleted</button>";
                    } else {
                        statusHtml = "<span class='badge success'>Approved</span>";

                        actionHtml =
                                "<form action='" + request.getContextPath() + "/denyuser' method='post' " +
                                "onsubmit=\"return confirm('Are you sure you want to deny this user?');\">" +
                                "<input type='hidden' name='userid' value='" + userid + "'>" +
                                "<button type='submit' class='deny-btn'>Deny</button>" +
                                "</form>";
                    }

                    userRows.append("<tr>");
                    userRows.append("<td>").append(fullname).append("</td>");
                    userRows.append("<td>").append(email).append("</td>");
                    userRows.append("<td>").append(statusHtml).append("</td>");
                    userRows.append("<td>").append(actionHtml).append("</td>");
                    userRows.append("</tr>");
                }

            } else {
                userRows.append("<tr>");
                userRows.append("<td colspan='4'>No users found.</td>");
                userRows.append("</tr>");
            }

            request.setAttribute("adminMessage", adminMessage);
            request.setAttribute("userRows", userRows.toString());

            request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("adminMessage", "<p class='error-message'>Unable to load users.</p>");
            request.setAttribute("userRows", "<tr><td colspan='4'>No users found.</td></tr>");
            request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}