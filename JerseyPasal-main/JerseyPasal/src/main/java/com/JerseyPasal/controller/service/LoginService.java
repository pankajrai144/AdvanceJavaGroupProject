package com.JerseyPasal.controller.service;

import com.JerseyPasal.controller.dao.UserDAO;
import com.JerseyPasal.controller.model.UserModel;
import com.JerseyPasal.controller.utils.PasswordUtil;

public class LoginService {

    public UserModel loginUser(String email, String password) throws Exception {

        String cleanEmail = email.trim().toLowerCase();
        String hashedPassword = PasswordUtil.getHashPassword(password.trim());

        UserDAO dao = new UserDAO();

        
        return dao.getUserByEmailAndPassword(cleanEmail, hashedPassword);
    }

    public boolean isUserDenied(String email, String password) throws Exception {

        String cleanEmail = email.trim().toLowerCase();
        String hashedPassword = PasswordUtil.getHashPassword(password.trim());

        UserDAO dao = new UserDAO();

       
        return dao.isUserDenied(cleanEmail, hashedPassword);
    }

    public boolean isUserDeleted(String email, String password) throws Exception {

        String cleanEmail = email.trim().toLowerCase();
        String hashedPassword = PasswordUtil.getHashPassword(password.trim());

        UserDAO dao = new UserDAO();

       
        return dao.isUserDeleted(cleanEmail, hashedPassword);
    }
}