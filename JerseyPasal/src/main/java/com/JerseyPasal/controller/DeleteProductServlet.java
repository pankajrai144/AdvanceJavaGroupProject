package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.ProductDAO;
import com.JerseyPasal.controller.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/deleteproduct" })
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect(request.getContextPath() + "/admindashboard");
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

		// Only admin users are allowed to delete products.
		if (loggedInUser.getRole() == null || !loggedInUser.getRole().equalsIgnoreCase("admin")) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		
		try {
			String productIdValue = request.getParameter("productId");
			
			if (productIdValue == null || productIdValue.trim().isEmpty()) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=delete");
				return;
			}
			
			int productId = Integer.parseInt(productIdValue);
			
			ProductDAO dao = new ProductDAO();

			// The selected product is removed using its product id from the admin dashboard.
			boolean deleted = dao.deleteProduct(productId);
			
			if (deleted) {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productDeleted=true");
			} else {
				response.sendRedirect(request.getContextPath() + "/admindashboard?productError=delete");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/admindashboard?productError=delete");
		}
	}

}