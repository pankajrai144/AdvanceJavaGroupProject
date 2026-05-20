package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.JerseyPasal.controller.model.PaymentModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class PaymentDAO {

    public int createPayment(PaymentModel payment) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO payments (order_id, user_id, full_name, email, phone, address, payment_method, card_holder_name, card_last_four, amount, payment_status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        pst.setInt(1, payment.getOrderId());
        pst.setInt(2, payment.getUserId());
        pst.setString(3, payment.getFullName());
        pst.setString(4, payment.getEmail());
        pst.setString(5, payment.getPhone());
        pst.setString(6, payment.getAddress());
        pst.setString(7, payment.getPaymentMethod());
        pst.setString(8, payment.getCardHolderName());

        // Only the last four card digits are stored, not the full card number.
        pst.setString(9, payment.getCardLastFour());

        pst.setDouble(10, payment.getAmount());
        pst.setString(11, payment.getPaymentStatus());

        pst.executeUpdate();

        ResultSet generatedKeys = pst.getGeneratedKeys();

        int paymentId = 0;

        // The generated payment id is used to identify the saved payment record.
        if (generatedKeys.next()) {
            paymentId = generatedKeys.getInt(1);
        }

        generatedKeys.close();
        pst.close();
        con.close();

        return paymentId;
    }

    public PaymentModel getPaymentById(int paymentId) throws Exception {

        PaymentModel payment = null;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT payment_id, order_id, user_id, full_name, email, phone, address, payment_method, card_holder_name, card_last_four, amount, payment_status, payment_date "
                   + "FROM payments WHERE payment_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, paymentId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            payment = new PaymentModel();

            payment.setPaymentId(rs.getInt("payment_id"));
            payment.setOrderId(rs.getInt("order_id"));
            payment.setUserId(rs.getInt("user_id"));
            payment.setFullName(rs.getString("full_name"));
            payment.setEmail(rs.getString("email"));
            payment.setPhone(rs.getString("phone"));
            payment.setAddress(rs.getString("address"));
            payment.setPaymentMethod(rs.getString("payment_method"));
            payment.setCardHolderName(rs.getString("card_holder_name"));
            payment.setCardLastFour(rs.getString("card_last_four"));
            payment.setAmount(rs.getDouble("amount"));
            payment.setPaymentStatus(rs.getString("payment_status"));
            payment.setPaymentDate(rs.getString("payment_date"));
        }

        rs.close();
        pst.close();
        con.close();

        return payment;
    }

    public PaymentModel getPaymentByOrderId(int orderId) throws Exception {

        PaymentModel payment = null;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT payment_id, order_id, user_id, full_name, email, phone, address, payment_method, card_holder_name, card_last_four, amount, payment_status, payment_date "
                   + "FROM payments WHERE order_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, orderId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            payment = new PaymentModel();

            payment.setPaymentId(rs.getInt("payment_id"));
            payment.setOrderId(rs.getInt("order_id"));
            payment.setUserId(rs.getInt("user_id"));
            payment.setFullName(rs.getString("full_name"));
            payment.setEmail(rs.getString("email"));
            payment.setPhone(rs.getString("phone"));
            payment.setAddress(rs.getString("address"));
            payment.setPaymentMethod(rs.getString("payment_method"));
            payment.setCardHolderName(rs.getString("card_holder_name"));
            payment.setCardLastFour(rs.getString("card_last_four"));
            payment.setAmount(rs.getDouble("amount"));
            payment.setPaymentStatus(rs.getString("payment_status"));
            payment.setPaymentDate(rs.getString("payment_date"));
        }

        rs.close();
        pst.close();
        con.close();

        return payment;
    }

    public boolean updatePaymentStatus(int paymentId, String paymentStatus) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "UPDATE payments SET payment_status = ? WHERE payment_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, paymentStatus);
        pst.setInt(2, paymentId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }
}