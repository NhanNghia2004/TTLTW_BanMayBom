package com.example.doanltweb.controller.Admin;

import java.io.*;
import java.util.List;

import com.example.doanltweb.dao.VoucherDao;
import com.example.doanltweb.dao.model.Voucher;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;

@WebServlet(name = "VoucherController", value = "/VoucherController")
public class VoucherController extends HttpServlet {
    private VoucherDao voucherDao;

    @Override
    public void init() {
        voucherDao = new VoucherDao(); // Khởi tạo DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ database
        List<Voucher> vouchers = voucherDao.getAllVouchers();

        // Khởi tạo ObjectMapper và đăng ký module hỗ trợ Java 8 Date/Time
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); // Trả về ISO string thay vì timestamp

        // Chuyển danh sách voucher thành JSON
        String jsonResponse = objectMapper.writeValueAsString(vouchers);

        // Ghi JSON vào response
        response.getWriter().write(jsonResponse);

        // In ra console để debug nếu cần
        System.out.println("JSON response (Voucher): " + jsonResponse);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}