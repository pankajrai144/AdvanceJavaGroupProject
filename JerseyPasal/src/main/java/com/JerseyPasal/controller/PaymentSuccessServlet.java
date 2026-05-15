package com.JerseyPasal.controller;

import com.JerseyPasal.controller.dao.OrderDAO;
import com.JerseyPasal.controller.dao.PaymentDAO;
import com.JerseyPasal.controller.model.OrderModel;
import com.JerseyPasal.controller.model.PaymentModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class PaymentSuccessServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/paymentsuccess" })
public class PaymentSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentSuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        try {
            String orderIdValue = request.getParameter("orderId");
            String paymentIdValue = request.getParameter("paymentId");

            if (orderIdValue == null || orderIdValue.trim().isEmpty() ||
                paymentIdValue == null || paymentIdValue.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/product");
                return;
            }

            int orderId = Integer.parseInt(orderIdValue);
            int paymentId = Integer.parseInt(paymentIdValue);

            OrderDAO orderDAO = new OrderDAO();
            PaymentDAO paymentDAO = new PaymentDAO();

            OrderModel order = orderDAO.getOrderById(orderId);
            PaymentModel payment = paymentDAO.getPaymentById(paymentId);

            if (order == null || payment == null) {
                response.sendRedirect(request.getContextPath() + "/product");
                return;
            }

            request.setAttribute("order", order);
            request.setAttribute("payment", payment);

            request.getRequestDispatcher("/WEB-INF/pages/paymentsuccess.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load payment success page.");
            request.getRequestDispatcher("/WEB-INF/pages/paymentsuccess.jsp").forward(request, response);
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
