package com.JerseyPasal.controller.model;

public class OrderItemModel {

    private int orderItemId;
    private int orderId;
    private int productId;
    private ProductModel product;
    private String selectedSize;
    private int quantity;
    private double priceEach;
    private double itemTotal;

    public OrderItemModel() {
    }

    public OrderItemModel(int orderItemId, int orderId, int productId, String selectedSize, int quantity, double priceEach, double itemTotal) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.productId = productId;
        this.selectedSize = selectedSize;
        this.quantity = quantity;
        this.priceEach = priceEach;
        this.itemTotal = itemTotal;
    }

    public OrderItemModel(int orderId, int productId, String selectedSize, int quantity, double priceEach, double itemTotal) {
        this.orderId = orderId;
        this.productId = productId;
        this.selectedSize = selectedSize;
        this.quantity = quantity;
        this.priceEach = priceEach;
        this.itemTotal = itemTotal;
    }

    public OrderItemModel(int orderItemId, int orderId, ProductModel product, String selectedSize, int quantity, double priceEach, double itemTotal) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.product = product;
        this.selectedSize = selectedSize;
        this.quantity = quantity;
        this.priceEach = priceEach;
        this.itemTotal = itemTotal;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
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


    public double getPriceEach() {
        return priceEach;
    }

    public void setPriceEach(double priceEach) {
        this.priceEach = priceEach;
    }

    public double getItemTotal() {
        return itemTotal;
    }

    public void setItemTotal(double itemTotal) {
        this.itemTotal = itemTotal;
    }
}