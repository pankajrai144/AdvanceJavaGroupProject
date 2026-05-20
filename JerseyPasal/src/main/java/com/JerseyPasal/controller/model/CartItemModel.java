package com.JerseyPasal.controller.model;

public class CartItemModel {

    private int cartItemId;
    private int cartId;
    private int productId;
    private ProductModel product;
    private String selectedSize;
    private int quantity;
    private String addedAt;

    public CartItemModel() {
    }

    public CartItemModel(int cartItemId, int cartId, int productId, String selectedSize, int quantity, String addedAt) {
        this.cartItemId = cartItemId;
        this.cartId = cartId;
        this.productId = productId;
        this.selectedSize = selectedSize;
        this.quantity = quantity;
        this.addedAt = addedAt;
    }

    public CartItemModel(int cartItemId, int cartId, ProductModel product, String selectedSize, int quantity, String addedAt) {
        this.cartItemId = cartItemId;
        this.cartId = cartId;

        // Product object is used when the cart page needs full jersey details, not only the product id.
        this.product = product;

        this.selectedSize = selectedSize;
        this.quantity = quantity;
        this.addedAt = addedAt;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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

    public String getSelectedSize() {
        return selectedSize;
    }

    public void setSelectedSize(String selectedSize) {
        this.selectedSize = selectedSize;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getAddedAt() {
        return addedAt;
    }

    public void setAddedAt(String addedAt) {
        this.addedAt = addedAt;
    }
}