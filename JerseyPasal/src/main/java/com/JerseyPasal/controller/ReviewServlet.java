package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.dao.ReviewDAO;
import com.JerseyPasal.controller.model.ProductModel;
import com.JerseyPasal.controller.model.ReviewModel;
import com.JerseyPasal.controller.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/review" })
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
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
            String orderIdValue = request.getParameter("orderId");

            if (productIdValue == null || productIdValue.trim().isEmpty() ||
                orderIdValue == null || orderIdValue.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/userdashboard");
                return;
            }

            int productId = Integer.parseInt(productIdValue);
            int orderId = Integer.parseInt(orderIdValue);

            ReviewDAO reviewDAO = new ReviewDAO();
            ProductDAO productDAO = new ProductDAO();

            // Review page is opened only for products from the user's delivered orders.
            boolean canReview = reviewDAO.canUserReviewProduct(userId, productId, orderId);

            if (!canReview) {
                request.setAttribute("error", "You can only review products from delivered orders.");
                request.getRequestDispatcher("/WEB-INF/pages/review.jsp").forward(request, response);
                return;
            }

            // A user should not submit more than one review for the same product.
            boolean alreadyReviewed = reviewDAO.hasUserReviewedProduct(userId, productId);

            if (alreadyReviewed) {
                request.setAttribute("error", "You have already reviewed this product.");
                request.getRequestDispatcher("/WEB-INF/pages/review.jsp").forward(request, response);
                return;
            }

            ProductModel product = productDAO.getProductById(productId);

            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/userdashboard");
                return;
            }

            request.setAttribute("product", product);
            request.setAttribute("productId", productId);
            request.setAttribute("orderId", orderId);

            request.getRequestDispatcher("/WEB-INF/pages/review.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to open review page.");
            request.getRequestDispatcher("/WEB-INF/pages/review.jsp").forward(request, response);
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

            String productIdValue = request.getParameter("productId");
            String orderIdValue = request.getParameter("orderId");
            String ratingValue = request.getParameter("rating");
            String reviewText = request.getParameter("reviewText");
            String recommend = request.getParameter("recommend");

            if (productIdValue == null || productIdValue.trim().isEmpty() ||
                orderIdValue == null || orderIdValue.trim().isEmpty() ||
                ratingValue == null || ratingValue.trim().isEmpty() ||
                reviewText == null || reviewText.trim().isEmpty() ||
                recommend == null || recommend.trim().isEmpty()) {

                request.setAttribute("error", "Please fill all review fields.");
                doGet(request, response);
                return;
            }

            int productId = Integer.parseInt(productIdValue);
            int orderId = Integer.parseInt(orderIdValue);
            int rating = Integer.parseInt(ratingValue);

            if (rating < 1 || rating > 5) {
                request.setAttribute("error", "Rating must be between 1 and 5.");
                doGet(request, response);
                return;
            }

            reviewText = reviewText.trim();

            if (reviewText.length() < 5 || reviewText.length() > 500) {
                request.setAttribute("error", "Review must be between 5 and 500 characters.");
                doGet(request, response);
                return;
            }

            if (!"Yes".equalsIgnoreCase(recommend) && !"No".equalsIgnoreCase(recommend)) {
                request.setAttribute("error", "Please select a valid recommendation option.");
                doGet(request, response);
                return;
            }

            ReviewDAO reviewDAO = new ReviewDAO();

            // Permission is checked again before saving in case the request was changed manually.
            boolean canReview = reviewDAO.canUserReviewProduct(userId, productId, orderId);

            if (!canReview) {
                request.setAttribute("error", "You can only review products from delivered orders.");
                doGet(request, response);
                return;
            }

            boolean alreadyReviewed = reviewDAO.hasUserReviewedProduct(userId, productId);

            if (alreadyReviewed) {
                request.setAttribute("error", "You have already reviewed this product.");
                doGet(request, response);
                return;
            }

            ReviewModel review = new ReviewModel(
                userId,
                productId,
                orderId,
                rating,
                reviewText,
                recommend
            );

            boolean saved = reviewDAO.addReview(review);

            if (saved) {
                response.sendRedirect(request.getContextPath() + "/userdashboard?reviewAdded=true");
            } else {
                request.setAttribute("error", "Review could not be submitted. Please try again.");
                doGet(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to submit review.");
            doGet(request, response);
        }
	}

}