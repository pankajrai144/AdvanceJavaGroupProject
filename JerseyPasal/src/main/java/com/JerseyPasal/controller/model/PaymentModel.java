package com.JerseyPasal.controller.model;

public class PaymentModel {

    private int paymentId;
    private int orderId;
    private int userId;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String paymentMethod;
    private String cardHolderName;
    private String cardLastFour;
    private double amount;
    private String paymentStatus;
    private String paymentDate;

    public PaymentModel() {
    }

    public PaymentModel(int paymentId, int orderId, int userId, String fullName, String email, String phone,
                        String address, String paymentMethod, String cardHolderName, String cardLastFour,
                        double amount, String paymentStatus, String paymentDate) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.cardHolderName = cardHolderName;

        // Only the last four card digits are kept for display and reference.
        this.cardLastFour = cardLastFour;

        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.paymentDate = paymentDate;
    }

    public PaymentModel(int orderId, int userId, String fullName, String email, String phone,
                        String address, String paymentMethod, String cardHolderName,
                        String cardLastFour, double amount, String paymentStatus) {
        this.orderId = orderId;
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.cardHolderName = cardHolderName;

        // Only the last four card digits are kept for display and reference.
        this.cardLastFour = cardLastFour;

        this.amount = amount;
        this.paymentStatus = paymentStatus;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
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


    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }


    public String getCardHolderName() {
        return cardHolderName;
    }

    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }


    public String getCardLastFour() {
        return cardLastFour;
    }

    public void setCardLastFour(String cardLastFour) {
        // Full card numbers should not be stored in this model.
        this.cardLastFour = cardLastFour;
    }


    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }


    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }


    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }
}