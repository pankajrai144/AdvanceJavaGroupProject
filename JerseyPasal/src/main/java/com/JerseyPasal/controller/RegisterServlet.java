package com.JerseyPasal.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import com.JerseyPasal.controller.dao.UserDAO;
import com.JerseyPasal.controller.service.RegisterService;
import com.JerseyPasal.controller.utils.FileUploadUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR =
            System.getProperty("user.home") + File.separator + "jersey_pasal_uploads";

    public RegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String registrationDate = request.getParameter("registrationDate");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String terms = request.getParameter("terms");

            Part profilePic = request.getPart("profilePic");

            String error = validateRegisterForm(fullname, email, phone, registrationDate, password, address, gender, terms, profilePic);

            if (error != null) {
                // Valid form values are kept so the user does not need to retype everything after an error.
                setRegisterFormAttributes(request, fullname, email, phone, registrationDate, address, gender, terms);
                request.setAttribute("error", error);
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                return;
            }

            fullname = fullname.trim();
            email = email.trim().toLowerCase();
            phone = phone.trim();
            registrationDate = registrationDate.trim();
            password = password.trim();
            address = address.trim();
            gender = gender.trim();

            UserDAO dao = new UserDAO();

            // Email is checked again before saving to avoid duplicate user accounts.
            if (dao.emailExists(email)) {
                setRegisterFormAttributes(request, fullname, email, phone, registrationDate, address, gender, terms);
                request.setAttribute("error", "This email is already registered. Please use another email.");
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                return;
            }

            String extension = FileUploadUtil.getFileExtension(profilePic.getSubmittedFileName());
            String cleanEmail = FileUploadUtil.cleanEmailForFileName(email);

            // The profile image name is based on the cleaned email so it stays unique for each user.
            String profileImageName = cleanEmail + extension;

            FileUploadUtil.saveFile(profilePic, UPLOAD_DIR, profileImageName);

            RegisterService service = new RegisterService();

            // Registration service handles password hashing before the user is inserted.
            service.registerUser(fullname, email, phone, registrationDate, password, address, gender, profileImageName);

            response.sendRedirect(request.getContextPath() + "/login?registered=true");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
    }

    private void setRegisterFormAttributes(HttpServletRequest request, String fullname, String email,
            String phone, String registrationDate, String address, String gender, String terms) {

        request.setAttribute("fullname", cleanValue(fullname));
        request.setAttribute("email", cleanValue(email));
        request.setAttribute("phone", cleanValue(phone));
        request.setAttribute("registrationDate", cleanValue(registrationDate));
        request.setAttribute("address", cleanValue(address));

        String maleChecked = "";
        String femaleChecked = "";
        String termsChecked = "";

        if ("Male".equals(gender)) {
            maleChecked = "checked";
        }

        if ("Female".equals(gender)) {
            femaleChecked = "checked";
        }

        if ("agree".equals(terms)) {
            termsChecked = "checked";
        }

        request.setAttribute("maleChecked", maleChecked);
        request.setAttribute("femaleChecked", femaleChecked);
        request.setAttribute("termsChecked", termsChecked);
    }

    private String cleanValue(String value) {
        if (value == null) {
            return "";
        }

        return value.trim();
    }

    private String validateRegisterForm(String fullname, String email, String phone, String registrationDate,
            String password, String address, String gender, String terms, Part profilePic) {

        if (fullname == null || fullname.trim().isEmpty()) {
            return "Full name is required.";
        }

        if (!fullname.trim().matches("^[A-Za-z ]{2,50}$")) {
            return "Full name should only contain letters and spaces.";
        }

        if (email == null || email.trim().isEmpty()) {
            return "Email address is required.";
        }

        if (!email.trim().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
            return "Please enter a valid email address.";
        }

        if (phone == null || phone.trim().isEmpty()) {
            return "Phone number is required.";
        }

        if (!phone.trim().matches("^[0-9]{10}$")) {
            return "Phone number must contain exactly 10 digits.";
        }

        if (registrationDate == null || registrationDate.trim().isEmpty()) {
            return "Registration date is required.";
        }

        try {
            LocalDate selectedDate = LocalDate.parse(registrationDate.trim());

            // Registration date must match today's date, not a past or future date.
            if (!selectedDate.isEqual(LocalDate.now())) {
                return "Registration date must be today's date.";
            }

        } catch (DateTimeParseException e) {
            return "Registration date must be in YYYY-MM-DD format.";
        }

        if (password == null || password.trim().isEmpty()) {
            return "Password is required.";
        }

        if (password.trim().length() < 6) {
            return "Password must be at least 6 characters long.";
        }

        if (address == null || address.trim().isEmpty()) {
            return "Address is required.";
        }

        if (address.trim().length() > 255) {
            return "Address must be less than 255 characters.";
        }

        if (gender == null || gender.trim().isEmpty()) {
            return "Please select your gender.";
        }

        if (!gender.trim().equals("Male") && !gender.trim().equals("Female")) {
            return "Please select a valid gender.";
        }

        if (terms == null || !terms.equals("agree")) {
            return "You must agree to the Terms & Conditions.";
        }

        if (profilePic == null || profilePic.getSubmittedFileName() == null
                || profilePic.getSubmittedFileName().trim().isEmpty()) {
            return "Please upload a profile picture.";
        }

        String fileName = profilePic.getSubmittedFileName().trim().toLowerCase();
        String contentType = profilePic.getContentType();

        if (contentType == null || !contentType.startsWith("image/")) {
            return "Please upload only an image file.";
        }

        if (!fileName.endsWith(".jpg") &&
            !fileName.endsWith(".jpeg") &&
            !fileName.endsWith(".png") &&
            !fileName.endsWith(".webp")) {
            return "Please upload only JPG, JPEG, PNG or WEBP image files.";
        }

        if (profilePic.getSize() == 0) {
            return "Uploaded image file is empty.";
        }

        if (profilePic.getSize() > 2 * 1024 * 1024) {
            return "Profile picture must be less than 2MB.";
        }

        return null;
    }
}