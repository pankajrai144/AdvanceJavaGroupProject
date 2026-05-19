package com.JerseyPasal.controller.utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {

    public static void setAttribute(HttpServletRequest request, String name, Object value, int seconds) {
        if (request == null || name == null || name.trim().isEmpty()) {
            return;
        }

        HttpSession session = request.getSession(true);
        session.setAttribute(name, value);
        session.setMaxInactiveInterval(seconds);
    }

    public static Object getAttribute(HttpServletRequest request, String name) {
        if (request == null || name == null || name.trim().isEmpty()) {
            return null;
        }

        HttpSession session = request.getSession(false);
        return (session != null) ? session.getAttribute(name) : null;
    }

    public static void removeAttribute(HttpServletRequest request, String name) {
        if (request == null || name == null || name.trim().isEmpty()) {
            return;
        }

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.removeAttribute(name);
        }
    }

    public static void invalidateSession(HttpServletRequest request) {
        if (request == null) {
            return;
        }

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }
    }
}