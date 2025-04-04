package com.example.doanltweb.controller.Admin;

import com.example.doanltweb.dao.SaleDao;
import com.example.doanltweb.dao.model.Sale;
import com.example.doanltweb.service.SaleService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SaleController", value = "/SaleController")
public class SaleController extends HttpServlet {

    private SaleDao saleDao;

    @Override
    public void init() {
        saleDao = new SaleDao(); // Khởi tạo DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ database
        SaleDao saleDao = new SaleDao();
        List<Sale> sales = saleDao.getAllSales();

        // Khởi tạo ObjectMapper và đăng ký module hỗ trợ Java 8 Date/Time
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); // Để trả về chuỗi ISO thay vì timestamp

        // Chuyển danh sách khuyến mãi thành JSON
        String jsonResponse = objectMapper.writeValueAsString(sales);

        // Ghi JSON vào response
        response.getWriter().write(jsonResponse);

        // In ra console để debug nếu cần
        System.out.println(" JSON response: " + jsonResponse);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
