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

                String cartStockMessage = checkCartStock(cartItems);

                if (cartStockMessage != null) {
                    request.setAttribute("error", cartStockMessage);
                    request.setAttribute("paymentSource", "cart");
                    request.setAttribute("cartItems", cartItems);
                    request.setAttribute("paymentAmount", paymentAmount);
                    request.setAttribute("loggedInUser", loggedInUser);

                    request.getRequestDispatcher("/WEB-INF/pages/payment.jsp").forward(request, response);
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

                // Buy Now also checks size availability before opening the payment page.
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
                reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                return;
            }

            fullName = fullName.trim();
            email = email.trim();
            phone = phone.trim();
            address = address.trim();
            paymentMethod = paymentMethod.trim();

            if (!fullName.matches("^[A-Za-z ]{2,50}$")) {
                request.setAttribute("error", "Full name must contain letters only.");
                reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                return;
            }

            if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
                request.setAttribute("error", "Please enter a valid email address.");
                reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                return;
            }

            if (!phone.matches("^[0-9]{7,15}$")) {
                request.setAttribute("error", "Phone number must contain 7 to 15 digits only.");
                reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                return;
            }

            if (!"Card".equalsIgnoreCase(paymentMethod) &&
                !"Cash on Delivery".equalsIgnoreCase(paymentMethod)) {
                request.setAttribute("error", "Please select a valid payment method.");
                reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                return;
            }

            String cardLastFour = "";
            String paymentStatus = "Pending";

            if ("Card".equalsIgnoreCase(paymentMethod)) {
                if (cardHolderName == null || cardHolderName.trim().isEmpty() ||
                    cardNumber == null || cardNumber.trim().isEmpty()) {

                    request.setAttribute("error", "Please fill card details for card payment.");
                    reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                    return;
                }

                cardHolderName = cardHolderName.trim();
                cardNumber = cardNumber.replaceAll("\\s+", "");

                if (!cardHolderName.matches("^[A-Za-z ]{2,50}$")) {
                    request.setAttribute("error", "Card holder name must contain letters only.");
                    reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                    return;
                }

                if (!cardNumber.matches("^[0-9]{13,19}$")) {
                    request.setAttribute("error", "Card number must contain 13 to 19 digits.");
                    reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                    return;
                }

                // Only the last four card digits are saved, not the full card number.
                cardLastFour = cardNumber.substring(cardNumber.length() - 4);
                paymentStatus = "Paid";

            } else if ("Cash on Delivery".equalsIgnoreCase(paymentMethod)) {
                cardHolderName = "";
                cardLastFour = "";
                paymentStatus = "Pending";
            }

            OrderDAO orderDAO = new OrderDAO();
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            PaymentDAO paymentDAO = new PaymentDAO();
            ProductDAO productDAO = new ProductDAO();

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

                String cartStockMessage = checkCartStock(cartItems);

                if (cartStockMessage != null) {
                    request.setAttribute("error", cartStockMessage);
                    reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                    return;
                }

                OrderModel order = new OrderModel(userId, orderTotal, "Pending");

                // The order is created first so all selected cart items can be linked to it.
                orderId = orderDAO.createOrder(order);

                if (orderId <= 0) {
                    request.setAttribute("error", "Unable to create order.");
                    reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                    return;
                }

                boolean orderItemsAdded = orderItemDAO.addCartItemsToOrder(orderId, cartItems);

                if (!orderItemsAdded) {
                    request.setAttribute("error", "Unable to add cart items to order.");
                    reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                    return;
                }

                for (CartItemModel cartItem : cartItems) {
                    boolean stockReduced = productDAO.reduceStockQuantity(cartItem.getProduct().getProductId(), cartItem.getQuantity());

                    if (!stockReduced) {
                        request.setAttribute("error", "Unable to update stock for " + cartItem.getProduct().getJerseyName() + ".");
                        reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                        return;
                    }
                }

                // Cart is cleared only after the order items and stock updates are completed.
                cartItemDAO.clearCartItems(userId);

            } else {
                if (productIdValue == null || productIdValue.trim().isEmpty() ||
                    selectedSize == null || selectedSize.trim().isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/product");
                    return;
                }

                int productId = Integer.parseInt(productIdValue);
                selectedSize = selectedSize.trim().toUpperCase();

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

                if (orderId <= 0) {
                    request.setAttribute("error", "Unable to create order.");
                    reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                    return;
                }

                OrderItemModel orderItem = new OrderItemModel(
                    orderId,
                    product.getProductId(),
                    selectedSize,
                    1,
                    product.getPrice(),
                    product.getPrice()
                );

                boolean orderItemAdded = orderItemDAO.addOrderItem(orderItem);

                if (!orderItemAdded) {
                    request.setAttribute("error", "Unable to add product to order.");
                    reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                    return;
                }

                boolean stockReduced = productDAO.reduceStockQuantity(product.getProductId(), 1);

                if (!stockReduced) {
                    request.setAttribute("error", "Unable to update product stock.");
                    reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                    return;
                }
            }

            PaymentModel payment = new PaymentModel(
                orderId,
                userId,
                fullName,
                email,
                phone,
                address,
                paymentMethod,
                cardHolderName,
                cardLastFour,
                orderTotal,
                paymentStatus
            );

            int paymentId = paymentDAO.createPayment(payment);

            if (paymentId <= 0) {
                request.setAttribute("error", "Unable to save payment details.");
                reloadPaymentPage(request, response, loggedInUser, paymentSource, productIdValue, selectedSize);
                return;
            }

            response.sendRedirect(request.getContextPath() + "/paymentsuccess?orderId=" + orderId + "&paymentId=" + paymentId);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to complete payment.");
            request.getRequestDispatcher("/WEB-INF/pages/payment.jsp").forward(request, response);
        }
	}

    private void reloadPaymentPage(HttpServletRequest request, HttpServletResponse response, UserModel loggedInUser,
                                   String paymentSource, String productIdValue, String selectedSize)
            throws ServletException, IOException {

        try {
            request.setAttribute("loggedInUser", loggedInUser);

            // The payment page is rebuilt with the same cart or product data after validation errors.
            if ("cart".equalsIgnoreCase(paymentSource)) {
                CartItemDAO cartItemDAO = new CartItemDAO();

                int userId = loggedInUser.getUserid();
                ArrayList<CartItemModel> cartItems = cartItemDAO.getCartItemsByUserId(userId);
                double paymentAmount = cartItemDAO.calculateCartTotal(cartItems);

                request.setAttribute("paymentSource", "cart");
                request.setAttribute("cartItems", cartItems);
                request.setAttribute("paymentAmount", paymentAmount);

                request.getRequestDispatcher("/WEB-INF/pages/payment.jsp").forward(request, response);
                return;
            }

            if (productIdValue != null && !productIdValue.trim().isEmpty()) {
                int productId = Integer.parseInt(productIdValue);

                ProductDAO productDAO = new ProductDAO();
                ProductModel product = productDAO.getProductById(productId);

                request.setAttribute("paymentSource", "product");
                request.setAttribute("product", product);
                request.setAttribute("selectedSize", selectedSize);
                request.setAttribute("paymentAmount", product != null ? product.getPrice() : 0);

                request.getRequestDispatcher("/WEB-INF/pages/payment.jsp").forward(request, response);
                return;
            }

            response.sendRedirect(request.getContextPath() + "/product");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to reload payment page.");
            request.getRequestDispatcher("/WEB-INF/pages/payment.jsp").forward(request, response);
        }
    }

    private String checkCartStock(ArrayList<CartItemModel> cartItems) {

        if (cartItems == null || cartItems.isEmpty()) {
            return "Your cart is empty.";
        }

        for (CartItemModel cartItem : cartItems) {
            if (cartItem.getProduct() == null) {
                return "One of the products in your cart is no longer available.";
            }

            ProductModel product = cartItem.getProduct();

            if (product.getStockQuantity() <= 0) {
                return product.getJerseyName() + " is currently out of stock.";
            }

            if (cartItem.getQuantity() > product.getStockQuantity()) {
                return "Only " + product.getStockQuantity() + " stock available for " + product.getJerseyName() + ".";
            }

            if (!isSizeAvailable(product.getSize(), cartItem.getSelectedSize())) {
                return "Selected size is not available for " + product.getJerseyName() + ".";
            }
        }

        return null;
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