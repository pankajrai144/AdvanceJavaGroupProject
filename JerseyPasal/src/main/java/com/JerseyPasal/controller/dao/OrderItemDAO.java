package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.JerseyPasal.controller.model.CartItemModel;
import com.JerseyPasal.controller.model.OrderItemModel;
import com.JerseyPasal.controller.model.ProductModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class OrderItemDAO {

    public boolean addOrderItem(OrderItemModel item) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO order_items (order_id, product_id, selected_size, quantity, price_each, item_total) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, item.getOrderId());
        pst.setInt(2, item.getProductId());
        pst.setString(3, item.getSelectedSize());
        pst.setInt(4, item.getQuantity());
        pst.setDouble(5, item.getPriceEach());
        pst.setDouble(6, item.getItemTotal());

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean addCartItemsToOrder(int orderId, ArrayList<CartItemModel> cartItems) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO order_items (order_id, product_id, selected_size, quantity, price_each, item_total) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        for (CartItemModel cartItem : cartItems) {
            double priceEach = cartItem.getProduct().getPrice();

            // The item total is saved at checkout so the order keeps the correct price record.
            double itemTotal = priceEach * cartItem.getQuantity();

            pst.setInt(1, orderId);
            pst.setInt(2, cartItem.getProduct().getProductId());
            pst.setString(3, cartItem.getSelectedSize());
            pst.setInt(4, cartItem.getQuantity());
            pst.setDouble(5, priceEach);
            pst.setDouble(6, itemTotal);

            pst.addBatch();
        }

        int[] rows = pst.executeBatch();

        pst.close();
        con.close();

        return rows.length == cartItems.size();
    }

    public ArrayList<OrderItemModel> getOrderItemsByOrderId(int orderId) throws Exception {

        ArrayList<OrderItemModel> orderItems = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT oi.order_item_id, oi.order_id, oi.product_id, oi.selected_size, oi.quantity, "
                   + "oi.price_each, oi.item_total, "
                   + "p.jersey_name, p.team_name, p.size, p.season, p.price, p.stock_quantity, "
                   + "p.category, p.description, p.product_image, p.product_image_2, p.product_image_3, p.product_image_4 "
                   + "FROM order_items oi "
                   + "INNER JOIN products p ON oi.product_id = p.product_id "
                   + "WHERE oi.order_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, orderId);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            ProductModel product = new ProductModel();

            product.setProductId(rs.getInt("product_id"));
            product.setJerseyName(rs.getString("jersey_name"));
            product.setTeamName(rs.getString("team_name"));
            product.setSize(rs.getString("size"));
            product.setSeason(rs.getString("season"));
            product.setPrice(rs.getDouble("price"));
            product.setStockQuantity(rs.getInt("stock_quantity"));
            product.setCategory(rs.getString("category"));
            product.setDescription(rs.getString("description"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductImage2(rs.getString("product_image_2"));
            product.setProductImage3(rs.getString("product_image_3"));
            product.setProductImage4(rs.getString("product_image_4"));

            OrderItemModel item = new OrderItemModel();

            item.setOrderItemId(rs.getInt("order_item_id"));
            item.setOrderId(rs.getInt("order_id"));
            item.setProductId(rs.getInt("product_id"));

            // Product details are attached so the order page can show the jersey information clearly.
            item.setProduct(product);

            item.setSelectedSize(rs.getString("selected_size"));
            item.setQuantity(rs.getInt("quantity"));
            item.setPriceEach(rs.getDouble("price_each"));
            item.setItemTotal(rs.getDouble("item_total"));

            orderItems.add(item);
        }

        rs.close();
        pst.close();
        con.close();

        return orderItems;
    }

    public boolean deleteOrderItemsByOrderId(int orderId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM order_items WHERE order_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, orderId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }
}