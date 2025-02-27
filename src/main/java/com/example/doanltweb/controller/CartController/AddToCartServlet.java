package com.example.doanltweb.controller.CartController;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.example.doanltweb.dao.ProductDao;
import com.example.doanltweb.dao.model.Cart;
import com.example.doanltweb.dao.model.Product;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AddToCartServlet", value = "/add")
public class AddToCartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String productId = request.getParameter("id");
        ProductDao productDao = new ProductDao();
        Product product = productDao.getById(Integer.parseInt(productId));

        if (product != null) {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");

            if (cart == null) {
                cart = new Cart();
            }

            cart.addItem(product, 1);
            session.setAttribute("cart", cart);

            response.sendRedirect("giohang.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            IOException, ServletException {
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        if ("update".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.updateItem(productId, quantity);

        } else if ("remove".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            cart.removeItem(productId);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("giohang.jsp");
    }
}
