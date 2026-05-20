package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.JerseyPasal.controller.model.CartModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class CartDAO {

    public int getOrCreateCartId(int userId) throws Exception {

        Connection con = DBconfig.getConnection();

        String selectSql = "SELECT cart_id FROM cart WHERE user_id = ?";
        PreparedStatement selectPst = con.prepareStatement(selectSql);
        selectPst.setInt(1, userId);

        ResultSet rs = selectPst.executeQuery();

        // If the user already has a cart, the same cart is reused.
        if (rs.next()) {
            int cartId = rs.getInt("cart_id");

            rs.close();
            selectPst.close();
            con.close();

            return cartId;
        }

        rs.close();
        selectPst.close();

        String insertSql = "INSERT INTO cart (user_id) VALUES (?)";
        PreparedStatement insertPst = con.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);
        insertPst.setInt(1, userId);

        insertPst.executeUpdate();

        ResultSet generatedKeys = insertPst.getGeneratedKeys();

        int cartId = 0;

        // The generated cart id is needed so items can be added to this new cart later.
        if (generatedKeys.next()) {
            cartId = generatedKeys.getInt(1);
        }

        generatedKeys.close();
        insertPst.close();
        con.close();

        return cartId;
    }

    public CartModel getCartByUserId(int userId) throws Exception {

        CartModel cart = null;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT cart_id, user_id, created_at, updated_at FROM cart WHERE user_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, userId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            cart = new CartModel();

            cart.setCartId(rs.getInt("cart_id"));
            cart.setUserId(rs.getInt("user_id"));
            cart.setCreatedAt(rs.getString("created_at"));
            cart.setUpdatedAt(rs.getString("updated_at"));
        }

        rs.close();
        pst.close();
        con.close();

        return cart;
    }

    public CartModel getCartByCartId(int cartId) throws Exception {

        CartModel cart = null;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT cart_id, user_id, created_at, updated_at FROM cart WHERE cart_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, cartId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            cart = new CartModel();

            cart.setCartId(rs.getInt("cart_id"));
            cart.setUserId(rs.getInt("user_id"));
            cart.setCreatedAt(rs.getString("created_at"));
            cart.setUpdatedAt(rs.getString("updated_at"));
        }

        rs.close();
        pst.close();
        con.close();

        return cart;
    }

    public boolean deleteCartByUserId(int userId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM cart WHERE user_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, userId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public int getCartCountByUserId(int userId) throws Exception {

        int cartCount = 0;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT COALESCE(SUM(ci.quantity), 0) AS total "
                   + "FROM cart c "
                   + "INNER JOIN cart_items ci ON c.cart_id = ci.cart_id "
                   + "WHERE c.user_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, userId);

        ResultSet rs = pst.executeQuery();

        // COALESCE keeps the count as 0 when the user has no items in the cart.
        if (rs.next()) {
            cartCount = rs.getInt("total");
        }

        rs.close();
        pst.close();
        con.close();

        return cartCount;
    }
}