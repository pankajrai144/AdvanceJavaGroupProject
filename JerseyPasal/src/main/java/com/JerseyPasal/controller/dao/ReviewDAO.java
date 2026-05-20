package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.JerseyPasal.controller.model.ProductModel;
import com.JerseyPasal.controller.model.ReviewModel;
import com.JerseyPasal.controller.model.UserModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class ReviewDAO {

    public boolean addReview(ReviewModel review) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO reviews (user_id, product_id, order_id, rating, review_text, recommend) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, review.getUserId());
        pst.setInt(2, review.getProductId());
        pst.setInt(3, review.getOrderId());
        pst.setInt(4, review.getRating());
        pst.setString(5, review.getReviewText());
        pst.setString(6, review.getRecommend());

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean hasUserReviewedProduct(int userId, int productId) throws Exception {

        boolean exists = false;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT review_id FROM reviews WHERE user_id = ? AND product_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);
        pst.setInt(2, productId);

        ResultSet rs = pst.executeQuery();

        // This prevents the same user from reviewing the same product more than once.
        if (rs.next()) {
            exists = true;
        }

        rs.close();
        pst.close();
        con.close();

        return exists;
    }

    public boolean canUserReviewProduct(int userId, int productId, int orderId) throws Exception {

        boolean canReview = false;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT o.order_id "
                   + "FROM orders o "
                   + "INNER JOIN order_items oi ON o.order_id = oi.order_id "
                   + "WHERE o.user_id = ? "
                   + "AND oi.product_id = ? "
                   + "AND o.order_id = ? "
                   + "AND o.order_status = 'Delivered'";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);
        pst.setInt(2, productId);
        pst.setInt(3, orderId);

        ResultSet rs = pst.executeQuery();

        // Reviews are allowed only after the user has bought and received the product.
        if (rs.next()) {
            canReview = true;
        }

        rs.close();
        pst.close();
        con.close();

        return canReview;
    }

    public ArrayList<ReviewModel> getReviewsByProductId(int productId) throws Exception {

        ArrayList<ReviewModel> reviews = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT r.review_id, r.user_id, r.product_id, r.order_id, r.rating, r.review_text, "
                   + "r.recommend, r.review_date, u.fullname "
                   + "FROM reviews r "
                   + "INNER JOIN users u ON r.user_id = u.user_id "
                   + "WHERE r.product_id = ? "
                   + "ORDER BY r.review_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, productId);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            UserModel user = new UserModel();
            user.setUserid(rs.getInt("user_id"));
            user.setFullname(rs.getString("fullname"));

            ReviewModel review = new ReviewModel();

            review.setReviewId(rs.getInt("review_id"));
            review.setUserId(rs.getInt("user_id"));
            review.setProductId(rs.getInt("product_id"));
            review.setOrderId(rs.getInt("order_id"));
            review.setRating(rs.getInt("rating"));
            review.setReviewText(rs.getString("review_text"));
            review.setRecommend(rs.getString("recommend"));
            review.setReviewDate(rs.getString("review_date"));

            // User details are attached so the product page can show who wrote the review.
            review.setUser(user);

            reviews.add(review);
        }

        rs.close();
        pst.close();
        con.close();

        return reviews;
    }

    public ArrayList<ReviewModel> getAllReviews() throws Exception {

        ArrayList<ReviewModel> reviews = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT r.review_id, r.user_id, r.product_id, r.order_id, r.rating, r.review_text, "
                   + "r.recommend, r.review_date, u.fullname, "
                   + "p.jersey_name, p.team_name, p.category, p.price, p.product_image "
                   + "FROM reviews r "
                   + "INNER JOIN users u ON r.user_id = u.user_id "
                   + "INNER JOIN products p ON r.product_id = p.product_id "
                   + "ORDER BY r.review_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            UserModel user = new UserModel();
            user.setUserid(rs.getInt("user_id"));
            user.setFullname(rs.getString("fullname"));

            ProductModel product = new ProductModel();
            product.setProductId(rs.getInt("product_id"));
            product.setJerseyName(rs.getString("jersey_name"));
            product.setTeamName(rs.getString("team_name"));
            product.setCategory(rs.getString("category"));
            product.setPrice(rs.getDouble("price"));
            product.setProductImage(rs.getString("product_image"));

            ReviewModel review = new ReviewModel();

            review.setReviewId(rs.getInt("review_id"));
            review.setUserId(rs.getInt("user_id"));
            review.setProductId(rs.getInt("product_id"));
            review.setOrderId(rs.getInt("order_id"));
            review.setRating(rs.getInt("rating"));
            review.setReviewText(rs.getString("review_text"));
            review.setRecommend(rs.getString("recommend"));
            review.setReviewDate(rs.getString("review_date"));

            // User and product details are included so the admin can understand each review clearly.
            review.setUser(user);
            review.setProduct(product);

            reviews.add(review);
        }

        rs.close();
        pst.close();
        con.close();

        return reviews;
    }

    public double getAverageRatingByProductId(int productId) throws Exception {

        double averageRating = 0.0;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT AVG(rating) AS average_rating FROM reviews WHERE product_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, productId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            averageRating = rs.getDouble("average_rating");
        }

        rs.close();
        pst.close();
        con.close();

        return averageRating;
    }

    public int getReviewCountByProductId(int productId) throws Exception {

        int reviewCount = 0;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT COUNT(*) AS total FROM reviews WHERE product_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, productId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            reviewCount = rs.getInt("total");
        }

        rs.close();
        pst.close();
        con.close();

        return reviewCount;
    }

    public int getReviewCountByUserId(int userId) throws Exception {

        int reviewCount = 0;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT COUNT(*) AS total FROM reviews WHERE user_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            reviewCount = rs.getInt("total");
        }

        rs.close();
        pst.close();
        con.close();

        return reviewCount;
    }

    public String getMostReviewedProduct() throws Exception {

        String mostReviewedProduct = "No reviews yet";

        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.jersey_name, p.team_name, COUNT(r.review_id) AS total_reviews "
                   + "FROM reviews r "
                   + "INNER JOIN products p ON r.product_id = p.product_id "
                   + "GROUP BY p.product_id, p.jersey_name, p.team_name "
                   + "ORDER BY total_reviews DESC "
                   + "LIMIT 1";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        // This gives a simple dashboard summary of the product with the most customer feedback.
        if (rs.next()) {
            mostReviewedProduct = rs.getString("jersey_name") + " - " + rs.getString("team_name") + " (" + rs.getInt("total_reviews") + " reviews)";
        }

        rs.close();
        pst.close();
        con.close();

        return mostReviewedProduct;
    }

    public boolean deleteReview(int reviewId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM reviews WHERE review_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, reviewId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }
}