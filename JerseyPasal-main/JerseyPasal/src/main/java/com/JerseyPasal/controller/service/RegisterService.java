package com.JerseyPasal.controller.service;

import com.JerseyPasal.controller.dao.UserDAO;
import com.JerseyPasal.controller.utils.PasswordUtil;

public class RegisterService {

    public void registerUser(String fullname, String email, String phone, String registrationDate,
                             String password, String address, String gender,
                             String profileImageName) throws Exception {

        String hashedPassword = PasswordUtil.getHashPassword(password.trim());

        UserDAO dao = new UserDAO();
        dao.insertUser(
                fullname.trim(),
                email.trim().toLowerCase(),
                phone.trim(),
                registrationDate.trim(),
                hashedPassword,
                address.trim(),
                gender.trim(),
                profileImageName
        );
    }
}