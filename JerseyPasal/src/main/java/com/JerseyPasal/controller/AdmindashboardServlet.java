package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.ContactDAO;
import com.JerseyPasal.controller.dao.OrderDAO;
import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.dao.ReviewDAO;
import com.JerseyPasal.controller.dao.UserDAO;
import com.JerseyPasal.controller.model.OrderModel;
import com.JerseyPasal.controller.model.ProductModel;
import com.JerseyPasal.controller.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;

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

        // Only admin users are allowed to open the admin dashboard.
        if (userRole == null || !userRole.equalsIgnoreCase("admin")) {
            response.sendRedirect(request.getContextPath() + "/userdashboard");
            return;
        }

        try {
            UserDAO dao = new UserDAO();
            ProductDAO productDAO = new ProductDAO();
            OrderDAO orderDAO = new OrderDAO();
            ReviewDAO reviewDAO = new ReviewDAO();
            ContactDAO contactDAO = new ContactDAO();

            ArrayList<HashMap<String, String>> users = dao.getAllUsers();
            ArrayList<ProductModel> products = productDAO.getAllProducts();
            ArrayList<OrderModel> orders = orderDAO.getAllOrders();
            ArrayList<HashMap<String, String>> contactMessages = contactDAO.getAllContactMessages();

            double totalRevenue = 0.0;
            int totalOrders = 0;
            int totalCustomers = 0;
            int totalProducts = 0;

            if (orders != null) {
                totalOrders = orders.size();

                // Cancelled orders are not counted as revenue.
                for (OrderModel order : orders) {
                    if (!"Cancelled".equalsIgnoreCase(order.getOrderStatus())) {
                        totalRevenue += order.getOrderTotal();
                    }
                }
            }

            if (users != null) {
                totalCustomers = users.size();
            }

            if (products != null) {
                totalProducts = products.size();
            }

            int pendingOrders = orderDAO.getOrderCountByStatus("Pending");
            int deliveredOrders = orderDAO.getOrderCountByStatus("Delivered");
            int lowStockProducts = productDAO.getLowStockProductCount();

            String lowestStockProduct = productDAO.getLowestStockProduct();
            String mostOrderedProduct = orderDAO.getMostOrderedProduct();
            String mostReviewedProduct = reviewDAO.getMostReviewedProduct();

            String adminMessage = "";

            Object sessionSuccessMessage = session.getAttribute("successMessage");
            Object sessionErrorMessage = session.getAttribute("errorMessage");

            session.removeAttribute("successMessage");
            session.removeAttribute("errorMessage");

            if (sessionErrorMessage != null && !String.valueOf(sessionErrorMessage).trim().isEmpty()) {
                adminMessage = "<p class='error-message'>" + htmlEscape(String.valueOf(sessionErrorMessage)) + "</p>";
            } else if (sessionSuccessMessage != null && !String.valueOf(sessionSuccessMessage).trim().isEmpty()) {
                adminMessage = "<p class='success-message'>" + htmlEscape(String.valueOf(sessionSuccessMessage)) + "</p>";
            }

            // Messages are selected from query parameters after admin actions are completed.
            if (adminMessage.isEmpty()) {
                if ("true".equals(request.getParameter("denied"))) {
                    adminMessage = "<p class='success-message'>User account has been denied successfully.</p>";
                } else if ("true".equals(request.getParameter("approved"))) {
                    adminMessage = "<p class='success-message'>User account has been approved successfully.</p>";
                } else if ("true".equals(request.getParameter("productAdded"))) {
                    adminMessage = "<p class='success-message'>Product has been added successfully.</p>";
                } else if ("true".equals(request.getParameter("productUpdated"))) {
                    adminMessage = "<p class='success-message'>Product has been updated successfully.</p>";
                } else if ("true".equals(request.getParameter("productDeleted"))) {
                    adminMessage = "<p class='success-message'>Product has been deleted successfully.</p>";
                } else if ("true".equals(request.getParameter("orderUpdated"))) {
                    adminMessage = "<p class='success-message'>Order status has been updated successfully.</p>";
                } else if ("true".equals(request.getParameter("orderError"))) {
                    adminMessage = "<p class='error-message'>Order status could not be updated. Please try again.</p>";
                } else if ("empty".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Please fill all required product fields.</p>";
                } else if ("jerseyName".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Jersey name must be between 2 and 100 characters.</p>";
                } else if ("jerseyNameFormat".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Jersey name can only contain letters, numbers, spaces, hyphen and slash.</p>";
                } else if ("teamName".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Team name must be between 2 and 100 characters.</p>";
                } else if ("teamNameFormat".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Team name can only contain letters, numbers, spaces, hyphen and full stop.</p>";
                } else if ("size".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Please select at least one valid size: XS, S, M, L, XL, or XXL.</p>";
                } else if ("season".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Season format must be like 2025/26.</p>";
                } else if ("category".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Product category must be Club or Nation.</p>";
                } else if ("description".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Description must be less than 500 characters.</p>";
                } else if ("price".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Product price must be greater than 0.</p>";
                } else if ("priceLimit".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Product price is too high.</p>";
                } else if ("stock".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Stock quantity cannot be negative.</p>";
                } else if ("stockLimit".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Stock quantity is too high.</p>";
                } else if ("number".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Please enter valid numbers for price and stock.</p>";
                } else if ("noimage".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Please upload a product image.</p>";
                } else if ("imagecount".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Please select exactly 4 product images.</p>";
                } else if ("image".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Please upload only JPG, JPEG, PNG or WEBP image files.</p>";
                } else if ("imagesize".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Product image size must be less than 2MB.</p>";
                } else if ("delete".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Product could not be deleted. Please try again.</p>";
                } else if ("update".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Product could not be updated. Please try again.</p>";
                } else if ("true".equals(request.getParameter("productError"))) {
                    adminMessage = "<p class='error-message'>Product could not be added. Please try again.</p>";
                } else if ("true".equals(request.getParameter("error"))) {
                    adminMessage = "<p class='error-message'>Something went wrong. Please try again.</p>";
                }
            }

            StringBuilder userRows = new StringBuilder();

            if (users != null && !users.isEmpty()) {

                for (HashMap<String, String> user : users) {

                    String userid = safeValue(user.get("userid"));
                    String fullname = safeValue(user.get("fullname"));
                    String email = safeValue(user.get("email"));
                    String status = safeValue(user.get("approval_status"));

                    if (status.trim().isEmpty()) {
                        status = "approved";
                    }

                    String safeUserId = htmlEscape(userid);
                    String safeFullname = htmlEscape(fullname);
                    String safeEmail = htmlEscape(email);

                    String statusHtml;
                    String actionHtml;

                    // The action button changes depending on the user's approval status.
                    if ("denied".equalsIgnoreCase(status)) {
                        statusHtml = "<span class='badge denied'>Denied</span>";

                        actionHtml =
                                "<form action='" + request.getContextPath() + "/approveuser' method='post' " +
                                "onsubmit=\"return confirm('Are you sure you want to approve this user?');\">" +
                                "<input type='hidden' name='userid' value='" + safeUserId + "'>" +
                                "<button type='submit' class='approve-btn'>Approve</button>" +
                                "</form>";

                    } else if ("deleted".equalsIgnoreCase(status)) {
                        statusHtml = "<span class='badge denied'>Deleted</span>";
                        actionHtml = "<button disabled>Deleted</button>";
                    } else {
                        statusHtml = "<span class='badge success'>Approved</span>";

                        actionHtml =
                                "<form action='" + request.getContextPath() + "/denyuser' method='post' " +
                                "onsubmit=\"return confirm('Are you sure you want to deny this user?');\">" +
                                "<input type='hidden' name='userid' value='" + safeUserId + "'>" +
                                "<button type='submit' class='deny-btn'>Deny</button>" +
                                "</form>";
                    }

                    userRows.append("<tr>");
                    userRows.append("<td>").append(safeFullname).append("</td>");
                    userRows.append("<td>").append(safeEmail).append("</td>");
                    userRows.append("<td>").append(statusHtml).append("</td>");
                    userRows.append("<td>").append(actionHtml).append("</td>");
                    userRows.append("</tr>");
                }

            } else {
                userRows.append("<tr>");
                userRows.append("<td colspan='4'>No users found.</td>");
                userRows.append("</tr>");
            }

            StringBuilder productRows = new StringBuilder();

            if (products != null && !products.isEmpty()) {

                for (ProductModel product : products) {

                    String productImage = product.getProductImage();

                    String imageHtml;

                    if (productImage != null && !productImage.trim().isEmpty()) {
                        String encodedImage = URLEncoder.encode(productImage, StandardCharsets.UTF_8);
                        imageHtml = "<img src='" + request.getContextPath() + "/getimage?productImage=" + encodedImage + "' class='product-img' alt='Product Image'>";
                    } else {
                        imageHtml = "<span class='no-image-text'>No image</span>";
                    }

                    String actionHtml =
                            "<div class='product-action-box'>" +
                            "<a href='" + request.getContextPath() + "/editproduct?productId=" + product.getProductId() + "' class='edit-product-btn'>Edit</a>" +
                            "<form action='" + request.getContextPath() + "/deleteproduct' method='post' " +
                            "onsubmit=\"return confirm('Are you sure you want to delete this product?');\">" +
                            "<input type='hidden' name='productId' value='" + product.getProductId() + "'>" +
                            "<button type='submit' class='delete-product-btn'>Delete</button>" +
                            "</form>" +
                            "</div>";

                    productRows.append("<tr>");
                    productRows.append("<td>").append(imageHtml).append("</td>");
                    productRows.append("<td>").append(htmlEscape(product.getJerseyName())).append("</td>");
                    productRows.append("<td>").append(htmlEscape(product.getTeamName())).append("</td>");
                    productRows.append("<td>").append(htmlEscape(product.getSize())).append("</td>");
                    productRows.append("<td>").append(htmlEscape(product.getSeason())).append("</td>");
                    productRows.append("<td>$").append(product.getPrice()).append("</td>");
                    productRows.append("<td>").append(product.getStockQuantity()).append("</td>");
                    productRows.append("<td>").append(htmlEscape(product.getCategory())).append("</td>");
                    productRows.append("<td>").append(actionHtml).append("</td>");
                    productRows.append("</tr>");
                }

            } else {
                productRows.append("<tr>");
                productRows.append("<td colspan='9'>No products found.</td>");
                productRows.append("</tr>");
            }

            StringBuilder orderRows = new StringBuilder();
            StringBuilder recentOrderRows = new StringBuilder();

            if (orders != null && !orders.isEmpty()) {

                int recentLimit = 0;

                for (OrderModel order : orders) {

                    String status = order.getOrderStatus();

                    if (status == null || status.trim().isEmpty()) {
                        status = "Pending";
                    }

                    String statusClass = "pending";

                    if ("Processing".equalsIgnoreCase(status)) {
                        statusClass = "processing";
                    } else if ("Shipped".equalsIgnoreCase(status)) {
                        statusClass = "shipped";
                    } else if ("Delivered".equalsIgnoreCase(status)) {
                        statusClass = "success";
                    } else if ("Cancelled".equalsIgnoreCase(status)) {
                        statusClass = "denied";
                    }

                    String customerName = order.getCustomerName();

                    if (customerName == null || customerName.trim().isEmpty()) {
                        customerName = "User #" + order.getUserId();
                    }

                    String safeCustomerName = htmlEscape(customerName);
                    String safeStatus = htmlEscape(status);
                    String safeOrderDate = htmlEscape(order.getOrderDate());

                    // Only the latest five orders are shown in the recent orders summary.
                    if (recentLimit < 5) {
                        recentOrderRows.append("<tr>");
                        recentOrderRows.append("<td>#").append(order.getOrderId()).append("</td>");
                        recentOrderRows.append("<td>").append(safeCustomerName).append("</td>");
                        recentOrderRows.append("<td><span class='badge ").append(statusClass).append("'>").append(safeStatus).append("</span></td>");
                        recentOrderRows.append("</tr>");
                        recentLimit++;
                    }

                    String actionHtml =
                            "<form action='" + request.getContextPath() + "/updateorderstatus' method='post' class='order-status-form'>" +
                            "<input type='hidden' name='orderId' value='" + order.getOrderId() + "'>" +
                            "<select name='orderStatus' class='order-status-select'>" +
                            "<option value='Pending'" + ("Pending".equalsIgnoreCase(status) ? " selected" : "") + ">Pending</option>" +
                            "<option value='Processing'" + ("Processing".equalsIgnoreCase(status) ? " selected" : "") + ">Processing</option>" +
                            "<option value='Shipped'" + ("Shipped".equalsIgnoreCase(status) ? " selected" : "") + ">Shipped</option>" +
                            "<option value='Delivered'" + ("Delivered".equalsIgnoreCase(status) ? " selected" : "") + ">Delivered</option>" +
                            "<option value='Cancelled'" + ("Cancelled".equalsIgnoreCase(status) ? " selected" : "") + ">Cancelled</option>" +
                            "</select>" +
                            "<button type='submit' class='update-order-btn'>Update</button>" +
                            "</form>";

                    orderRows.append("<tr>");
                    orderRows.append("<td>#").append(order.getOrderId()).append("</td>");
                    orderRows.append("<td>").append(safeCustomerName).append("</td>");
                    orderRows.append("<td>£").append(order.getOrderTotal()).append("</td>");
                    orderRows.append("<td><span class='badge ").append(statusClass).append("'>").append(safeStatus).append("</span></td>");
                    orderRows.append("<td>").append(safeOrderDate).append("</td>");
                    orderRows.append("<td>").append(actionHtml).append("</td>");
                    orderRows.append("</tr>");
                }

            } else {
                orderRows.append("<tr>");
                orderRows.append("<td colspan='6'>No orders found.</td>");
                orderRows.append("</tr>");

                recentOrderRows.append("<tr>");
                recentOrderRows.append("<td colspan='3'>No recent orders found.</td>");
                recentOrderRows.append("</tr>");
            }

            StringBuilder contactRows = new StringBuilder();

            if (contactMessages != null && !contactMessages.isEmpty()) {

                for (HashMap<String, String> contact : contactMessages) {

                    String fullname = safeValue(contact.get("fullname"));
                    String email = safeValue(contact.get("email"));
                    String phone = safeValue(contact.get("phone"));
                    String subject = safeValue(contact.get("subject"));
                    String message = safeValue(contact.get("message"));
                    String submittedAt = safeValue(contact.get("submitted_at"));

                    contactRows.append("<tr>");
                    contactRows.append("<td>").append(htmlEscape(fullname)).append("</td>");
                    contactRows.append("<td>").append(htmlEscape(email)).append("</td>");
                    contactRows.append("<td>").append(htmlEscape(phone)).append("</td>");
                    contactRows.append("<td>").append(htmlEscape(subject)).append("</td>");
                    contactRows.append("<td>").append(htmlEscape(message)).append("</td>");
                    contactRows.append("<td>").append(htmlEscape(submittedAt)).append("</td>");
                    contactRows.append("</tr>");
                }

            } else {
                contactRows.append("<tr>");
                contactRows.append("<td colspan='6'>No contact messages found.</td>");
                contactRows.append("</tr>");
            }

            request.setAttribute("adminMessage", adminMessage);
            request.setAttribute("userRows", userRows.toString());
            request.setAttribute("productRows", productRows.toString());
            request.setAttribute("orderRows", orderRows.toString());
            request.setAttribute("recentOrderRows", recentOrderRows.toString());
            request.setAttribute("contactRows", contactRows.toString());
            request.setAttribute("totalRevenue", String.format("%.2f", totalRevenue));
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("totalCustomers", totalCustomers);
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("pendingOrders", pendingOrders);
            request.setAttribute("deliveredOrders", deliveredOrders);
            request.setAttribute("lowStockProducts", lowStockProducts);
            request.setAttribute("lowestStockProduct", lowestStockProduct);
            request.setAttribute("mostOrderedProduct", mostOrderedProduct);
            request.setAttribute("mostReviewedProduct", mostReviewedProduct);

            request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            // Safe fallback values allow the dashboard page to load even when database data cannot be fetched.
            request.setAttribute("adminMessage", "<p class='error-message'>Unable to load dashboard data.</p>");
            request.setAttribute("userRows", "<tr><td colspan='4'>No users found.</td></tr>");
            request.setAttribute("productRows", "<tr><td colspan='9'>No products found.</td></tr>");
            request.setAttribute("orderRows", "<tr><td colspan='6'>No orders found.</td></tr>");
            request.setAttribute("recentOrderRows", "<tr><td colspan='3'>No recent orders found.</td></tr>");
            request.setAttribute("contactRows", "<tr><td colspan='6'>No contact messages found.</td></tr>");
            request.setAttribute("totalRevenue", "0.00");
            request.setAttribute("totalOrders", 0);
            request.setAttribute("totalCustomers", 0);
            request.setAttribute("totalProducts", 0);
            request.setAttribute("pendingOrders", 0);
            request.setAttribute("deliveredOrders", 0);
            request.setAttribute("lowStockProducts", 0);
            request.setAttribute("lowestStockProduct", "No low stock products");
            request.setAttribute("mostOrderedProduct", "No orders yet");
            request.setAttribute("mostReviewedProduct", "No reviews yet");

            request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

    private String safeValue(String value) {
        if (value == null) {
            return "";
        }

        return value;
    }

    private String htmlEscape(String value) {
        if (value == null) {
            return "";
        }

        return value
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#x27;");
    }
}