package com.example.doanltweb.controller;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Properties;

import com.example.doanltweb.dao.CartDao;
import com.example.doanltweb.dao.OrderDao;
import com.example.doanltweb.dao.PaymentDao;
import com.example.doanltweb.dao.model.Cart;
import com.example.doanltweb.dao.model.Order;
import com.example.doanltweb.dao.model.OrderDetail;
import com.example.doanltweb.dao.model.User;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class CheckoutServlet
 */
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Đọc dữ liệu JSON từ request
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        OrderDao orderDao = new OrderDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        Cart cart = (Cart) session.getAttribute("cart");
        try {

            int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
        
           boolean order = orderDao.createOrder(user.getId(),cart.getTotalPrice(),cart.getTotalAmount(),cart.getId(),paymentMethod);


        jsonResponse.addProperty("success", order);
        jsonResponse.addProperty("message", order ? "Đơn hàng đã tạo thành công!" : "Đặt hàng thất bại");
        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Lỗi xử lý dữ liệu!");
        }
        // Trả JSON response
        PrintWriter out = response.getWriter();
        String jsonString = gson.toJson(jsonResponse);
        System.out.println("JSON Response: " + jsonString);
        out.print(jsonString);
        out.flush();
    }


	

}
