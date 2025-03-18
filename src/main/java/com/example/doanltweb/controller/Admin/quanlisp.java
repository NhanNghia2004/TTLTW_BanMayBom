package com.example.doanltweb.controller.Admin;

import com.example.doanltweb.dao.ProductDao;
import com.example.doanltweb.dao.model.Product;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/api/products")
public class quanlisp extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ database
        ProductDao productDao = new ProductDao();
        List<Product> products = productDao.getAll();

        // Chuyển danh sách sản phẩm thành JSON
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonResponse = objectMapper.writeValueAsString(products);

        // Kiểm tra JSON
        System.out.println(jsonResponse); // In ra dữ liệu JSON để kiểm tra

        // Gửi dữ liệu JSON về client
        response.getWriter().write(jsonResponse);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}