package com.JerseyPasal.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.JerseyPasal.controller.dao.ContactDAO;
import com.JerseyPasal.controller.model.ContactModel;
import com.JerseyPasal.controller.model.UserModel;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/contact" })
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ContactDAO contactDAO;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
        contactDAO = new ContactDAO();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");

        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // The entered values are kept so the user does not have to retype them after validation errors.
        request.setAttribute("subject", subject);
        request.setAttribute("message", message);

        if (subject == null || subject.trim().isEmpty()) {
            request.setAttribute("error", "Please select a subject.");
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            return;
        }

        if (message == null || message.trim().isEmpty()) {
            request.setAttribute("error", "Message is required.");
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            return;
        }

        if (message.trim().length() < 10) {
            request.setAttribute("error", "Message must be at least 10 characters long.");
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            return;
        }

        try {
            int userId = loggedInUser.getUserid();

            // The contact message is linked with the logged-in user before saving.
            ContactModel contact = new ContactModel(userId, subject.trim(), message.trim());

            boolean saved = contactDAO.saveContactMessage(contact);

            if (saved) {
                request.setAttribute("success", "Your message has been sent successfully.");

                // Form values are cleared only after the message is saved successfully.
                request.removeAttribute("subject");
                request.removeAttribute("message");
            } else {
                request.setAttribute("error", "Something went wrong. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error. Please try again later.");
        }

        request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
    }
}