package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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

        // The new order id is needed to save related order items after creating the order.
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

        String sql = "SELECT o.order_id, o.user_id, o.order_total, o.order_status, o.order_date, u.fullname "
                   + "FROM orders o "
                   + "INNER JOIN users u ON o.user_id = u.user_id "
                   + "WHERE o.order_id = ?";

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

            // Customer name is loaded with the order so the admin can identify who placed it.
            order.setCustomerName(rs.getString("fullname"));
        }

        rs.close();
        pst.close();
        con.close();

        return order;
    }

    public ArrayList<OrderModel> getAllOrders() throws Exception {

        ArrayList<OrderModel> orders = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT o.order_id, o.user_id, o.order_total, o.order_status, o.order_date, u.fullname "
                   + "FROM orders o "
                   + "INNER JOIN users u ON o.user_id = u.user_id "
                   + "ORDER BY o.order_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            OrderModel order = new OrderModel();

            order.setOrderId(rs.getInt("order_id"));
            order.setUserId(rs.getInt("user_id"));
            order.setOrderTotal(rs.getDouble("order_total"));
            order.setOrderStatus(rs.getString("order_status"));
            order.setOrderDate(rs.getString("order_date"));
            order.setCustomerName(rs.getString("fullname"));

            orders.add(order);
        }

        rs.close();
        pst.close();
        con.close();

        return orders;
    }

    public ArrayList<OrderModel> getOrdersByUserId(int userId) throws Exception {

        ArrayList<OrderModel> orders = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT o.order_id, o.user_id, o.order_total, o.order_status, o.order_date, u.fullname "
                   + "FROM orders o "
                   + "INNER JOIN users u ON o.user_id = u.user_id "
                   + "WHERE o.user_id = ? "
                   + "ORDER BY o.order_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            OrderModel order = new OrderModel();

            order.setOrderId(rs.getInt("order_id"));
            order.setUserId(rs.getInt("user_id"));
            order.setOrderTotal(rs.getDouble("order_total"));
            order.setOrderStatus(rs.getString("order_status"));
            order.setOrderDate(rs.getString("order_date"));
            order.setCustomerName(rs.getString("fullname"));

            orders.add(order);
        }

        rs.close();
        pst.close();
        con.close();

        return orders;
    }

    public ArrayList<OrderModel> getOrdersByStatus(String orderStatus) throws Exception {

        ArrayList<OrderModel> orders = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT o.order_id, o.user_id, o.order_total, o.order_status, o.order_date, u.fullname "
                   + "FROM orders o "
                   + "INNER JOIN users u ON o.user_id = u.user_id "
                   + "WHERE o.order_status = ? "
                   + "ORDER BY o.order_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, orderStatus);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            OrderModel order = new OrderModel();

            order.setOrderId(rs.getInt("order_id"));
            order.setUserId(rs.getInt("user_id"));
            order.setOrderTotal(rs.getDouble("order_total"));
            order.setOrderStatus(rs.getString("order_status"));
            order.setOrderDate(rs.getString("order_date"));
            order.setCustomerName(rs.getString("fullname"));

            orders.add(order);
        }

        rs.close();
        pst.close();
        con.close();

        return orders;
    }

    public int getOrderCountByStatus(String orderStatus) throws Exception {

        int orderCount = 0;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT COUNT(*) AS total FROM orders WHERE order_status = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, orderStatus);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            orderCount = rs.getInt("total");
        }

        rs.close();
        pst.close();
        con.close();

        return orderCount;
    }

    public String getMostOrderedProduct() throws Exception {

        String mostOrderedProduct = "No orders yet";

        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.jersey_name, p.team_name, SUM(oi.quantity) AS total_ordered "
                   + "FROM order_items oi "
                   + "INNER JOIN products p ON oi.product_id = p.product_id "
                   + "INNER JOIN orders o ON oi.order_id = o.order_id "
                   + "WHERE o.order_status <> 'Cancelled' "
                   + "GROUP BY p.product_id, p.jersey_name, p.team_name "
                   + "ORDER BY total_ordered DESC "
                   + "LIMIT 1";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        // Cancelled orders are ignored so the result shows only successful order demand.
        if (rs.next()) {
            mostOrderedProduct = rs.getString("jersey_name") + " - " + rs.getString("team_name");
        }

        rs.close();
        pst.close();
        con.close();

        return mostOrderedProduct;
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