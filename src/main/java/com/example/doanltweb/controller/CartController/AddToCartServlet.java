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
public class AddToCartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        HttpSession session = request.getSession();
        boolean updated = false;
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ProductDao productDao = new ProductDao();
        CartDao cartDao = new CartDao();

        Product product = productDao.getById(productId);
        
        // Kiểm tra giỏ hàng đã tồn tại chưa
		List<CartItem> cart =  (List<CartItem>) session.getAttribute("cart");
		System.out.println("origin cart"+cart);
		System.out.println(productId);
	    System.out.println(quantity);
        if (cart == null) {
        	cart = new ArrayList<>(); // 🔥 Khởi tạo giỏ hàng
        	session.setAttribute("cart", cart); // Lưu vào session
        }else {
        	for (CartItem cartItem : cart) {
        		if(cartItem.getProduct().getId()== productId) {
        			System.out.println(cartItem);
        			cartItem.setQuantity(cartItem.getQuantity()+ quantity);
        			updated = true;
        		}
        	}
		}
        
        if(!updated) {
        	cart.add(new CartItem(0, product, quantity));
        }
        
        System.out.println("updated cart"+cart);
        session.setAttribute("cart", cart);

        // Trả về JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String jsonResponse = "{\"status\":\"success\", \"message\":\"Cập nhật giỏ hàng thành công!\" }";
        response.getWriter().write(jsonResponse);
    }

}
