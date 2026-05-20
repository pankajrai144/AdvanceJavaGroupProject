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
 * Servlet implementation class SearchServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/search" })
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        try {
            String keyword = request.getParameter("keyword");

            if (keyword == null || keyword.trim().isEmpty()) {
                request.setAttribute("searchKeyword", "");
                request.setAttribute("searchProducts", new ArrayList<ProductModel>());
                request.setAttribute("searchMessage", "Please enter a product name, team, category, size, or season to search.");
                request.getRequestDispatcher("/WEB-INF/pages/search.jsp").forward(request, response);
                return;
            }

            keyword = keyword.trim();

            // Very short search text is avoided to prevent weak or unclear search results.
            if (keyword.length() < 3) {
                request.setAttribute("searchKeyword", keyword);
                request.setAttribute("searchProducts", new ArrayList<ProductModel>());
                request.setAttribute("searchMessage", "Please enter at least 3 characters to search.");
                request.getRequestDispatcher("/WEB-INF/pages/search.jsp").forward(request, response);
                return;
            }

            ProductDAO productDAO = new ProductDAO();

            // The keyword is searched across product details such as jersey name, team, category, size, and season.
            ArrayList<ProductModel> searchProducts = productDAO.searchProducts(keyword);

            request.setAttribute("searchKeyword", keyword);
            request.setAttribute("searchProducts", searchProducts);

            if (searchProducts == null || searchProducts.isEmpty()) {
                request.setAttribute("searchMessage", "No products found for your search.");
            }

            request.getRequestDispatcher("/WEB-INF/pages/search.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            // Empty search data is sent so the search page can still open after an error.
            request.setAttribute("searchKeyword", "");
            request.setAttribute("searchProducts", new ArrayList<ProductModel>());
            request.setAttribute("searchMessage", "Unable to search products. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/search.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}