package com.example.doanltweb.controller.CartController;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.example.doanltweb.dao.CartDao;
import com.example.doanltweb.dao.ProductDao;
import com.example.doanltweb.dao.model.Cart;
import com.example.doanltweb.dao.model.CartItem;
import com.example.doanltweb.dao.model.Product;
import com.example.doanltweb.dao.model.User;

import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;

@MultipartConfig
public class RemoveFromCartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        HttpSession session = request.getSession();

        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDao productDao = new ProductDao();

        Product product = productDao.getById(productId);
        
        // Kiểm tra giỏ hàng đã tồn tại chưa
		List<CartItem> cart =  (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
        	cart = new ArrayList<>(); // 🔥 Khởi tạo giỏ hàng
        	session.setAttribute("cart", cart); // Lưu vào session
        }else {
             for (CartItem cartItem : cart) {
     			if(cartItem.getProduct().getId()== productId) {
     				cart.remove(cartItem);
     				break;
     			}
     		}           
		}
        
       

        session.setAttribute("cart", cart);

        // Trả về JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String jsonResponse = "{\"status\":\"success\", \"message\":\"Cập nhật giỏ hàng thành công!\" }";
        response.getWriter().write(jsonResponse);
    }

}
