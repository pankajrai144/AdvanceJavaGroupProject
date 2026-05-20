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
 * Servlet implementation class ApproveUserServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/approveuser" })
public class ApproveUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect(request.getContextPath() + "/admindashboard");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");

        // Only admin users are allowed to approve member accounts.
        if (loggedInUser.getRole() == null || !loggedInUser.getRole().equalsIgnoreCase("admin")) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String userIdValue = request.getParameter("userid");

            if (userIdValue == null || userIdValue.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admindashboard?error=true");
                return;
            }

            int userId = Integer.parseInt(userIdValue);

            UserDAO dao = new UserDAO();

            // The DAO updates the selected user's approval status in the database.
            boolean approved = dao.approveUser(userId);

            if (approved) {
                response.sendRedirect(request.getContextPath() + "/admindashboard?approved=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/admindashboard?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admindashboard?error=true");
        }
	}

}