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
			ArrayList<ProductModel> allClubProducts = dao.getProductsByCategory("Club");

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

			if (totalProducts > 0) {
				clubProducts = new ArrayList<>(allClubProducts.subList(startIndex, endIndex));
			}

			request.setAttribute("clubProducts", clubProducts);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPages", totalPages);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Unable to load club products.");
			request.setAttribute("clubProducts", new ArrayList<ProductModel>());
			request.setAttribute("currentPage", 1);
			request.setAttribute("totalPages", 1);
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
