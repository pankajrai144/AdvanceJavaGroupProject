package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.WishlistDAO;
import com.JerseyPasal.controller.model.UserModel;
import com.JerseyPasal.controller.model.WishlistModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class WishlistServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/wishlist" })
public class WishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishlistServlet() {
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

            String productIdValue = request.getParameter("productId");
            String action = request.getParameter("action");

            WishlistDAO wishlistDAO = new WishlistDAO();

            if (productIdValue != null && !productIdValue.trim().isEmpty()) {
                int productId = Integer.parseInt(productIdValue);

                // The same servlet handles both adding and removing wishlist products.
                if ("remove".equalsIgnoreCase(action)) {
                    wishlistDAO.removeFromWishlist(userId, productId);
                } else {
                    wishlistDAO.addToWishlist(userId, productId);
                }

                response.sendRedirect(request.getContextPath() + "/wishlist");
                return;
            }

            ArrayList<WishlistModel> wishlistItems = wishlistDAO.getWishlistByUserId(userId);
            int wishlistCount = wishlistDAO.getWishlistCountByUserId(userId);

            request.setAttribute("wishlistItems", wishlistItems);
            request.setAttribute("wishlistCount", wishlistCount);

            request.getRequestDispatcher("/WEB-INF/pages/wishlist.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            // Empty wishlist data is sent so the wishlist page can still open after an error.
            request.setAttribute("wishlistItems", new ArrayList<WishlistModel>());
            request.setAttribute("wishlistCount", 0);
            request.setAttribute("error", "Unable to load wishlist.");
            request.getRequestDispatcher("/WEB-INF/pages/wishlist.jsp").forward(request, response);
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