package com.example.doanltweb.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;

//import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.example.doanltweb.dao.OrderDao;
import com.example.doanltweb.dao.UserDao;
import com.example.doanltweb.dao.model.Order;
import com.example.doanltweb.dao.model.OrderDetail;
import com.example.doanltweb.dao.model.User;
import com.google.gson.*;

@MultipartConfig
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
		OrderDao dao = new OrderDao();
		List<Order> orders = dao.getOrderByUserId(user.getId());

		for (Order order : orders) {
			List<OrderDetail> list = dao.getDetailById(order.getId());
			order.setQuantity(list.size());
		}
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("Userprofile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        JsonObject jsonResponse = new JsonObject();
	        Gson gson = new Gson();
	        HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("auth");

	        try {
	            String fullname = request.getParameter("fullname");
	            String email = request.getParameter("email");
	            String address = request.getParameter("address");
	            String phone = request.getParameter("phone");

	            // Gọi DAO để cập nhật thông tin user
	            UserDao userDao = new UserDao();
	            boolean isUpdated = userDao.updateUser(fullname, email, address, phone,user.getId() );


	            jsonResponse.addProperty("success", isUpdated);
	            jsonResponse.addProperty("message", isUpdated ? "Cập nhật thành công!" : "Cập nhật thất bại, thử lại sau!");

	        } catch (Exception e) {
	            e.printStackTrace();
	            jsonResponse.addProperty("success", false);
	            jsonResponse.addProperty("message", "Lỗi xử lý dữ liệu!");
	        }

	        String jsonString = gson.toJson(jsonResponse);
	        System.out.println("JSON Response: " + jsonString);
	        out.print(jsonString);
	        out.flush();
	    }
	}


