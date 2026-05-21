package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.OrderDAO;
import com.JerseyPasal.controller.dao.OrderItemDAO;
import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.dao.ReviewDAO;
import com.JerseyPasal.controller.model.OrderItemModel;
import com.JerseyPasal.controller.model.OrderModel;
import com.JerseyPasal.controller.model.ProductModel;
import com.JerseyPasal.controller.model.ReviewModel;
import com.JerseyPasal.controller.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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
            ReviewDAO reviewDAO = new ReviewDAO();

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

						// The selected size is checked before allowing the user to continue with this product.
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

						// The image is accepted only if it belongs to the selected product.
						if (isProductImageAvailable(selectedProduct, selectedImage)) {
							request.setAttribute("selectedImage", selectedImage);
						}
					}

                    ArrayList<ReviewModel> reviews = reviewDAO.getReviewsByProductId(productId);
                    double averageRating = reviewDAO.getAverageRatingByProductId(productId);
                    int reviewCount = reviewDAO.getReviewCountByProductId(productId);

                    boolean canReview = false;
                    boolean alreadyReviewed = false;
                    int reviewOrderId = 0;

                    HttpSession session = request.getSession(false);

                    if (session != null && session.getAttribute("loggedInUser") != null) {
                        UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");
                        int userId = loggedInUser.getUserid();

                        alreadyReviewed = reviewDAO.hasUserReviewedProduct(userId, productId);

                        // A user can review only if they have a delivered order for this product.
                        reviewOrderId = getDeliveredOrderIdForProduct(userId, productId);

                        if (reviewOrderId > 0 && !alreadyReviewed) {
                            canReview = true;
                        }
                    }

                    request.setAttribute("reviews", reviews);
                    request.setAttribute("averageRating", averageRating);
                    request.setAttribute("reviewCount", reviewCount);
                    request.setAttribute("canReview", canReview);
                    request.setAttribute("alreadyReviewed", alreadyReviewed);
                    request.setAttribute("reviewOrderId", reviewOrderId);
				}
				
				request.setAttribute("products", products);
				request.setAttribute("selectedProduct", selectedProduct);
				
			} else {
                String size = request.getParameter("size");
                String minPriceValue = request.getParameter("minPrice");
                String maxPriceValue = request.getParameter("maxPrice");

                Double minPrice = null;
                Double maxPrice = null;
                String filterError = null;
                boolean invalidFilter = false;

                if (minPriceValue != null && !minPriceValue.trim().isEmpty()) {
                    try {
                        minPrice = Double.parseDouble(minPriceValue.trim());

                        if (minPrice < 0) {
                            filterError = "Minimum price cannot be negative.";
                            invalidFilter = true;
                        }
                    } catch (NumberFormatException e) {
                        filterError = "Minimum price must be a valid number.";
                        invalidFilter = true;
                    }
                }

                if (maxPriceValue != null && !maxPriceValue.trim().isEmpty()) {
                    try {
                        maxPrice = Double.parseDouble(maxPriceValue.trim());

                        if (maxPrice < 0) {
                            filterError = "Maximum price cannot be negative.";
                            invalidFilter = true;
                        }
                    } catch (NumberFormatException e) {
                        filterError = "Maximum price must be a valid number.";
                        invalidFilter = true;
                    }
                }

                // Invalid price range is treated as invalid so products are not shown.
                if (!invalidFilter && minPrice != null && maxPrice != null && minPrice > maxPrice) {
                    filterError = "Minimum price cannot be greater than maximum price.";
                    invalidFilter = true;
                }

                ArrayList<ProductModel> allProducts;

                if (invalidFilter) {
                    allProducts = new ArrayList<>();
                } else {
                    allProducts = dao.getFilteredProducts(size, minPrice, maxPrice);
                }

                int currentPage = 1;
                int productsPerPage = 9;

                String pageValue = request.getParameter("page");

                if (pageValue != null && !pageValue.trim().isEmpty()) {
                    try {
                        currentPage = Integer.parseInt(pageValue);
                    } catch (NumberFormatException e) {
                        currentPage = 1;
                    }
                }

                int totalProducts = allProducts.size();
                int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

                if (totalPages < 1) {
                    totalPages = 1;
                }

                if (currentPage < 1) {
                    currentPage = 1;
                }

                if (currentPage > totalPages) {
                    currentPage = totalPages;
                }

                int startIndex = (currentPage - 1) * productsPerPage;
                int endIndex = Math.min(startIndex + productsPerPage, totalProducts);

                ArrayList<ProductModel> products = new ArrayList<>();

                // Only products for the current page are passed to the JSP.
                if (totalProducts > 0) {
                    products = new ArrayList<>(allProducts.subList(startIndex, endIndex));
                }

                String filterQuery = "";

                // Filter values are kept in pagination links so selected filters are not lost.
                if (size != null && !size.trim().isEmpty()) {
                    filterQuery += "&size=" + URLEncoder.encode(size.trim(), StandardCharsets.UTF_8);
                }

                if (minPriceValue != null && !minPriceValue.trim().isEmpty()) {
                    filterQuery += "&minPrice=" + URLEncoder.encode(minPriceValue.trim(), StandardCharsets.UTF_8);
                }

                if (maxPriceValue != null && !maxPriceValue.trim().isEmpty()) {
                    filterQuery += "&maxPrice=" + URLEncoder.encode(maxPriceValue.trim(), StandardCharsets.UTF_8);
                }

				request.setAttribute("products", products);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("totalProducts", totalProducts);
                request.setAttribute("filterQuery", filterQuery);
                request.setAttribute("filterError", filterError);
			}
			
			request.getRequestDispatcher("/WEB-INF/pages/Products.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();

            // Empty product data is sent so the product page can still open after an error.
			request.setAttribute("products", new ArrayList<ProductModel>());
            request.setAttribute("currentPage", 1);
            request.setAttribute("totalPages", 1);
            request.setAttribute("totalProducts", 0);
            request.setAttribute("filterQuery", "");
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

    private int getDeliveredOrderIdForProduct(int userId, int productId) throws Exception {

        OrderDAO orderDAO = new OrderDAO();
        OrderItemDAO orderItemDAO = new OrderItemDAO();

        ArrayList<OrderModel> orders = orderDAO.getOrdersByUserId(userId);

        if (orders == null || orders.isEmpty()) {
            return 0;
        }

        for (OrderModel order : orders) {
            if ("Delivered".equalsIgnoreCase(order.getOrderStatus())) {
                ArrayList<OrderItemModel> items = orderItemDAO.getOrderItemsByOrderId(order.getOrderId());

                if (items != null && !items.isEmpty()) {
                    for (OrderItemModel item : items) {
                        if (item.getProductId() == productId) {
                            return order.getOrderId();
                        }
                    }
                }
            }
        }

        return 0;
    }

}