package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.dao.UserDAO;
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

        if (userRole == null || !userRole.equalsIgnoreCase("admin")) {
            response.sendRedirect(request.getContextPath() + "/userdashboard");
            return;
        }

        try {
            UserDAO dao = new UserDAO();
            ProductDAO productDAO = new ProductDAO();

            ArrayList<HashMap<String, String>> users = dao.getAllUsers();
            ArrayList<ProductModel> products = productDAO.getAllProducts();

            String adminMessage = "";

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
                adminMessage = "<p class='error-message'>Size must be S, M, L, XL, or XXL.</p>";
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

                        actionHtml =
                                "<form action='" + request.getContextPath() + "/approveuser' method='post' " +
                                "onsubmit=\"return confirm('Are you sure you want to approve this user?');\">" +
                                "<input type='hidden' name='userid' value='" + userid + "'>" +
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
                    productRows.append("<td>").append(product.getJerseyName()).append("</td>");
                    productRows.append("<td>").append(product.getTeamName()).append("</td>");
                    productRows.append("<td>").append(product.getSize()).append("</td>");
                    productRows.append("<td>").append(product.getSeason()).append("</td>");
                    productRows.append("<td>$").append(product.getPrice()).append("</td>");
                    productRows.append("<td>").append(product.getStockQuantity()).append("</td>");
                    productRows.append("<td>").append(product.getCategory()).append("</td>");
                    productRows.append("<td>").append(actionHtml).append("</td>");
                    productRows.append("</tr>");
                }

            } else {
                productRows.append("<tr>");
                productRows.append("<td colspan='9'>No products found.</td>");
                productRows.append("</tr>");
            }

            request.setAttribute("adminMessage", adminMessage);
            request.setAttribute("userRows", userRows.toString());
            request.setAttribute("productRows", productRows.toString());

            request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("adminMessage", "<p class='error-message'>Unable to load dashboard data.</p>");
            request.setAttribute("userRows", "<tr><td colspan='4'>No users found.</td></tr>");
            request.setAttribute("productRows", "<tr><td colspan='9'>No products found.</td></tr>");
            request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}