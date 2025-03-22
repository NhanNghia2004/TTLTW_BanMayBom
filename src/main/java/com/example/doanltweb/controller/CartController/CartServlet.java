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
        System.out.println("so luong item: "+cartItems.size());
        for (CartItem cartItem : cartItems) {
			System.out.println(cartItem.toString());
		}
        session.setAttribute("cartItems", cartItems); 
        request.setAttribute("cart", cart);
		request.getRequestDispatcher("giohang.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        HttpSession session = request.getSession();

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        ProductDao productDao = new ProductDao();
        CartDao cartDao = new CartDao();

        User user = (User) session.getAttribute("auth");
        Product product = productDao.getById(productId);
        Cart cart = (Cart) cartDao.getCartByUserId(user.getId());
        // Nếu giỏ hàng chưa tồn tại, tạo mới
        if (cart == null) {
            cart = cartDao.createCart(user.getId());
        }

        // Kiểm tra sản phẩm trong giỏ hàng
        boolean result;
        CartItem item = cartDao.existInCartItem(cart.getId(), productId);
        if (item!=null) {
        	int temp = quantity == 1?quantity:quantity-item.getQuantity();
        	
             result = cartDao.updateCartItem(cart.getId(), productId,  item.getQuantity()+temp);
             System.out.println("update: " + result);
        } else {
             result = cartDao.addNewCartItem(cart.getId(), productId, quantity);
             System.out.println("add: " + result);
        }

        // Cập nhật danh sách giỏ hàng
        List<CartItem> cartItems = cartDao.getListCartItemByCartId(cart.getId());
        session.setAttribute("cartItems", cartItems);
        session.setAttribute("cart", cart);

        // Trả về JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Giả sử bạn muốn trả về trạng thái và kích thước giỏ hàng
        int cartSize = cartItems.size();
        String jsonResponse = "{\"status\":\"success\", \"message\":\"Cập nhật giỏ hàng thành công!\", \"cartSize\":" + cartSize + "}";
        response.getWriter().write(jsonResponse);
    }

}
