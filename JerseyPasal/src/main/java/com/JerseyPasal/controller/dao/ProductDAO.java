package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.JerseyPasal.controller.model.ProductModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class ProductDAO {

    public boolean addProduct(ProductModel product) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO products "
                   + "(jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, product.getJerseyName());
        pst.setString(2, product.getTeamName());
        pst.setString(3, product.getSize());
        pst.setString(4, product.getSeason());
        pst.setDouble(5, product.getPrice());
        pst.setInt(6, product.getStockQuantity());
        pst.setString(7, product.getCategory());
        pst.setString(8, product.getDescription());
        pst.setString(9, product.getProductImage());

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public ArrayList<ProductModel> getAllProducts() throws Exception {

        ArrayList<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image "
                   + "FROM products "
                   + "ORDER BY product_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

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

            products.add(product);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }

    public ProductModel getProductById(int productId) throws Exception {

        ProductModel product = null;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image "
                   + "FROM products "
                   + "WHERE product_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, productId);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            product = new ProductModel();

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
        }

        rs.close();
        pst.close();
        con.close();

        return product;
    }

    public boolean updateProduct(ProductModel product) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "UPDATE products "
                   + "SET jersey_name = ?, team_name = ?, size = ?, season = ?, price = ?, stock_quantity = ?, category = ?, description = ?, product_image = ? "
                   + "WHERE product_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, product.getJerseyName());
        pst.setString(2, product.getTeamName());
        pst.setString(3, product.getSize());
        pst.setString(4, product.getSeason());
        pst.setDouble(5, product.getPrice());
        pst.setInt(6, product.getStockQuantity());
        pst.setString(7, product.getCategory());
        pst.setString(8, product.getDescription());
        pst.setString(9, product.getProductImage());
        pst.setInt(10, product.getProductId());

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean deleteProduct(int productId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM products WHERE product_id = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, productId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }
}