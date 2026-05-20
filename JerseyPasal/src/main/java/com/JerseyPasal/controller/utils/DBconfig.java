package com.JerseyPasal.controller.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconfig {

    private static final String URL = "jdbc:mysql://localhost:3306/jersey_pasal";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {

        // MySQL driver is loaded before creating the database connection.
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

        return conn;
    }
}