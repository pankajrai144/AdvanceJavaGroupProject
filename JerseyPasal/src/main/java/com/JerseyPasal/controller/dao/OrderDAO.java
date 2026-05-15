package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.JerseyPasal.controller.model.OrderModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class OrderDAO {

    public int createOrder(OrderModel order) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO orders (user_id, order_total, order_status) VALUES (?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        pst.setInt(1, order.getUserId());
        pst.setDouble(2, order.getOrderTotal());
        pst.setString(3, order.getOrderStatus());

        pst.executeUpdate();

        ResultSet generatedKeys = pst.getGeneratedKeys();

        int orderId = 0;

        if (generatedKeys.next()) {
            orderId = generatedKeys.getInt(1);
        }

        generatedKeys.close();
        pst.close();
        con.close();

        return orderId;
    }

    public OrderModel getOrderById(int orderId) throws Exception {

        OrderModel order = null;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT order_id, user_id, order_total, order_status, order_date FROM orders WHERE order_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, orderId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            order = new OrderModel();

            order.setOrderId(rs.getInt("order_id"));
            order.setUserId(rs.getInt("user_id"));
            order.setOrderTotal(rs.getDouble("order_total"));
            order.setOrderStatus(rs.getString("order_status"));
            order.setOrderDate(rs.getString("order_date"));
        }

        rs.close();
        pst.close();
        con.close();

        return order;
    }

    public boolean updateOrderStatus(int orderId, String orderStatus) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "UPDATE orders SET order_status = ? WHERE order_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, orderStatus);
        pst.setInt(2, orderId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean deleteOrder(int orderId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM orders WHERE order_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, orderId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }
}