package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.model.ProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class ProductsServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/product" })
public class ProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			ProductDAO dao = new ProductDAO();
			String productIdValue = request.getParameter("productId");
			String selectedSize = request.getParameter("selectedSize");
			String selectedImage = request.getParameter("selectedImage");
			
			if (productIdValue != null && !productIdValue.trim().isEmpty()) {
				int productId = Integer.parseInt(productIdValue);
				ProductModel selectedProduct = dao.getProductById(productId);
				
				ArrayList<ProductModel> products = new ArrayList<>();
				
				if (selectedProduct != null) {
					products.add(selectedProduct);

					if (selectedSize != null && !selectedSize.trim().isEmpty()) {
						selectedSize = selectedSize.trim().toUpperCase();

						if (isSizeAvailable(selectedProduct.getSize(), selectedSize)) {
							request.setAttribute("sizeMessage", "Size " + selectedSize + " is available.");
							request.setAttribute("sizeMessageType", "size-success");
							request.setAttribute("selectedSize", selectedSize);
						} else {
							request.setAttribute("sizeMessage", "Stock not available for this size.");
							request.setAttribute("sizeMessageType", "size-error");
						}
					}

					if (selectedImage != null && !selectedImage.trim().isEmpty()) {
						selectedImage = selectedImage.trim();

						if (isProductImageAvailable(selectedProduct, selectedImage)) {
							request.setAttribute("selectedImage", selectedImage);
						}
					}
				}
				
				request.setAttribute("products", products);
				request.setAttribute("selectedProduct", selectedProduct);
				
			} else {
				ArrayList<ProductModel> products = dao.getAllProducts();
				request.setAttribute("products", products);
			}
			
			request.getRequestDispatcher("/WEB-INF/pages/Products.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("products", new ArrayList<ProductModel>());
			request.getRequestDispatcher("/WEB-INF/pages/Products.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private boolean isSizeAvailable(String availableSizes, String selectedSize) {
		if (availableSizes == null || availableSizes.trim().isEmpty() ||
			selectedSize == null || selectedSize.trim().isEmpty()) {
			return false;
		}

		String[] sizeList = availableSizes.split(",");

		for (String size : sizeList) {
			if (size.trim().equalsIgnoreCase(selectedSize.trim())) {
				return true;
			}
		}

		return false;
	}

	private boolean isProductImageAvailable(ProductModel product, String selectedImage) {
		if (product == null || selectedImage == null || selectedImage.trim().isEmpty()) {
			return false;
		}

		return selectedImage.equals(product.getProductImage()) ||
			   selectedImage.equals(product.getProductImage2()) ||
			   selectedImage.equals(product.getProductImage3()) ||
			   selectedImage.equals(product.getProductImage4());
	}

}