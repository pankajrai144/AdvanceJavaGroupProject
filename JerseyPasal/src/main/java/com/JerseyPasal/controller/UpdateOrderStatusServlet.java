package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.OrderDAO;
import com.JerseyPasal.controller.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class UpdateOrderStatusServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/updateorderstatus" })
public class UpdateOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderStatusServlet() {
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

        try {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("loggedInUser") == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");

            // Only admin users are allowed to update order status.
            if (loggedInUser.getRole() == null || !loggedInUser.getRole().equalsIgnoreCase("admin")) {
                response.sendRedirect(request.getContextPath() + "/userdashboard");
                return;
            }

            String orderIdValue = request.getParameter("orderId");
            String orderStatus = request.getParameter("orderStatus");

            if (orderIdValue == null || orderIdValue.trim().isEmpty() ||
                orderStatus == null || orderStatus.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admindashboard?orderError=true");
                return;
            }

            orderStatus = orderStatus.trim();

            // The status is checked before updating so invalid values cannot be saved.
            if (!isValidOrderStatus(orderStatus)) {
                response.sendRedirect(request.getContextPath() + "/admindashboard?orderError=true");
                return;
            }

            int orderId = Integer.parseInt(orderIdValue);

            OrderDAO orderDAO = new OrderDAO();

            // The selected order is updated using the order id and chosen status.
            boolean updated = orderDAO.updateOrderStatus(orderId, orderStatus);

            if (updated) {
                response.sendRedirect(request.getContextPath() + "/admindashboard?orderUpdated=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/admindashboard?orderError=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admindashboard?orderError=true");
        }
	}

    private boolean isValidOrderStatus(String orderStatus) {
        return "Pending".equalsIgnoreCase(orderStatus) ||
               "Processing".equalsIgnoreCase(orderStatus) ||
               "Shipped".equalsIgnoreCase(orderStatus) ||
               "Delivered".equalsIgnoreCase(orderStatus) ||
               "Cancelled".equalsIgnoreCase(orderStatus);
    }

}