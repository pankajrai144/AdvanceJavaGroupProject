package com.JerseyPasal.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import com.JerseyPasal.controller.utils.FileUploadUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/getimage" })
public class GetImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_DIR =
			System.getProperty("user.home") + File.separator + "jersey_pasal_uploads";

    public GetImageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String productImage = request.getParameter("productImage");

		File imageFile = null;

		File folder = new File(UPLOAD_DIR);

		if (!folder.exists()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		if (productImage != null && !productImage.trim().isEmpty()) {

			productImage = productImage.trim();

			// Product image names are checked to stop users from accessing files outside the upload folder.
			if (productImage.contains("..") || productImage.contains("/") || productImage.contains("\\")) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
				return;
			}

			imageFile = new File(UPLOAD_DIR, productImage);

			if (!imageFile.exists() || !imageFile.isFile()) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}

		} else {

			if (email == null || email.trim().isEmpty()) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
				return;
			}

			String cleanEmail = FileUploadUtil.cleanEmailForFileName(email);

			// Profile images are found using the cleaned email because the extension may be different.
			File[] matches = folder.listFiles((dir, fileName) -> fileName.startsWith(cleanEmail + "."));

			if (matches == null || matches.length == 0) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}

			imageFile = matches[0];
		}

		String contentType = Files.probeContentType(imageFile.toPath());

		if (contentType == null || !contentType.startsWith("image/")) {
			response.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
			return;
		}

		response.setContentType(contentType);
		response.setContentLength((int) imageFile.length());

		// The image file is written directly to the response so it can be shown in JSP image tags.
		Files.copy(imageFile.toPath(), response.getOutputStream());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}