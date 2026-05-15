package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.CartItemDAO;
import com.JerseyPasal.controller.dao.OrderDAO;
import com.JerseyPasal.controller.dao.OrderItemDAO;
import com.JerseyPasal.controller.dao.PaymentDAO;
import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.model.CartItemModel;
import com.JerseyPasal.controller.model.OrderItemModel;
import com.JerseyPasal.controller.model.OrderModel;
import com.JerseyPasal.controller.model.PaymentModel;
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
 * Servlet implementation class PaymentServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/payment" })
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
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

            String productIdValue = request.getParameter("productId");
            String selectedSize = request.getParameter("selectedSize");
            String source = request.getParameter("source");

            if (source != null && source.equalsIgnoreCase("cart")) {
                CartItemDAO cartItemDAO = new CartItemDAO();

                int userId = loggedInUser.getUserid();
                ArrayList<CartItemModel> cartItems = cartItemDAO.getCartItemsByUserId(userId);
                double paymentAmount = cartItemDAO.calculateCartTotal(cartItems);

                if (cartItems == null || cartItems.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/cart");
                    return;
                }

                request.setAttribute("paymentSource", "cart");
                request.setAttribute("cartItems", cartItems);
                request.setAttribute("paymentAmount", paymentAmount);
                request.setAttribute("loggedInUser", loggedInUser);

                request.getRequestDispatcher("/WEB-INF/pages/payment.jsp").forward(request, response);
                return;
            }

            if (productIdValue != null && !productIdValue.trim().isEmpty()) {
                int productId = Integer.parseInt(productIdValue);

                if (selectedSize == null || selectedSize.trim().isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/product?productId=" + productId + "&cartError=size");
                    return;
                }

                selectedSize = selectedSize.trim().toUpperCase();

                ProductDAO productDAO = new ProductDAO();
                ProductModel product = productDAO.getProductById(productId);

                if (product == null || product.getStockQuantity() <= 0) {
                    response.sendRedirect(request.getContextPath() + "/product?productId=" + productId + "&cartError=stock");
                    return;
                }

                if (!isSizeAvailable(product.getSize(), selectedSize)) {
                    response.sendRedirect(request.getContextPath() + "/product?productId=" + productId + "&cartError=size");
                    return;
                }

                request.setAttribute("paymentSource", "product");
                request.setAttribute("product", product);
                request.setAttribute("selectedSize", selectedSize);
                request.setAttribute("paymentAmount", product.getPrice());
                request.setAttribute("loggedInUser", loggedInUser);

                request.getRequestDispatcher("/WEB-INF/pages/payment.jsp").forward(request, response);
                return;
            }

            response.sendRedirect(request.getContextPath() + "/product");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to open payment page.");
            request.getRequestDispatcher("/WEB-INF/pages/payment.jsp").forward(request, response);
        }
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
            int userId = loggedInUser.getUserid();

            String paymentSource = request.getParameter("paymentSource");
            String productIdValue = request.getParameter("productId");
            String selectedSize = request.getParameter("selectedSize");

            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String paymentMethod = request.getParameter("paymentMethod");
            String cardHolderName = request.getParameter("cardHolderName");
            String cardNumber = request.getParameter("cardNumber");

            if (fullName == null || fullName.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                phone == null || phone.trim().isEmpty() ||
                address == null || address.trim().isEmpty() ||
                paymentMethod == null || paymentMethod.trim().isEmpty()) {

                request.setAttribute("error", "Please fill all required payment details.");
                doGet(request, response);
                return;
            }

            OrderDAO orderDAO = new OrderDAO();
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            PaymentDAO paymentDAO = new PaymentDAO();

            double orderTotal = 0.0;
            int orderId = 0;

            if ("cart".equalsIgnoreCase(paymentSource)) {
                CartItemDAO cartItemDAO = new CartItemDAO();

                ArrayList<CartItemModel> cartItems = cartItemDAO.getCartItemsByUserId(userId);
                orderTotal = cartItemDAO.calculateCartTotal(cartItems);

                if (cartItems == null || cartItems.isEmpty() || orderTotal <= 0) {
                    response.sendRedirect(request.getContextPath() + "/cart");
                    return;
                }

                OrderModel order = new OrderModel(userId, orderTotal, "Pending");
                orderId = orderDAO.createOrder(order);

                orderItemDAO.addCartItemsToOrder(orderId, cartItems);
                cartItemDAO.clearCartItems(userId);

            } else {
                if (productIdValue == null || productIdValue.trim().isEmpty() ||
                    selectedSize == null || selectedSize.trim().isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/product");
                    return;
                }

                int productId = Integer.parseInt(productIdValue);
                selectedSize = selectedSize.trim().toUpperCase();

                ProductDAO productDAO = new ProductDAO();
                ProductModel product = productDAO.getProductById(productId);

                if (product == null || product.getStockQuantity() <= 0) {
                    response.sendRedirect(request.getContextPath() + "/product?productId=" + productId + "&cartError=stock");
                    return;
                }

                if (!isSizeAvailable(product.getSize(), selectedSize)) {
                    response.sendRedirect(request.getContextPath() + "/product?productId=" + productId + "&cartError=size");
                    return;
                }

                orderTotal = product.getPrice();

                OrderModel order = new OrderModel(userId, orderTotal, "Pending");
                orderId = orderDAO.createOrder(order);

                OrderItemModel orderItem = new OrderItemModel(
                    orderId,
                    product.getProductId(),
                    selectedSize,
                    1,
                    product.getPrice(),
                    product.getPrice()
                );

                orderItemDAO.addOrderItem(orderItem);
            }

            String cardLastFour = "";
            String paymentStatus = "Pending";

            if ("Card".equalsIgnoreCase(paymentMethod)) {
                if (cardHolderName == null || cardHolderName.trim().isEmpty() ||
                    cardNumber == null || cardNumber.trim().isEmpty()) {

                    request.setAttribute("error", "Please fill card details for card payment.");
                    doGet(request, response);
                    return;
                }

                cardNumber = cardNumber.replaceAll("\\s+", "");

                if (cardNumber.length() < 4) {
                    request.setAttribute("error", "Please enter a valid card number.");
                    doGet(request, response);
                    return;
                }

                cardLastFour = cardNumber.substring(cardNumber.length() - 4);
                paymentStatus = "Paid";

            } else if ("Cash on Delivery".equalsIgnoreCase(paymentMethod)) {
                cardHolderName = "";
                cardLastFour = "";
                paymentStatus = "Pending";
            }

            PaymentModel payment = new PaymentModel(
                orderId,
                userId,
                fullName.trim(),
                email.trim(),
                phone.trim(),
                address.trim(),
                paymentMethod.trim(),
                cardHolderName,
                cardLastFour,
                orderTotal,
                paymentStatus
            );

            int paymentId = paymentDAO.createPayment(payment);

            response.sendRedirect(request.getContextPath() + "/paymentsuccess?orderId=" + orderId + "&paymentId=" + paymentId);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to complete payment.");
            request.getRequestDispatcher("/WEB-INF/pages/payment.jsp").forward(request, response);
        }
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
