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


public class CartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	HttpSession session = request.getSession();

        CartDao cartDao = new CartDao();
        User user = (User) session.getAttribute("auth");
        Cart cart = (Cart) cartDao.getCartByUserId(user.getId());
        // Lấy giỏ hàng
        if (cart == null) {
            cart = cartDao.createCart(user.getId());
        }

        // Lấy danh sách giỏ hàng cập nhật
        List<CartItem> cartItems = cartDao.getListCartItemByCartId(cart.getId());

        session.setAttribute("cartItems", cartItems); 
        request.setAttribute("cart", cart);
		request.getRequestDispatcher("giohang.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            IOException, ServletException {
    	HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        ProductDao productDao = new ProductDao();
        CartDao cartDao = new CartDao();
        
        User user = (User) session.getAttribute("auth");
        Product product = productDao.getById(productId);
        Cart cart = (Cart) cartDao.getCartByUserId(user.getId());
        // Lấy giỏ hàng
        if (cart == null) {
            cart = cartDao.createCart(user.getId());
        }

        // Kiểm tra sản phẩm trong giỏ hàng
        CartItem cartItem = cartDao.existInCartItem(cart.getId(), productId);
        if (cartItem != null) {
        	 System.out.println(cartDao.updateCartItem(cart.getId(), productId,  quantity));
        } else {
        	cartDao.addToCartItem(cart.getId(), productId, quantity);
        }

        // Lấy danh sách giỏ hàng cập nhật
        List<CartItem> cartItems = cartDao.getListCartItemByCartId(cart.getId());

        session.setAttribute("cartItems", cartItems); 
        session.setAttribute("cart", cart);
		request.getRequestDispatcher("giohang.jsp").forward(request, response);
    }
}
