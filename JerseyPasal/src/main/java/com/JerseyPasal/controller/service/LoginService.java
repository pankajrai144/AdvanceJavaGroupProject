package com.JerseyPasal.controller.service;

import com.JerseyPasal.controller.dao.UserDAO;
import com.JerseyPasal.controller.model.UserModel;
import com.JerseyPasal.controller.utils.PasswordUtil;

public class LoginService {

    public UserModel loginUser(String email, String password) throws Exception {

        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            return null;
        }

        String cleanEmail = email.trim().toLowerCase();

        // The entered password is hashed before matching it with the stored password.
        String hashedPassword = PasswordUtil.getHashPassword(password.trim());

        UserDAO dao = new UserDAO();

        return dao.getUserByEmailAndPassword(cleanEmail, hashedPassword);
    }

    public boolean isUserDenied(String email, String password) throws Exception {

        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            return false;
        }

        String cleanEmail = email.trim().toLowerCase();
        String hashedPassword = PasswordUtil.getHashPassword(password.trim());

        UserDAO dao = new UserDAO();

        // This is checked separately so a denied user can receive the correct login message.
        return dao.isUserDenied(cleanEmail, hashedPassword);
    }

    public boolean isUserDeleted(String email, String password) throws Exception {

        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            return false;
        }

        String cleanEmail = email.trim().toLowerCase();
        String hashedPassword = PasswordUtil.getHashPassword(password.trim());

        UserDAO dao = new UserDAO();

        // Deleted accounts are checked separately to stop removed users from logging in again.
        return dao.isUserDeleted(cleanEmail, hashedPassword);
    }
}