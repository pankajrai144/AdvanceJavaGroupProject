package com.JerseyPasal.controller.service;

import com.JerseyPasal.controller.dao.UserDAO;
import com.JerseyPasal.controller.utils.PasswordUtil;

public class LoginService {

    public String loginUser(String email, String password) throws Exception {

        String hashedPassword = PasswordUtil.getHashPassword(password);

        // Get user role from database
        UserDAO dao = new UserDAO();
        return dao.getUserRole(email, hashedPassword);
    }

}