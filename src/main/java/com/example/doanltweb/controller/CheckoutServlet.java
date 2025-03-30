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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.example.doanltweb.dao.CartDao;
import com.example.doanltweb.dao.OrderDao;
import com.example.doanltweb.dao.PaymentDao;
import com.example.doanltweb.dao.model.Cart;
import com.example.doanltweb.dao.model.CartItem;
import com.example.doanltweb.dao.model.Order;
import com.example.doanltweb.dao.model.OrderDetail;
import com.example.doanltweb.dao.model.User;
import com.example.doanltweb.utils.CartUtils;
import com.google.gson.JsonObject;

@MultipartConfig
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    OrderDao orderDao = new OrderDao();
	    CartDao cartDao = new CartDao();
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("auth");
	    Cart cart = cartDao.getCartByUserId(user.getId());


	    int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));

	    CartUtils.mergeSessionCartToDb(user.getId(),session);
	    boolean order = orderDao.createOrder(user.getId(), cart.getTotalPrice(), paymentMethod, cart.getTotalAmount(), cart.getId());
	    if(order) {
	    	cartDao.clearCart(cart.getId());
	    	session.setAttribute("cart", new ArrayList<CartItem>());
	    }
	    // Chuẩn bị response JSON
	    JsonObject jsonResponse = new JsonObject();
	    jsonResponse.addProperty("success", order);
	    jsonResponse.addProperty("message", order ? "Đơn hàng đã tạo thành công!" : "Đặt hàng thất bại");

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    try (PrintWriter out = response.getWriter()) {
	        out.print(jsonResponse);
	        out.flush();
	    }

	}


}
