package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.JerseyPasal.controller.model.CartModel;
import com.JerseyPasal.controller.model.ProductModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class CartDAO {

    public int getOrCreateCartId(int userId) throws Exception {

        Connection con = DBconfig.getConnection();

        String selectSql = "SELECT cart_id FROM cart WHERE user_id = ?";
        PreparedStatement selectPst = con.prepareStatement(selectSql);
        selectPst.setInt(1, userId);

        ResultSet rs = selectPst.executeQuery();

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

        if (generatedKeys.next()) {
            cartId = generatedKeys.getInt(1);
        }

        generatedKeys.close();
        insertPst.close();
        con.close();

        return cartId;
    }

    public boolean addProductToCart(int userId, int productId, String selectedSize) throws Exception {

        int cartId = getOrCreateCartId(userId);

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO cart_items (cart_id, product_id, selected_size, quantity) "
                   + "VALUES (?, ?, ?, 1) "
                   + "ON DUPLICATE KEY UPDATE quantity = quantity + 1";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, cartId);
        pst.setInt(2, productId);
        pst.setString(3, selectedSize.trim().toUpperCase());

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public ArrayList<CartModel> getCartItemsByUserId(int userId) throws Exception {

        ArrayList<CartModel> cartItems = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT ci.cart_item_id, ci.cart_id, ci.product_id, ci.selected_size, ci.quantity, "
                   + "p.jersey_name, p.team_name, p.size, p.season, p.price, p.stock_quantity, "
                   + "p.category, p.description, p.product_image, p.product_image_2, p.product_image_3, p.product_image_4 "
                   + "FROM cart_items ci "
                   + "INNER JOIN cart c ON ci.cart_id = c.cart_id "
                   + "INNER JOIN products p ON ci.product_id = p.product_id "
                   + "WHERE c.user_id = ? "
                   + "ORDER BY ci.cart_item_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);

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

            CartModel item = new CartModel();

            item.setCartItemId(rs.getInt("cart_item_id"));
            item.setCartId(rs.getInt("cart_id"));
            item.setProduct(product);
            item.setSelectedSize(rs.getString("selected_size"));
            item.setQuantity(rs.getInt("quantity"));

            cartItems.add(item);
        }

        rs.close();
        pst.close();
        con.close();

        return cartItems;
    }

    public boolean increaseCartItem(int userId, int productId, String selectedSize) throws Exception {

        int cartId = getOrCreateCartId(userId);

        Connection con = DBconfig.getConnection();

        String sql = "UPDATE cart_items "
                   + "SET quantity = quantity + 1 "
                   + "WHERE cart_id = ? AND product_id = ? AND selected_size = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, cartId);
        pst.setInt(2, productId);
        pst.setString(3, selectedSize.trim().toUpperCase());

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean decreaseCartItem(int userId, int productId, String selectedSize) throws Exception {

        int cartId = getOrCreateCartId(userId);
        int quantity = getCartItemQuantity(cartId, productId, selectedSize);

        if (quantity <= 1) {
            return removeCartItem(userId, productId, selectedSize);
        }

        Connection con = DBconfig.getConnection();

        String sql = "UPDATE cart_items "
                   + "SET quantity = quantity - 1 "
                   + "WHERE cart_id = ? AND product_id = ? AND selected_size = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, cartId);
        pst.setInt(2, productId);
        pst.setString(3, selectedSize.trim().toUpperCase());

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean removeCartItem(int userId, int productId, String selectedSize) throws Exception {

        int cartId = getOrCreateCartId(userId);

        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM cart_items "
                   + "WHERE cart_id = ? AND product_id = ? AND selected_size = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, cartId);
        pst.setInt(2, productId);
        pst.setString(3, selectedSize.trim().toUpperCase());

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean clearCart(int userId) throws Exception {

        int cartId = getOrCreateCartId(userId);

        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM cart_items WHERE cart_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, cartId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public double calculateCartTotal(ArrayList<CartModel> cartItems) {

        double total = 0.0;

        for (CartModel item : cartItems) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }

        return total;
    }

    private int getCartItemQuantity(int cartId, int productId, String selectedSize) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "SELECT quantity FROM cart_items "
                   + "WHERE cart_id = ? AND product_id = ? AND selected_size = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, cartId);
        pst.setInt(2, productId);
        pst.setString(3, selectedSize.trim().toUpperCase());

        ResultSet rs = pst.executeQuery();

        int quantity = 0;

        if (rs.next()) {
            quantity = rs.getInt("quantity");
        }

        rs.close();
        pst.close();
        con.close();

        return quantity;
    }
}