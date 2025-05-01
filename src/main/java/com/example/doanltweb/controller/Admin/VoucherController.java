package com.example.doanltweb.controller.Admin;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.doanltweb.dao.VoucherDao;
import com.example.doanltweb.dao.model.Voucher;
import com.fasterxml.jackson.core.JsonProcessingException;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);

        try {
            // Đọc JSON từ request body
            BufferedReader reader = request.getReader();
            Voucher newVoucher = objectMapper.readValue(reader, Voucher.class);

            // Debug: In ra đối tượng Voucher nhận được
            System.out.println("Voucher received: " + newVoucher);
            System.out.println("Start date: " + newVoucher.getStartDate());
            System.out.println("End date: " + newVoucher.getEndDate());

            // Kiểm tra ngày bắt đầu và ngày kết thúc
            if (newVoucher.getStartDate() == null || newVoucher.getEndDate() == null) {
                Map<String, String> error = new HashMap<>();
                error.put("error", "Ngày bắt đầu và ngày kết thúc không được để trống hoặc sai định dạng (yyyy-MM-dd)!");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write(objectMapper.writeValueAsString(error));
                return;
            }

            if (newVoucher.getStartDate().isAfter(newVoucher.getEndDate())) {
                Map<String, String> error = new HashMap<>();
                error.put("error", "Ngày bắt đầu phải trước ngày kết thúc!");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write(objectMapper.writeValueAsString(error));
                return;
            }

            // Gọi DAO để thêm voucher
            boolean success = voucherDao.addVoucher(newVoucher);

            if (!success) {
                Map<String, String> error = new HashMap<>();
                error.put("error", "Thêm voucher thất bại. Vui lòng thử lại.");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write(objectMapper.writeValueAsString(error));
                return;
            }

            // Phản hồi thành công
            Map<String, Object> responseMap = new HashMap<>();
            responseMap.put("success", true);
            responseMap.put("message", "Thêm voucher thành công!");
            response.getWriter().write(objectMapper.writeValueAsString(responseMap));

        } catch (JsonProcessingException e) {
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Định dạng JSON không hợp lệ hoặc ngày sai định dạng (yyyy-MM-dd).");
            response.getWriter().write(objectMapper.writeValueAsString(error));

        } catch (IOException e) {
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Dữ liệu không hợp lệ hoặc lỗi khi xử lý yêu cầu.");
            response.getWriter().write(objectMapper.writeValueAsString(error));

        } catch (Exception e) {
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Lỗi máy chủ, vui lòng thử lại.");
            response.getWriter().write(objectMapper.writeValueAsString(error));
        }
    }







}