package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.UserDAO;
import com.JerseyPasal.controller.model.UserModel;
import com.JerseyPasal.controller.utils.FileUploadUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/editprofile" })
@MultipartConfig
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private static final String UPLOAD_DIR =
            System.getProperty("user.home") + File.separator + "jersey_pasal_uploads";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
        userDAO = new UserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("loggedInUser") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

        request.getRequestDispatcher("/WEB-INF/pages/editProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("loggedInUser") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		Object loggedInUserObj = session.getAttribute("loggedInUser");

		// Invalid session data is cleared before sending the user back to login.
		if (!(loggedInUserObj instanceof UserModel)) {
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		UserModel loggedInUser = (UserModel) loggedInUserObj;

		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");

		fullname = fullname == null ? "" : fullname.trim();
		email = email == null ? "" : email.trim().toLowerCase();
		phone = phone == null ? "" : phone.trim();
		address = address == null ? "" : address.trim();
		gender = gender == null ? "" : gender.trim();

		String registrationDate = loggedInUser.getRegistrationDate();

		if (fullname.isEmpty() || registrationDate == null || registrationDate.trim().isEmpty() ||
		    email.isEmpty() || phone.isEmpty() || address.isEmpty() || gender.isEmpty()) {
			session.setAttribute("error", "All fields are required.");
			response.sendRedirect(request.getContextPath() + "/editprofile");
			return;
		}

		if (!fullname.matches("^[A-Za-z ]{2,50}$")) {
			session.setAttribute("error", "Full name must contain only letters and spaces.");
			response.sendRedirect(request.getContextPath() + "/editprofile");
			return;
		}

		if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
			session.setAttribute("error", "Please enter a valid email address.");
			response.sendRedirect(request.getContextPath() + "/editprofile");
			return;
		}

		if (!phone.matches("^[0-9]{10}$")) {
			session.setAttribute("error", "Phone number must be 10 digits.");
			response.sendRedirect(request.getContextPath() + "/editprofile");
			return;
		}

		if (address.length() > 255) {
			session.setAttribute("error", "Address must be less than 255 characters.");
			response.sendRedirect(request.getContextPath() + "/editprofile");
			return;
		}

		if (!gender.equals("Male") && !gender.equals("Female")) {
			session.setAttribute("error", "Invalid gender selected.");
			response.sendRedirect(request.getContextPath() + "/editprofile");
			return;
		}

		try {
			// Email uniqueness is checked only when the user changes their current email.
			if (loggedInUser.getEmail() != null &&
			    !email.equalsIgnoreCase(loggedInUser.getEmail()) &&
			    userDAO.emailExists(email)) {
				session.setAttribute("error", "This email is already used by another account.");
				response.sendRedirect(request.getContextPath() + "/editprofile");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Unable to check email availability.");
			response.sendRedirect(request.getContextPath() + "/editprofile");
			return;
		}

		String profileImageName = loggedInUser.getProfileImage();

		Part profilePic = request.getPart("profilePic");

		if (profilePic != null && profilePic.getSize() > 0) {
			String submittedFileName = profilePic.getSubmittedFileName();
			String contentType = profilePic.getContentType();

			if (submittedFileName == null || submittedFileName.trim().isEmpty()) {
				session.setAttribute("error", "Invalid profile image.");
				response.sendRedirect(request.getContextPath() + "/editprofile");
				return;
			}

			String fileName = submittedFileName.trim().toLowerCase();

			if (contentType == null || !contentType.startsWith("image/")) {
				session.setAttribute("error", "Only image files are allowed.");
				response.sendRedirect(request.getContextPath() + "/editprofile");
				return;
			}

			if (!fileName.endsWith(".jpg") &&
			    !fileName.endsWith(".jpeg") &&
			    !fileName.endsWith(".png") &&
			    !fileName.endsWith(".webp")) {
				session.setAttribute("error", "Please upload only JPG, JPEG, PNG or WEBP image files.");
				response.sendRedirect(request.getContextPath() + "/editprofile");
				return;
			}

			if (profilePic.getSize() > 2 * 1024 * 1024) {
				session.setAttribute("error", "Profile image must be less than 2MB.");
				response.sendRedirect(request.getContextPath() + "/editprofile");
				return;
			}

			String extension = FileUploadUtil.getFileExtension(submittedFileName);
			String cleanEmail = FileUploadUtil.cleanEmailForFileName(email);

			// The email is used in the image name so each user's profile image stays separate.
			profileImageName = cleanEmail + extension;

			FileUploadUtil.saveFile(profilePic, UPLOAD_DIR, profileImageName);
		}

		try {
			boolean updated = userDAO.updateUserProfile(
					loggedInUser.getUserid(),
					fullname,
					registrationDate,
					email,
					phone,
					address,
					gender,
					profileImageName
			);

			if (updated) {
				loggedInUser.setFullname(fullname);
				loggedInUser.setRegistrationDate(registrationDate);
				loggedInUser.setEmail(email);
				loggedInUser.setPhone(phone);
				loggedInUser.setAddress(address);
				loggedInUser.setGender(gender);
				loggedInUser.setProfileImage(profileImageName);

				// Session user data is refreshed so the new profile details appear without logging in again.
				session.setAttribute("loggedInUser", loggedInUser);
				session.setAttribute("message", "Profile updated successfully.");
			} else {
				session.setAttribute("error", "Profile update failed.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Unable to update profile. Please try again.");
		}

		response.sendRedirect(request.getContextPath() + "/editprofile");
	}
}