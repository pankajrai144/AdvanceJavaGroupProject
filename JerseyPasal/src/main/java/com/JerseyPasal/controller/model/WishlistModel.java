package com.JerseyPasal.controller.model;

public class WishlistModel {

    private int wishlistId;
    private int userId;
    private int productId;
    private ProductModel product;
    private String addedAt;

    public WishlistModel() {
    }

    public WishlistModel(int wishlistId, int userId, int productId, String addedAt) {
        this.wishlistId = wishlistId;
        this.userId = userId;
        this.productId = productId;
        this.addedAt = addedAt;
    }

    public WishlistModel(int wishlistId, int userId, ProductModel product, String addedAt) {
        this.wishlistId = wishlistId;
        this.userId = userId;
        this.product = product;
        this.addedAt = addedAt;
    }

    public int getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(int wishlistId) {
        this.wishlistId = wishlistId;
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

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    public String getAddedAt() {
        return addedAt;
    }

    public void setAddedAt(String addedAt) {
        this.addedAt = addedAt;
    }
}
