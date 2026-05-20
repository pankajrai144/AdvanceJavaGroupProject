package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.CartItemDAO;
import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.model.CartItemModel;
import com.JerseyPasal.controller.model.ProductModel;
import com.JerseyPasal.controller.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/cart" })
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
            String selectedSize = request.getParameter("selectedSize");
            String action = request.getParameter("action");

            CartItemDAO cartItemDAO = new CartItemDAO();

            if (productIdValue != null && !productIdValue.trim().isEmpty()) {
                int productId = Integer.parseInt(productIdValue);

                if (selectedSize != null) {
                    selectedSize = selectedSize.trim().toUpperCase();
                }

                // Cart item actions are handled here before loading the cart page again.
                if ("remove".equalsIgnoreCase(action)) {
                    cartItemDAO.removeCartItem(userId, productId, selectedSize);
                } else if ("increase".equalsIgnoreCase(action)) {
                    cartItemDAO.increaseCartItem(userId, productId, selectedSize);
                } else if ("decrease".equalsIgnoreCase(action)) {
                    cartItemDAO.decreaseCartItem(userId, productId, selectedSize);
                } else {
                    if (selectedSize == null || selectedSize.trim().isEmpty()) {
                        response.sendRedirect(request.getContextPath() + "/product?productId=" + productId + "&cartError=size");
                        return;
                    }

                    ProductDAO productDAO = new ProductDAO();
                    ProductModel product = productDAO.getProductById(productId);

                    if (product == null || product.getStockQuantity() <= 0) {
                        response.sendRedirect(request.getContextPath() + "/product?productId=" + productId + "&cartError=stock");
                        return;
                    }

                    // The selected size must exist in the product's available size list.
                    if (!isSizeAvailable(product.getSize(), selectedSize)) {
                        response.sendRedirect(request.getContextPath() + "/product?productId=" + productId + "&cartError=size");
                        return;
                    }

                    cartItemDAO.addProductToCart(userId, productId, selectedSize);
                }

                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

            ArrayList<CartItemModel> cartItems = cartItemDAO.getCartItemsByUserId(userId);
            double cartTotal = cartItemDAO.calculateCartTotal(cartItems);

            request.setAttribute("cartItems", cartItems);
            request.setAttribute("cartTotal", cartTotal);

            request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            // Empty cart data is sent so the cart page can still open after an error.
            request.setAttribute("cartItems", new ArrayList<CartItemModel>());
            request.setAttribute("cartTotal", 0.0);
            request.setAttribute("error", "Unable to load cart.");
            request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

    private boolean isSizeAvailable(String availableSizes, String selectedSize) {
        if (availableSizes == null || availableSizes.trim().isEmpty() ||
            selectedSize == null || selectedSize.trim().isEmpty()) {
            return false;
        }

        String[] sizeList = availableSizes.split(",");

        for (String size : sizeList) {
            if (size.trim().equalsIgnoreCase(selectedSize.trim())) {
                return true;
            }
        }

        return false;
    }

}