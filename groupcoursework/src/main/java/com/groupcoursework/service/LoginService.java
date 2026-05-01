package com.groupcoursework.service;

import com.groupcoursework.dao.UserDAO;
import com.groupcoursework.utils.PasswordUtil;

public class LoginService {

    public boolean loginUser(String email, String password) throws Exception {

        String hashedPassword = PasswordUtil.getHashPassword(password);

        // Check user from database
        UserDAO dao = new UserDAO();
        return dao.checkLogin(email, hashedPassword);
    }

}