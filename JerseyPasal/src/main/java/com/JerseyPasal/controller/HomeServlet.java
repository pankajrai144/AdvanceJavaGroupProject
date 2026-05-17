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
 * Servlet implementation class HomeServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/home" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        try {
            ProductDAO productDAO = new ProductDAO();

            ArrayList<ProductModel> topSellingProducts = productDAO.getTopSellingProducts();
            ArrayList<ProductModel> newArrivalProducts = productDAO.getNewArrivalProducts();

            request.setAttribute("topSellingProducts", topSellingProducts);
            request.setAttribute("newArrivalProducts", newArrivalProducts);

            request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("topSellingProducts", new ArrayList<ProductModel>());
            request.setAttribute("newArrivalProducts", new ArrayList<ProductModel>());
            request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
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