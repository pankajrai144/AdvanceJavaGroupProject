package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.model.ProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

/**
 * Servlet implementation class ClubsServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/clubs" })
public class ClubsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClubsServlet() {
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

			ArrayList<ProductModel> allClubProducts;

			if (invalidFilter) {
				allClubProducts = new ArrayList<>();
			} else {
				allClubProducts = dao.getFilteredProductsByCategory("Club", size, minPrice, maxPrice);
			}

			int productsPerPage = 9;
			int currentPage = 1;

			String pageValue = request.getParameter("page");

			if (pageValue != null && !pageValue.trim().isEmpty()) {
				try {
					currentPage = Integer.parseInt(pageValue);
				} catch (NumberFormatException e) {
					currentPage = 1;
				}
			}

			int totalProducts = allClubProducts.size();
			int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

			if (totalPages == 0) {
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

			ArrayList<ProductModel> clubProducts = new ArrayList<>();

			// Only the products for the selected page are sent to the JSP.
			if (totalProducts > 0) {
				clubProducts = new ArrayList<>(allClubProducts.subList(startIndex, endIndex));
			}

			String filterQuery = "";

			// Filter values are kept in the page links so pagination does not reset the selected filters.
			if (size != null && !size.trim().isEmpty()) {
				filterQuery += "&size=" + URLEncoder.encode(size.trim(), StandardCharsets.UTF_8);
			}

			if (minPriceValue != null && !minPriceValue.trim().isEmpty()) {
				filterQuery += "&minPrice=" + URLEncoder.encode(minPriceValue.trim(), StandardCharsets.UTF_8);
			}

			if (maxPriceValue != null && !maxPriceValue.trim().isEmpty()) {
				filterQuery += "&maxPrice=" + URLEncoder.encode(maxPriceValue.trim(), StandardCharsets.UTF_8);
			}

			request.setAttribute("clubProducts", clubProducts);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("filterQuery", filterQuery);
			request.setAttribute("filterError", filterError);

		} catch (Exception e) {
			e.printStackTrace();

			// Empty product data is sent so the club page can still load after an error.
			request.setAttribute("error", "Unable to load club products.");
			request.setAttribute("clubProducts", new ArrayList<ProductModel>());
			request.setAttribute("currentPage", 1);
			request.setAttribute("totalPages", 1);
			request.setAttribute("filterQuery", "");
		}

		request.getRequestDispatcher("/WEB-INF/pages/clubs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}