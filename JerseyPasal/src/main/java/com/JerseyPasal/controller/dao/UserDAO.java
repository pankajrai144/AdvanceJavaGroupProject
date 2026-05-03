package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import com.JerseyPasal.controller.model.UserModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class UserDAO {

    public void insertUser(String fullname, String email, String phone, String dob,
                           String password, String address, String gender,
                           String profileImageName) throws Exception {

        Connection con = DBconfig.getConnection();

        LocalDate localDate = LocalDate.parse(dob);
        Date sqlDate = Date.valueOf(localDate);

       
        String sql = "INSERT INTO users "
                   + "(fullname, email, phone, dob, password, address, gender, profile_image, role, approval_status) "
                   + "VALUES (?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, fullname);
        pst.setString(2, email);
        pst.setString(3, phone);
        pst.setDate(4, sqlDate);
        pst.setString(5, password);
        pst.setString(6, address);
        pst.setString(7, gender);
        pst.setString(8, profileImageName);
        pst.setString(9, "user");
        pst.setString(10, "approved");

        pst.executeUpdate();

        pst.close();
        con.close();
    }

    public boolean checkLogin(String email, String password) throws Exception {

        Connection con = DBconfig.getConnection();

       
        String sql = "SELECT * FROM users "
                   + "WHERE email = ? AND password = ? "
                   + "AND (approval_status IS NULL OR approval_status NOT IN ('denied', 'deleted'))";

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

        
        String sql = "SELECT role FROM users "
                   + "WHERE email = ? AND password = ? "
                   + "AND (approval_status IS NULL OR approval_status NOT IN ('denied', 'deleted'))";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, email);
        pst.setString(2, password);

        ResultSet rs = pst.executeQuery();

        String role = null;

        if (rs.next()) {
            role = rs.getString("role");

           
            if (role == null || role.trim().isEmpty()) {
                role = "user";
            } else {
                role = role.trim();
            }

           
            if ("member".equalsIgnoreCase(role)) {
                role = "user";
            }
        }

        rs.close();
        pst.close();
        con.close();

        return role;
    }

    
    public UserModel getUserByEmailAndPassword(String email, String password) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "SELECT user_id, fullname, email, phone, dob, address, gender, profile_image, role, approval_status "
                   + "FROM users "
                   + "WHERE email = ? AND password = ? "
                   + "AND (approval_status IS NULL OR approval_status NOT IN ('denied', 'deleted'))";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, email);
        pst.setString(2, password);

        ResultSet rs = pst.executeQuery();

        UserModel user = null;

        if (rs.next()) {
            user = new UserModel();

            user.setUserid(rs.getInt("user_id"));
            user.setFullname(rs.getString("fullname"));
            user.setEmail(rs.getString("email"));
            user.setPhone(rs.getString("phone"));

            if (rs.getDate("dob") != null) {
                user.setDob(rs.getDate("dob").toString());
            }

            user.setAddress(rs.getString("address"));
            user.setGender(rs.getString("gender"));
            user.setProfileImage(rs.getString("profile_image"));

            String role = rs.getString("role");

            if (role == null || role.trim().isEmpty()) {
                role = "user";
            } else {
                role = role.trim();
            }

           
            if ("member".equalsIgnoreCase(role)) {
                role = "user";
            }

            user.setRole(role);

            String approvalStatus = rs.getString("approval_status");

            if (approvalStatus == null || approvalStatus.trim().isEmpty()) {
                approvalStatus = "approved";
            } else {
                approvalStatus = approvalStatus.trim();
            }

            user.setApprovalStatus(approvalStatus);
        }

        rs.close();
        pst.close();
        con.close();

        return user;
    }

    public boolean isUserDenied(String email, String password) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "SELECT approval_status FROM users WHERE email = ? AND password = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, email);
        pst.setString(2, password);

        ResultSet rs = pst.executeQuery();

        boolean denied = false;

        if (rs.next()) {
            String approvalStatus = rs.getString("approval_status");

            if ("denied".equalsIgnoreCase(approvalStatus)) {
                denied = true;
            }
        }

        rs.close();
        pst.close();
        con.close();

        return denied;
    }

    public boolean isUserDeleted(String email, String password) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "SELECT approval_status FROM users WHERE email = ? AND password = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, email);
        pst.setString(2, password);

        ResultSet rs = pst.executeQuery();

        boolean deleted = false;

        if (rs.next()) {
            String approvalStatus = rs.getString("approval_status");

            if ("deleted".equalsIgnoreCase(approvalStatus)) {
                deleted = true;
            }
        }

        rs.close();
        pst.close();
        con.close();

        return deleted;
    }

    public ArrayList<HashMap<String, String>> getAllUsers() throws Exception {

        ArrayList<HashMap<String, String>> users = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT user_id, fullname, email, approval_status "
                   + "FROM users "
                   + "WHERE role IS NULL OR role <> 'admin' "
                   + "ORDER BY fullname ASC";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            HashMap<String, String> user = new HashMap<>();

            String approvalStatus = rs.getString("approval_status");

            if (approvalStatus == null || approvalStatus.trim().isEmpty()) {
                approvalStatus = "approved";
            }

            user.put("userid", String.valueOf(rs.getInt("user_id")));
            user.put("fullname", rs.getString("fullname"));
            user.put("email", rs.getString("email"));
            user.put("approval_status", approvalStatus);

            users.add(user);
        }

        rs.close();
        pst.close();
        con.close();

        return users;
    }

    public boolean denyUser(int userId) throws Exception {

        Connection con = DBconfig.getConnection();

        
        String sql = "UPDATE users "
                   + "SET approval_status = 'denied' "
                   + "WHERE user_id = ? AND (role IS NULL OR role <> 'admin')";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }

    public boolean softDeleteUser(String email) throws Exception {

        Connection con = DBconfig.getConnection();

        
        String sql = "UPDATE users "
                   + "SET approval_status = 'deleted' "
                   + "WHERE email = ? AND (role IS NULL OR role <> 'admin')";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, email);

        int rows = pst.executeUpdate();

        pst.close();
        con.close();

        return rows > 0;
    }
}