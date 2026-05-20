package com.JerseyPasal.controller.model;

public class ReviewModel {

    private int reviewId;
    private int userId;
    private int productId;
    private int orderId;
    private int rating;
    private String reviewText;
    private String recommend;
    private String reviewDate;
    private ProductModel product;
    private UserModel user;

    public ReviewModel() {
    }

    public ReviewModel(int reviewId, int userId, int productId, int orderId, int rating, String reviewText, String recommend, String reviewDate) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.productId = productId;
        this.orderId = orderId;
        this.rating = rating;
        this.reviewText = reviewText;
        this.recommend = recommend;
        this.reviewDate = reviewDate;
    }

    public ReviewModel(int userId, int productId, int orderId, int rating, String reviewText, String recommend) {
        this.userId = userId;
        this.productId = productId;
        this.orderId = orderId;
        this.rating = rating;
        this.reviewText = reviewText;
        this.recommend = recommend;
    }

    public ReviewModel(int reviewId, int userId, int productId, int orderId, int rating, String reviewText, String recommend, String reviewDate, ProductModel product, UserModel user) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.productId = productId;
        this.orderId = orderId;
        this.rating = rating;
        this.reviewText = reviewText;
        this.recommend = recommend;
        this.reviewDate = reviewDate;

        // Product details are included when reviews need to show the related jersey information.
        this.product = product;

        // User details are included when reviews need to show who wrote them.
        this.user = user;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    public String getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(String reviewDate) {
        this.reviewDate = reviewDate;
    }

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }
}