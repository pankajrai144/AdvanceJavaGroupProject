package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.CartDAO;
import com.JerseyPasal.controller.dao.OrderDAO;
import com.JerseyPasal.controller.dao.OrderItemDAO;
import com.JerseyPasal.controller.dao.ReviewDAO;
import com.JerseyPasal.controller.dao.WishlistDAO;
import com.JerseyPasal.controller.model.OrderItemModel;
import com.JerseyPasal.controller.model.OrderModel;
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
 * Servlet implementation class UserdashboardServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/userdashboard" })
public class UserdashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserdashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        try {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("loggedInUser") == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");
            int userId = loggedInUser.getUserid();

            OrderDAO orderDAO = new OrderDAO();
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            ReviewDAO reviewDAO = new ReviewDAO();
            CartDAO cartDAO = new CartDAO();
            WishlistDAO wishlistDAO = new WishlistDAO();

            ArrayList<OrderModel> userOrders = orderDAO.getOrdersByUserId(userId);
            HashMap<Integer, ArrayList<OrderItemModel>> orderItemsMap = new HashMap<>();
            HashMap<String, Boolean> reviewedMap = new HashMap<>();

            if (userOrders != null && !userOrders.isEmpty()) {
                for (OrderModel order : userOrders) {
                    // Order items are stored by order id so the JSP can display items under the correct order.
                    ArrayList<OrderItemModel> orderItems = orderItemDAO.getOrderItemsByOrderId(order.getOrderId());
                    orderItemsMap.put(order.getOrderId(), orderItems);

                    if (orderItems != null && !orderItems.isEmpty()) {
                        for (OrderItemModel item : orderItems) {
                            boolean alreadyReviewed = reviewDAO.hasUserReviewedProduct(userId, item.getProductId());

                            // This key helps the dashboard know whether each ordered product has already been reviewed.
                            reviewedMap.put(order.getOrderId() + "_" + item.getProductId(), alreadyReviewed);
                        }
                    }
                }
            }

            int cartCount = cartDAO.getCartCountByUserId(userId);
            int wishlistCount = wishlistDAO.getWishlistCountByUserId(userId);
            int reviewCount = reviewDAO.getReviewCountByUserId(userId);

            if ("true".equals(request.getParameter("reviewAdded"))) {
                request.setAttribute("dashboardMessage", "<p class='success-message'>Review has been submitted successfully.</p>");
            }

            request.setAttribute("userOrders", userOrders);
            request.setAttribute("orderItemsMap", orderItemsMap);
            request.setAttribute("reviewedMap", reviewedMap);
            request.setAttribute("cartCount", cartCount);
            request.setAttribute("wishlistCount", wishlistCount);
            request.setAttribute("reviewCount", reviewCount);

            request.getRequestDispatcher("/WEB-INF/pages/userdashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            // Safe empty values are sent so the dashboard can still load after an error.
            request.setAttribute("dashboardMessage", "<p class='error-message'>Unable to load dashboard orders.</p>");
            request.setAttribute("userOrders", new ArrayList<OrderModel>());
            request.setAttribute("orderItemsMap", new HashMap<Integer, ArrayList<OrderItemModel>>());
            request.setAttribute("reviewedMap", new HashMap<String, Boolean>());
            request.setAttribute("cartCount", 0);
            request.setAttribute("wishlistCount", 0);
            request.setAttribute("reviewCount", 0);
            request.getRequestDispatcher("/WEB-INF/pages/userdashboard.jsp").forward(request, response);
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}