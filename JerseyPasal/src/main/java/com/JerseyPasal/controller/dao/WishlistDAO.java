package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.JerseyPasal.controller.model.ProductModel;
import com.JerseyPasal.controller.model.WishlistModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class WishlistDAO {

    public boolean addToWishlist(int userId, int productId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT IGNORE INTO wishlist (user_id, product_id) VALUES (?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);
        pst.setInt(2, productId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean removeFromWishlist(int userId, int productId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM wishlist WHERE user_id = ? AND product_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);
        pst.setInt(2, productId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean isProductInWishlist(int userId, int productId) throws Exception {

        boolean exists = false;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT wishlist_id FROM wishlist WHERE user_id = ? AND product_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);
        pst.setInt(2, productId);

        ResultSet rs = pst.executeQuery();

        // This checks the wishlist status so the page can show the correct add or remove option.
        if (rs.next()) {
            exists = true;
        }

        rs.close();
        pst.close();
        con.close();

        return exists;
    }

    public ArrayList<WishlistModel> getWishlistByUserId(int userId) throws Exception {

        ArrayList<WishlistModel> wishlistItems = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT w.wishlist_id, w.user_id, w.product_id, w.added_at, "
                   + "p.jersey_name, p.team_name, p.size, p.season, p.price, p.stock_quantity, "
                   + "p.category, p.description, p.product_image, p.product_image_2, p.product_image_3, p.product_image_4 "
                   + "FROM wishlist w "
                   + "INNER JOIN products p ON w.product_id = p.product_id "
                   + "WHERE w.user_id = ? "
                   + "ORDER BY w.wishlist_id DESC";

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

            WishlistModel wishlist = new WishlistModel();

            wishlist.setWishlistId(rs.getInt("wishlist_id"));
            wishlist.setUserId(rs.getInt("user_id"));
            wishlist.setProductId(rs.getInt("product_id"));

            // Product details are attached so the wishlist page can display full jersey information.
            wishlist.setProduct(product);

            wishlist.setAddedAt(rs.getString("added_at"));

            wishlistItems.add(wishlist);
        }

        rs.close();
        pst.close();
        con.close();

        return wishlistItems;
    }

    public int getWishlistCountByUserId(int userId) throws Exception {

        int count = 0;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT COUNT(*) AS total FROM wishlist WHERE user_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            count = rs.getInt("total");
        }

        rs.close();
        pst.close();
        con.close();

        return count;
    }
}