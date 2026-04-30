package com.groupcoursework.service;

import com.groupcoursework.dao.UserDAO;
import com.groupcoursework.utils.PasswordUtil;

public class RegisterService {

    public void registerUser(String fullname, String email, String phone, String dob,
                             String password, String address, String gender) throws Exception {

        password = PasswordUtil.getHashPassword(password);

        UserDAO dao = new UserDAO();
        dao.insertUser(fullname, email, phone, dob, password, address, gender);
    }
}