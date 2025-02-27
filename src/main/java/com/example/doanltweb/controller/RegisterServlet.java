package com.example.doanltweb.controller;

import java.io.*;

import com.example.doanltweb.dao.UserDao;
import com.example.doanltweb.service.UserService;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        UserDao userDao = new UserDao();


        try {
            userDao.insert(username, password, fullname, email, phone, address, 2); // idPermission mặc định là 2
            response.getWriter().write("Đăng ký thành công!");
            System.out.println("dăng ký thành công");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Có lỗi xảy ra. Vui lòng thử lại.");
        }
    }
}