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

    public void insertUser(String fullname, String email, String phone, String registrationDate,
                           String password, String address, String gender,
                           String profileImageName) throws Exception {

        LocalDate localDate = LocalDate.parse(registrationDate);
        Date sqlDate = Date.valueOf(localDate);

        String sql = "INSERT INTO users "
                   + "(fullname, email, phone, registration_date, password, address, gender, profile_image, role, approval_status) "
                   + "VALUES (?,?,?,?,?,?,?,?,?,?)";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, fullname);
            pst.setString(2, email.trim().toLowerCase());
            pst.setString(3, phone);
            pst.setDate(4, sqlDate);
            pst.setString(5, password);
            pst.setString(6, address);
            pst.setString(7, gender);
            pst.setString(8, profileImageName);
            pst.setString(9, "user");

            // New users are kept denied until the admin approves their account.
            pst.setString(10, "denied");

            pst.executeUpdate();
        }
    }

    public boolean emailExists(String email) throws Exception {

        String sql = "SELECT email FROM users WHERE LOWER(email) = LOWER(?)";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email.trim().toLowerCase());

            try (ResultSet rs = pst.executeQuery()) {
                return rs.next();
            }
        }
    }

    public boolean checkLogin(String email, String password) throws Exception {

        String sql = "SELECT user_id FROM users "
                   + "WHERE LOWER(email) = LOWER(?) AND password = ? "
                   + "AND approval_status = 'approved'";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email.trim().toLowerCase());
            pst.setString(2, password);

            try (ResultSet rs = pst.executeQuery()) {
                return rs.next();
            }
        }
    }

    public String getUserRole(String email, String password) throws Exception {

        String sql = "SELECT role FROM users "
                   + "WHERE LOWER(email) = LOWER(?) AND password = ? "
                   + "AND approval_status = 'approved'";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email.trim().toLowerCase());
            pst.setString(2, password);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String role = rs.getString("role");

                    // Default role is used when old or incomplete user records have no role value.
                    if (role == null || role.trim().isEmpty()) {
                        role = "user";
                    } else {
                        role = role.trim();
                    }

                    if ("member".equalsIgnoreCase(role)) {
                        role = "user";
                    }

                    return role;
                }
            }
        }

        return null;
    }

    public UserModel getUserByEmailAndPassword(String email, String password) throws Exception {

        String sql = "SELECT user_id, fullname, email, phone, registration_date, address, gender, profile_image, role, approval_status "
                   + "FROM users "
                   + "WHERE LOWER(email) = LOWER(?) AND password = ? "
                   + "AND approval_status = 'approved'";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email.trim().toLowerCase());
            pst.setString(2, password);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    UserModel user = new UserModel();

                    user.setUserid(rs.getInt("user_id"));
                    user.setFullname(rs.getString("fullname"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));

                    if (rs.getDate("registration_date") != null) {
                        user.setRegistrationDate(rs.getDate("registration_date").toString());
                    }

                    user.setAddress(rs.getString("address"));
                    user.setGender(rs.getString("gender"));
                    user.setProfileImage(rs.getString("profile_image"));

                    String role = rs.getString("role");

                    // Role value is cleaned before storing it in the session user object.
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

                    // Missing approval status is treated as denied for safer login control.
                    if (approvalStatus == null || approvalStatus.trim().isEmpty()) {
                        approvalStatus = "denied";
                    } else {
                        approvalStatus = approvalStatus.trim();
                    }

                    user.setApprovalStatus(approvalStatus);

                    return user;
                }
            }
        }

        return null;
    }

    public boolean isUserDenied(String email, String password) throws Exception {

        String sql = "SELECT approval_status FROM users WHERE LOWER(email) = LOWER(?) AND password = ?";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email.trim().toLowerCase());
            pst.setString(2, password);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String approvalStatus = rs.getString("approval_status");
                    return "denied".equalsIgnoreCase(approvalStatus);
                }
            }
        }

        return false;
    }

    public boolean isUserDeleted(String email, String password) throws Exception {

        String sql = "SELECT approval_status FROM users WHERE LOWER(email) = LOWER(?) AND password = ?";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email.trim().toLowerCase());
            pst.setString(2, password);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String approvalStatus = rs.getString("approval_status");
                    return "deleted".equalsIgnoreCase(approvalStatus);
                }
            }
        }

        return false;
    }

    public ArrayList<HashMap<String, String>> getAllUsers() throws Exception {

        ArrayList<HashMap<String, String>> users = new ArrayList<>();

        String sql = "SELECT user_id, fullname, email, approval_status "
                   + "FROM users "
                   + "WHERE role IS NULL OR LOWER(role) <> 'admin' "
                   + "ORDER BY fullname ASC";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                HashMap<String, String> user = new HashMap<>();

                String approvalStatus = rs.getString("approval_status");

                if (approvalStatus == null || approvalStatus.trim().isEmpty()) {
                    approvalStatus = "denied";
                }

                user.put("userid", String.valueOf(rs.getInt("user_id")));
                user.put("fullname", rs.getString("fullname"));
                user.put("email", rs.getString("email"));
                user.put("approval_status", approvalStatus);

                users.add(user);
            }
        }

        return users;
    }

    public boolean denyUser(int userId) throws Exception {

        String sql = "UPDATE users "
                   + "SET approval_status = 'denied' "
                   + "WHERE user_id = ? AND (role IS NULL OR LOWER(role) <> 'admin')";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, userId);

            int rows = pst.executeUpdate();

            return rows > 0;
        }
    }

    public boolean approveUser(int userId) throws Exception {

        String sql = "UPDATE users "
                   + "SET approval_status = 'approved' "
                   + "WHERE user_id = ? AND (role IS NULL OR LOWER(role) <> 'admin')";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, userId);

            int rows = pst.executeUpdate();

            return rows > 0;
        }
    }

    public boolean softDeleteUser(String email) throws Exception {

        String sql = "UPDATE users "
                   + "SET approval_status = 'deleted' "
                   + "WHERE LOWER(email) = LOWER(?) AND (role IS NULL OR LOWER(role) <> 'admin')";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email.trim().toLowerCase());

            int rows = pst.executeUpdate();

            return rows > 0;
        }
    }

    public boolean updateUserProfile(int userId, String fullname, String registrationDate, String email,
                                     String phone, String address, String gender,
                                     String profileImageName) throws Exception {

        LocalDate localDate = LocalDate.parse(registrationDate);
        Date sqlDate = Date.valueOf(localDate);

        String sql = "UPDATE users "
                   + "SET fullname = ?, registration_date = ?, email = ?, phone = ?, address = ?, gender = ?, profile_image = ? "
                   + "WHERE user_id = ?";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, fullname);
            pst.setDate(2, sqlDate);
            pst.setString(3, email.trim().toLowerCase());
            pst.setString(4, phone);
            pst.setString(5, address);
            pst.setString(6, gender);
            pst.setString(7, profileImageName);
            pst.setInt(8, userId);

            int rows = pst.executeUpdate();

            return rows > 0;
        }
    }
}