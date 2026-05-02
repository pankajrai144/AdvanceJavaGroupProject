package com.groupcoursework.service;

import com.groupcoursework.dao.UserDAO;
import com.groupcoursework.utils.PasswordUtil;

public class LoginService {

    public String loginUser(String email, String password) throws Exception {

        String hashedPassword = PasswordUtil.getHashPassword(password);

        // Get user role from database
        UserDAO dao = new UserDAO();
        return dao.getUserRole(email, hashedPassword);
    }

}