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
import java.util.ArrayList;

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

		// Only admin users are allowed to open the product edit page.
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

			// The existing product is loaded so its current details can be shown in the edit form.
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

		// Only admin users are allowed to update products.
		if (loggedInUser.getRole() == null || !loggedInUser.getRole().equalsIgnoreCase("admin")) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		
		try {
			String productIdValue = request.getParameter("productId");
			String jerseyName = request.getParameter("jerseyName");
			String teamName = request.getParameter("teamName");
			String[] selectedSizes = request.getParameterValues("size");
			String season = request.getParameter("season");
			String priceValue = request.getParameter("price");
			String stockValue = request.getParameter("stockQuantity");
			String category = request.getParameter("category");
			String description = request.getParameter("description");
			String existingImage = request.getParameter("existingImage");
			String existingImage2 = request.getParameter("existingImage2");
			String existingImage3 = request.getParameter("existingImage3");
			String existingImage4 = request.getParameter("existingImage4");
			
			ArrayList<Part> productImages = new ArrayList<>();
			
			for (Part part : request.getParts()) {
				if ("productImages".equals(part.getName()) && part.getSize() > 0) {
					productImages.add(part);
				}
			}
			
			if (isEmpty(productIdValue) ||
				isEmpty(jerseyName) ||
				isEmpty(teamName) ||
				selectedSizes == null ||
				selectedSizes.length == 0 ||
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

			if (existingImage2 == null) {
				existingImage2 = "";
			} else {
				existingImage2 = existingImage2.trim();
			}

			if (existingImage3 == null) {
				existingImage3 = "";
			} else {
				existingImage3 = existingImage3.trim();
			}

			if (existingImage4 == null) {
				existingImage4 = "";
			} else {
				existingImage4 = existingImage4.trim();
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
			
			StringBuilder sizeBuilder = new StringBuilder();
			
			for (String selectedSize : selectedSizes) {
				if (selectedSize == null) {
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=size");
					return;
				}
				
				selectedSize = selectedSize.trim().toUpperCase();
				
				if (!selectedSize.equals("XS") &&
					!selectedSize.equals("S") &&
					!selectedSize.equals("M") &&
					!selectedSize.equals("L") &&
					!selectedSize.equals("XL") &&
					!selectedSize.equals("XXL")) {
					
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=size");
					return;
				}
				
				if (sizeBuilder.length() > 0) {
					sizeBuilder.append(",");
				}
				
				sizeBuilder.append(selectedSize);
			}
			
			String size = sizeBuilder.toString();
			
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
			String productImageName2 = existingImage2;
			String productImageName3 = existingImage3;
			String productImageName4 = existingImage4;
			
			// Existing images are kept unless the admin uploads a new set of four images.
			if (!productImages.isEmpty()) {
				
				if (productImages.size() != 4) {
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=imagecount");
					return;
				}
				
				Part productImage = productImages.get(0);
				Part productImage2 = productImages.get(1);
				Part productImage3 = productImages.get(2);
				Part productImage4 = productImages.get(3);
				
				if (!isValidImage(productImage) ||
					!isValidImage(productImage2) ||
					!isValidImage(productImage3) ||
					!isValidImage(productImage4)) {
					
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=image");
					return;
				}
				
				if (productImage.getSize() > MAX_IMAGE_SIZE ||
					productImage2.getSize() > MAX_IMAGE_SIZE ||
					productImage3.getSize() > MAX_IMAGE_SIZE ||
					productImage4.getSize() > MAX_IMAGE_SIZE) {
					
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=imagesize");
					return;
				}
				
				productImageName = createProductImageName(productImage, "main");
				productImageName2 = createProductImageName(productImage2, "second");
				productImageName3 = createProductImageName(productImage3, "third");
				productImageName4 = createProductImageName(productImage4, "fourth");
				
				if (productImageName == null ||
					productImageName2 == null ||
					productImageName3 == null ||
					productImageName4 == null) {
					
					response.sendRedirect(request.getContextPath() + "/admindashboard?productError=image");
					return;
				}
				
				FileUploadUtil.saveFile(productImage, UPLOAD_DIR, productImageName);
				FileUploadUtil.saveFile(productImage2, UPLOAD_DIR, productImageName2);
				FileUploadUtil.saveFile(productImage3, UPLOAD_DIR, productImageName3);
				FileUploadUtil.saveFile(productImage4, UPLOAD_DIR, productImageName4);
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
			product.setProductImage2(productImageName2);
			product.setProductImage3(productImageName3);
			product.setProductImage4(productImageName4);
			
			ProductDAO dao = new ProductDAO();

			// The updated product model is passed to the DAO to save the changes.
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

	private boolean isValidImage(Part imagePart) {
		if (imagePart == null || imagePart.getSize() <= 0) {
			return false;
		}
		
		if (!FileUploadUtil.isImage(imagePart)) {
			return false;
		}
		
		String originalFileName = imagePart.getSubmittedFileName();
		
		if (originalFileName == null || originalFileName.trim().isEmpty()) {
			return false;
		}
		
		String extension = FileUploadUtil.getFileExtension(originalFileName);
		
		if (extension == null || extension.trim().isEmpty()) {
			return false;
		}
		
		extension = extension.toLowerCase();
		
		// Only common web image formats are accepted for product images.
		return extension.equals(".jpg") ||
			   extension.equals(".jpeg") ||
			   extension.equals(".png") ||
			   extension.equals(".webp");
	}
	
	private String createProductImageName(Part imagePart, String imageType) {
		String originalFileName = imagePart.getSubmittedFileName();
		String extension = FileUploadUtil.getFileExtension(originalFileName);
		
		if (extension == null || extension.trim().isEmpty()) {
			return null;
		}
		
		extension = extension.toLowerCase();
		
		// A timestamp is added so uploaded product images do not easily overwrite each other.
		return "product_" + imageType + "_" + System.currentTimeMillis() + extension;
	}

}