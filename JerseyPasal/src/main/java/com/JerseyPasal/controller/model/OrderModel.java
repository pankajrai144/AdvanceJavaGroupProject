package com.JerseyPasal.controller.model;

// This model stores the main order details used for user orders and admin order management.
public class OrderModel {

    private int orderId;
    private int userId;
    private double orderTotal;
    private String orderStatus;
    private String orderDate;
    private String customerName;

    public OrderModel() {
    }

    public OrderModel(int orderId, int userId, double orderTotal, String orderStatus, String orderDate) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderTotal = orderTotal;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
    }

    public OrderModel(int orderId, int userId, double orderTotal, String orderStatus, String orderDate, String customerName) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderTotal = orderTotal;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
        this.customerName = customerName;
    }

    public OrderModel(int userId, double orderTotal, String orderStatus) {
        this.userId = userId;
        this.orderTotal = orderTotal;
        this.orderStatus = orderStatus;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(double orderTotal) {
        this.orderTotal = orderTotal;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}