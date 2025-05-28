package com.example.doanltweb.controller;

import com.example.doanltweb.service.EmailService;
import com.example.doanltweb.utils.Config;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

import com.example.doanltweb.dao.CartDao;
import com.example.doanltweb.dao.OrderDao;
import com.example.doanltweb.dao.model.Cart;
import com.example.doanltweb.dao.model.CartItem;
import com.example.doanltweb.dao.model.User;
import com.example.doanltweb.utils.CartUtils;
import com.google.gson.JsonObject;

@MultipartConfig
@WebServlet(name = "checkout", value = "/checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Hàm tạo OTP 6 chữ số
	public static String generateOTP() {
		Random random = new Random();
		StringBuilder otp = new StringBuilder();

		// Tạo 6 chữ số ngẫu nhiên
		for (int i = 0; i < 6; i++) {
			otp.append(random.nextInt(10)); // Chọn ngẫu nhiên 1 số từ 0 đến 9
		}

		return otp.toString();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    OrderDao orderDao = new OrderDao();
	    CartDao cartDao = new CartDao();
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("auth");
	    CartUtils.mergeSessionCartToDb(user.getId(),session);
	    Cart cart = cartDao.getCartByUserId(user.getId());
		String otp = generateOTP();

	    int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));

	    boolean order = orderDao.createOrder(user.getId(), cart.getTotalPrice(), paymentMethod, cart.getTotalAmount(), cart.getId(),otp);
	    if(order) {
	    	cartDao.clearCart(cart.getId());
	    	session.setAttribute("cart", new ArrayList<CartItem>());
			// Gửi email trong thread riêng
			new Thread(() -> {
				EmailService.sendOTP(user.getEmail(), otp);
			}).start();
	    }
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("auth");
		JsonObject jsonResponse = new JsonObject();

		if (user == null) {
			jsonResponse.addProperty("success", false);
			jsonResponse.addProperty("message", "Vui lòng đăng nhập");
			out.print(jsonResponse.toString());
			out.flush();
			return;
		}

		int userId = user.getId();
		String paymentMethodParam = request.getParameter("paymentMethod");
		int paymentMethod = (paymentMethodParam != null) ? Integer.parseInt(paymentMethodParam) : 1;
		String bankCode = request.getParameter("bankCode");

		CartDao cartDao = new CartDao();
		Cart cart = cartDao.getCartByUserId(userId);
		CartUtils.mergeSessionCartToDb(userId, session);
		double amountDouble = cart.getTotalPrice();
		int totalAmount = cart.getTotalAmount();
		int cartId = cart.getId();

		OrderDao orderDao = new OrderDao();

		if (paymentMethod == 2) { // VNPAY
			int orderId = orderDao.createOrderNoOtp(userId, amountDouble, paymentMethod, totalAmount, cartId);
			if (orderId < 1) {
				response.sendRedirect("cart");
				return;
			}

			String vnp_Version = "2.1.0";
			String vnp_Command = "pay";
			String orderType = "other";
			long amount = (long) (amountDouble * 100);
			String vnp_TxnRef = String.valueOf(orderId);
			String vnp_IpAddr = Config.getIpAddress(request);
			String vnp_TmnCode = Config.vnp_TmnCode;

			Map<String, String> vnp_Params = new HashMap<>();
			vnp_Params.put("vnp_Version", vnp_Version);
			vnp_Params.put("vnp_Command", vnp_Command);
			vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
			vnp_Params.put("vnp_Amount", String.valueOf(amount));
			vnp_Params.put("vnp_CurrCode", "VND");
			vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
			vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
			vnp_Params.put("vnp_OrderType", orderType);
			vnp_Params.put("vnp_Locale", request.getParameter("language") != null ? request.getParameter("language") : "vn");
			vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
			vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

			if (bankCode != null && !bankCode.isEmpty()) {
				vnp_Params.put("vnp_BankCode", bankCode);
			}

			Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String vnp_CreateDate = formatter.format(cld.getTime());
			vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
			cld.add(Calendar.MINUTE, 15);
			String vnp_ExpireDate = formatter.format(cld.getTime());
			vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

			List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
			Collections.sort(fieldNames);
			StringBuilder hashData = new StringBuilder();
			StringBuilder query = new StringBuilder();
			for (int i = 0; i < fieldNames.size(); i++) {
				String fieldName = fieldNames.get(i);
				String fieldValue = vnp_Params.get(fieldName);
				if (fieldValue != null && !fieldValue.isEmpty()) {
					hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
					query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString())).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
					if (i < fieldNames.size() - 1) {
						hashData.append('&');
						query.append('&');
					}
				}
			}
			String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
			query.append("&vnp_SecureHash=").append(vnp_SecureHash);
			String paymentUrl = Config.vnp_PayUrl + "?" + query.toString();

			response.sendRedirect(paymentUrl);
			return;

		} else {
			// Thanh toán COD hoặc khác
			String otp = generateOTP();
			boolean order = orderDao.createOrder(user.getId(), cart.getTotalPrice(), paymentMethod, cart.getTotalAmount(), cart.getId(), otp);
			if (order) {
				cartDao.clearCart(cart.getId());
				session.setAttribute("cart", new ArrayList<CartItem>());
				new Thread(() -> EmailService.sendOTP(user.getEmail(), otp)).start();
				response.sendRedirect("vnpay_result.jsp");
			}
			jsonResponse.addProperty("success", order);
			jsonResponse.addProperty("message", order ? "Đơn hàng đã tạo thành công!" : "Đặt hàng thất bại");
			out.print(jsonResponse.toString());
			out.flush();
		}
	}
}
