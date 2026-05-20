package com.JerseyPasal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.JerseyPasal.controller.model.ContactModel;
import com.JerseyPasal.controller.utils.DBconfig;

public class ContactDAO {

    public boolean saveContactMessage(ContactModel contact) throws Exception {

        String sql = "INSERT INTO contact_messages (user_id, subject, message) VALUES (?, ?, ?)";

        Connection con = DBconfig.getConnection();
        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, contact.getUserId());
        pst.setString(2, contact.getSubject());
        pst.setString(3, contact.getMessage());

        int result = pst.executeUpdate();

        pst.close();
        con.close();

        return result > 0;
    }

    public ArrayList<HashMap<String, String>> getAllContactMessages() throws Exception {

        ArrayList<HashMap<String, String>> contactMessages = new ArrayList<HashMap<String, String>>();

        String sql = "SELECT cm.contact_id, cm.subject, cm.message, cm.submitted_at, "
                   + "u.fullname, u.email, u.phone "
                   + "FROM contact_messages cm "
                   + "INNER JOIN users u ON cm.user_id = u.user_id "
                   + "ORDER BY cm.submitted_at DESC";

        Connection con = DBconfig.getConnection();
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            HashMap<String, String> contact = new HashMap<String, String>();

            contact.put("contact_id", String.valueOf(rs.getInt("contact_id")));
            contact.put("fullname", rs.getString("fullname"));
            contact.put("email", rs.getString("email"));
            contact.put("phone", rs.getString("phone"));
            contact.put("subject", rs.getString("subject"));
            contact.put("message", rs.getString("message"));

            // Timestamp is converted to text so it can be displayed easily on the admin page.
            contact.put("submitted_at", String.valueOf(rs.getTimestamp("submitted_at")));

            contactMessages.add(contact);
        }

        rs.close();
        pst.close();
        con.close();

        return contactMessages;
    }
}