package com.example.doanltweb.controller.Admin;

import com.example.doanltweb.dao.UserDao;
import com.example.doanltweb.dao.model.User;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "UserManagerController", value = "/UserManagerController")
public class UserManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Gọi UserDao thay vì UserDAO
        UserDao userDao = new UserDao();
        List<User> users = userDao.getUsersForAdmin();

        // Chuyển danh sách người dùng sang JSON
        Gson gson = new Gson();
        String userJson = gson.toJson(users);

        // Ghi JSON ra response
        response.getWriter().write(userJson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
