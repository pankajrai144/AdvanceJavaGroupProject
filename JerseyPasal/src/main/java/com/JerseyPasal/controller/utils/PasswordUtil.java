package com.JerseyPasal.controller.utils;

import java.security.MessageDigest;

public class PasswordUtil {

    public static String getHashPassword(String password) throws Exception {

        // SHA-256 is used to convert the plain password into a hashed value.
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        byte[] hashBytes = md.digest(password.getBytes());

        StringBuilder sb = new StringBuilder();

        for (byte b : hashBytes) {
            sb.append(String.format("%02x", b));
        }

        return sb.toString();
    }
}