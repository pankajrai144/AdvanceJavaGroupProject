package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.model.ProductModel;
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
 * Servlet implementation class EditProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/editproduct" })
@MultipartConfig
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String UPLOAD_DIR =
            System.getProperty("user.home") + File.separator + "jersey_pasal_uploads";
	
	private static final long MAX_IMAGE_SIZE = 2 * 1024 * 1024;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
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

		UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");

		if (loggedInUser.getRole() == null || !loggedInUser.getRole().equalsIgnoreCase("admin")) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		
		try {
			String productIdValue = request.getParameter("productId");
			
			if (isEmpty(productIdValue)) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=update");
				return;
			}
			
			int productId = Integer.parseInt(productIdValue);
			
			ProductDAO dao = new ProductDAO();
			ProductModel product = dao.getProductById(productId);
			
			if (product == null) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=update");
				return;
			}
			
			request.setAttribute("product", product);
			request.getRequestDispatcher("/WEB-INF/pages/editproduct.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/admindashboard?productError=update");
		}
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

		UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");

		if (loggedInUser.getRole() == null || !loggedInUser.getRole().equalsIgnoreCase("admin")) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		
		try {
			String productIdValue = request.getParameter("productId");
			String jerseyName = request.getParameter("jerseyName");
			String teamName = request.getParameter("teamName");
			String size = request.getParameter("size");
			String season = request.getParameter("season");
			String priceValue = request.getParameter("price");
			String stockValue = request.getParameter("stockQuantity");
			String category = request.getParameter("category");
			String description = request.getParameter("description");
			String existingImage = request.getParameter("existingImage");
			
			Part productImage = request.getPart("productImage");
			
			if (isEmpty(productIdValue) ||
				isEmpty(jerseyName) ||
				isEmpty(teamName) ||
				isEmpty(size) ||
				isEmpty(season) ||
				isEmpty(priceValue) ||
				isEmpty(stockValue) ||
				isEmpty(category)) {
				
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=empty");
				return;
			}
			
			int productId = Integer.parseInt(productIdValue);
			
			jerseyName = jerseyName.trim();
			teamName = teamName.trim();
			size = size.trim();
			season = season.trim();
			priceValue = priceValue.trim();
			stockValue = stockValue.trim();
			category = category.trim();
			
			if (description == null) {
				description = "";
			} else {
				description = description.trim();
			}
			
			if (existingImage == null) {
				existingImage = "";
			} else {
				existingImage = existingImage.trim();
			}
			
			if (jerseyName.length() < 2 || jerseyName.length() > 100) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=jerseyName");
				return;
			}
			
			if (!jerseyName.matches("^[a-zA-Z0-9\\s\\-\\/]+$")) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=jerseyNameFormat");
				return;
			}
			
			if (teamName.length() < 2 || teamName.length() > 100) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=teamName");
				return;
			}
			
			if (!teamName.matches("^[a-zA-Z0-9\\s\\-\\.]+$")) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=teamNameFormat");
				return;
			}
			
			if (!size.equalsIgnoreCase("S") &&
				!size.equalsIgnoreCase("M") &&
				!size.equalsIgnoreCase("L") &&
				!size.equalsIgnoreCase("XL") &&
				!size.equalsIgnoreCase("XXL")) {
				
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=size");
				return;
			}
			
			size = size.toUpperCase();
			
			if (!season.matches("^[0-9]{4}/[0-9]{2}$")) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=season");
				return;
			}
			
			if (!category.equals("Club") && !category.equals("Nation")) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=category");
				return;
			}
			
			if (description.length() > 500) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=description");
				return;
			}
			
			double price;
			int stockQuantity;
			
			try {
				price = Double.parseDouble(priceValue);
				stockQuantity = Integer.parseInt(stockValue);
			} catch (NumberFormatException e) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=number");
				return;
			}
			
			if (price <= 0) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=price");
				return;
			}
			
			if (price > 10000) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=priceLimit");
				return;
			}
			
			if (stockQuantity < 0) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=stock");
				return;
			}
			
			if (stockQuantity > 1000) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=stockLimit");
				return;
			}
			
			String productImageName = existingImage;
			
			if (productImage != null && productImage.getSize() > 0) {
				
				if (productImage.getSize() > MAX_IMAGE_SIZE) {
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=imagesize");
					return;
				}
				
				if (!FileUploadUtil.isImage(productImage)) {
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=image");
					return;
				}
				
				String originalFileName = productImage.getSubmittedFileName();
				
				if (originalFileName == null || originalFileName.trim().isEmpty()) {
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=image");
					return;
				}
				
				String extension = FileUploadUtil.getFileExtension(originalFileName);
				
				if (extension == null || extension.trim().isEmpty()) {
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=image");
					return;
				}
				
				extension = extension.toLowerCase();
				
				if (!extension.equals(".jpg") &&
					!extension.equals(".jpeg") &&
					!extension.equals(".png") &&
					!extension.equals(".webp")) {
					
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=image");
					return;
				}
				
				productImageName = "product_" + System.currentTimeMillis() + extension;
				FileUploadUtil.saveFile(productImage, UPLOAD_DIR, productImageName);
			}
			
			ProductModel product = new ProductModel();
			
			product.setProductId(productId);
			product.setJerseyName(jerseyName);
			product.setTeamName(teamName);
			product.setSize(size);
			product.setSeason(season);
			product.setPrice(price);
			product.setStockQuantity(stockQuantity);
			product.setCategory(category);
			product.setDescription(description);
			product.setProductImage(productImageName);
			
			ProductDAO dao = new ProductDAO();
			boolean updated = dao.updateProduct(product);
			
			if (updated) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productUpdated=true");
			} else {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=update");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/admindashboard?productError=update");
		}
	}
	
	private boolean isEmpty(String value) {
		return value == null || value.trim().isEmpty();
	}

}