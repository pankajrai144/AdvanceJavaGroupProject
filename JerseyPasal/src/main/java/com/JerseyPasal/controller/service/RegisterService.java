package com.JerseyPasal.controller.service;

import com.JerseyPasal.controller.dao.UserDAO;
import com.JerseyPasal.controller.utils.PasswordUtil;

public class RegisterService {

    public void registerUser(String fullname, String email, String phone, String registrationDate,
                             String password, String address, String gender,
                             String profileImageName) throws Exception {

        // The password is hashed before saving the new user account.
        String hashedPassword = PasswordUtil.getHashPassword(password.trim());

        if (profileImageName == null) {
            profileImageName = "";
        }

        UserDAO dao = new UserDAO();

        // User input is cleaned here before passing it to the database layer.
        dao.insertUser(
                fullname.trim(),
                email.trim().toLowerCase(),
                phone.trim(),
                registrationDate.trim(),
                hashedPassword,
                address.trim(),
                gender.trim(),
                profileImageName.trim()
        );
    }
}