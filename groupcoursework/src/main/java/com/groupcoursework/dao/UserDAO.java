package com.groupcoursework.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import com.groupcoursework.utils.DBconfig;

public class UserDAO {

    public void insertUser(String fullname, String email, String phone, String dob,
                           String password, String address, String gender) throws Exception {

        Connection con = DBconfig.getConnection();

        LocalDate localDate = LocalDate.parse(dob);
        Date sqlDate = Date.valueOf(localDate);

        String sql = "INSERT INTO users (fullname, email, phone, dob, password, address, gender) VALUES (?,?,?,?,?,?,?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, fullname);
        pst.setString(2, email);
        pst.setString(3, phone);
        pst.setDate(4, sqlDate);
        pst.setString(5, password);
        pst.setString(6, address);
        pst.setString(7, gender);

        pst.executeUpdate();

        pst.close();
        con.close();
    }

    public boolean checkLogin(String email, String password) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, email);
        pst.setString(2, password);

        ResultSet rs = pst.executeQuery();

        boolean isValidUser = rs.next();

        rs.close();
        pst.close();
        con.close();

        return isValidUser;
    }

    public String getUserRole(String email, String password) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "SELECT role FROM users WHERE email = ? AND password = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, email);
        pst.setString(2, password);

        ResultSet rs = pst.executeQuery();

        String role = null;

        if (rs.next()) {
            role = rs.getString("role");
        }

        rs.close();
        pst.close();
        con.close();

        return role;
    }
}