package com.example.doanltweb.controller.Admin;

import com.example.doanltweb.dao.OrderDao;
import com.example.doanltweb.dao.ProductDao;
import com.example.doanltweb.dao.model.Order;
import com.example.doanltweb.dao.model.OrderDetail;
import com.example.doanltweb.dao.model.Product;
import com.example.doanltweb.dao.model.User;
import com.example.doanltweb.service.ProductService;
import com.example.doanltweb.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;


@MultipartConfig
public class OrderController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	OrderDao orderDao = new OrderDao();
    	Map<Order,List<OrderDetail>> order = orderDao.getOrderWithDetails();
        request.setAttribute("orderMap", order);
         // quản lý báo cáo

        System.out.println(order);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tham số từ request
    	response.setContentType("application/json");
    	OrderDao orderDao = new OrderDao();
        String orderIdStr = request.getParameter("orderId");
        System.out.println("Received orderId: " + orderIdStr); // Kiểm tra giá trị orderIdStr
	    PrintWriter out = response.getWriter();
	    JsonObject jsonResponse = new JsonObject();
	    Gson gson = new Gson();

        if (orderIdStr != null && !orderIdStr.isEmpty()) {
            try {
                // Chuyển đổi từ String sang Integer
                int orderId = Integer.parseInt(orderIdStr);

                // Giả sử bạn có phương thức hủy đơn hàng
                boolean success = orderDao.updateStatus(orderId, "CANCELLED");

                if (success) {
                    jsonResponse.addProperty("status", "success");
                    jsonResponse.addProperty("message", "Đơn hàng đã được hủy thành công!");
                    jsonResponse.addProperty("orderId", orderId);
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Đã xảy ra lỗi khi hủy đơn hàng!");
                }


            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"status\": \"error\", \"message\": \"ID đơn hàng không hợp lệ.\"}");
            }
            // Chuyển đổi phản hồi thành JSON và trả về client
		    String jsonString = gson.toJson(jsonResponse);
		    System.out.println("JSON Response: " + jsonString);
		    out.print(jsonString);
		    out.flush();
        } 
    }

}




