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
                   + "(jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
        pst.setString(10, product.getProductImage2());
        pst.setString(11, product.getProductImage3());
        pst.setString(12, product.getProductImage4());

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public ArrayList<ProductModel> getAllProducts() throws Exception {

        ArrayList<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4 "
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
            product.setProductImage2(rs.getString("product_image_2"));
            product.setProductImage3(rs.getString("product_image_3"));
            product.setProductImage4(rs.getString("product_image_4"));

            products.add(product);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }

    public ArrayList<ProductModel> getProductsByPage(int start, int limit) throws Exception {

        ArrayList<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4 "
                   + "FROM products "
                   + "ORDER BY product_id DESC "
                   + "LIMIT ?, ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, start);
        pst.setInt(2, limit);

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

            products.add(product);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }

    public int getProductCount() throws Exception {

        int totalProducts = 0;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT COUNT(*) AS total FROM products";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            totalProducts = rs.getInt("total");
        }

        rs.close();
        pst.close();
        con.close();

        return totalProducts;
    }

    public ArrayList<ProductModel> getProductsByCategory(String category) throws Exception {

        ArrayList<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4 "
                   + "FROM products "
                   + "WHERE category = ? "
                   + "ORDER BY product_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, category);

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

            products.add(product);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }

    public ArrayList<ProductModel> getFilteredProductsByCategory(String category, String size, Double minPrice, Double maxPrice) throws Exception {

        ArrayList<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4 "
                   + "FROM products "
                   + "WHERE category = ? ";

        ArrayList<Object> values = new ArrayList<>();

        values.add(category);

        // Optional filters are added only when the user selects them.
        if (size != null && !size.trim().isEmpty()) {
            sql += "AND FIND_IN_SET(?, REPLACE(size, ' ', '')) > 0 ";
            values.add(size.trim());
        }

        if (minPrice != null) {
            sql += "AND price >= ? ";
            values.add(minPrice);
        }

        if (maxPrice != null) {
            sql += "AND price <= ? ";
            values.add(maxPrice);
        }

        sql += "ORDER BY product_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        // Values are bound after the query is built to keep filtering flexible and safe.
        for (int i = 0; i < values.size(); i++) {
            pst.setObject(i + 1, values.get(i));
        }

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

            products.add(product);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }

    public ArrayList<ProductModel> getFilteredProducts(String size, Double minPrice, Double maxPrice) throws Exception {

        ArrayList<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4 "
                   + "FROM products "
                   + "WHERE 1 = 1 ";

        ArrayList<Object> values = new ArrayList<>();

        // This method filters products across all categories.
        if (size != null && !size.trim().isEmpty()) {
            sql += "AND FIND_IN_SET(?, REPLACE(size, ' ', '')) > 0 ";
            values.add(size.trim());
        }

        if (minPrice != null) {
            sql += "AND price >= ? ";
            values.add(minPrice);
        }

        if (maxPrice != null) {
            sql += "AND price <= ? ";
            values.add(maxPrice);
        }

        sql += "ORDER BY product_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        for (int i = 0; i < values.size(); i++) {
            pst.setObject(i + 1, values.get(i));
        }

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

            products.add(product);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }

    public ArrayList<ProductModel> getTopSellingProducts() throws Exception {

        ArrayList<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4 "
                   + "FROM products "
                   + "WHERE stock_quantity > 0 "
                   + "ORDER BY stock_quantity ASC, product_id DESC "
                   + "LIMIT 3";

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
            product.setProductImage2(rs.getString("product_image_2"));
            product.setProductImage3(rs.getString("product_image_3"));
            product.setProductImage4(rs.getString("product_image_4"));

            products.add(product);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }

    public ArrayList<ProductModel> getNewArrivalProducts() throws Exception {

        ArrayList<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4 "
                   + "FROM products "
                   + "ORDER BY product_id DESC "
                   + "LIMIT 3";

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
            product.setProductImage2(rs.getString("product_image_2"));
            product.setProductImage3(rs.getString("product_image_3"));
            product.setProductImage4(rs.getString("product_image_4"));

            products.add(product);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }

    public int getLowStockProductCount() throws Exception {

        int lowStockCount = 0;

        Connection con = DBconfig.getConnection();

        String sql = "SELECT COUNT(*) AS total FROM products WHERE stock_quantity > 0 AND stock_quantity <= 5";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            lowStockCount = rs.getInt("total");
        }

        rs.close();
        pst.close();
        con.close();

        return lowStockCount;
    }

    public String getLowestStockProduct() throws Exception {

        String lowestStockProduct = "No low stock products";

        Connection con = DBconfig.getConnection();

        String sql = "SELECT jersey_name, team_name, stock_quantity "
                   + "FROM products "
                   + "WHERE stock_quantity > 0 "
                   + "ORDER BY stock_quantity ASC, product_id DESC "
                   + "LIMIT 1";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            lowestStockProduct = rs.getString("jersey_name") + " - " + rs.getString("team_name") + " (" + rs.getInt("stock_quantity") + " left)";
        }

        rs.close();
        pst.close();
        con.close();

        return lowestStockProduct;
    }

    public ArrayList<ProductModel> searchProducts(String keyword) throws Exception {

        ArrayList<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4 "
                   + "FROM products "
                   + "WHERE LOWER(jersey_name) LIKE ? "
                   + "OR LOWER(team_name) LIKE ? "
                   + "OR LOWER(size) LIKE ? "
                   + "OR LOWER(season) LIKE ? "
                   + "OR LOWER(category) LIKE ? "
                   + "OR LOWER(description) LIKE ? "
                   + "ORDER BY product_id DESC";

        PreparedStatement pst = con.prepareStatement(sql);

        // The keyword is prepared once and reused for all searchable product fields.
        String searchValue = "%" + keyword.toLowerCase().trim() + "%";

        pst.setString(1, searchValue);
        pst.setString(2, searchValue);
        pst.setString(3, searchValue);
        pst.setString(4, searchValue);
        pst.setString(5, searchValue);
        pst.setString(6, searchValue);

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

        String sql = "SELECT product_id, jersey_name, team_name, size, season, price, stock_quantity, category, description, product_image, product_image_2, product_image_3, product_image_4 "
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
            product.setProductImage2(rs.getString("product_image_2"));
            product.setProductImage3(rs.getString("product_image_3"));
            product.setProductImage4(rs.getString("product_image_4"));
        }

        rs.close();
        pst.close();
        con.close();

        return product;
    }

    public boolean updateProduct(ProductModel product) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "UPDATE products "
                   + "SET jersey_name = ?, team_name = ?, size = ?, season = ?, price = ?, stock_quantity = ?, category = ?, description = ?, product_image = ?, product_image_2 = ?, product_image_3 = ?, product_image_4 = ? "
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
        pst.setString(10, product.getProductImage2());
        pst.setString(11, product.getProductImage3());
        pst.setString(12, product.getProductImage4());
        pst.setInt(13, product.getProductId());

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

    public boolean reduceStockQuantity(int productId, int quantity) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "UPDATE products "
                   + "SET stock_quantity = stock_quantity - ? "
                   + "WHERE product_id = ? AND stock_quantity >= ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, quantity);
        pst.setInt(2, productId);

        // Stock is reduced only when enough quantity is still available.
        pst.setInt(3, quantity);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }
}