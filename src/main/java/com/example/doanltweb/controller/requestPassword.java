package com.example.doanltweb.controller;

import java.io.*;
import java.time.LocalDateTime;

import com.example.doanltweb.dao.UserDao;
import com.example.doanltweb.dao.model.TokenForgetPassword;
import com.example.doanltweb.dao.model.User;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;

@WebServlet(name = "requestPassword", value = "/requestPassword")
public class requestPassword extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        UserDao userDao = new UserDao();
        User user = userDao.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("mess","email not found");
            request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
            return;
        }
        resetService resetService = new resetService();
        String linkreset = "http://localhost:8080/DoAnLTWeb_war/resetPassword?token="+resetService.generateToken();
        String token = resetService.generateToken();
        TokenForgetPassword newTokenForget = new TokenForgetPassword(user.getId(), false, token, resetService.expireDateTime());
    }
}