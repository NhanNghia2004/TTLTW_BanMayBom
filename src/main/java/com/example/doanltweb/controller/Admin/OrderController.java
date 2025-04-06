package com.example.doanltweb.controller.Admin;

import com.example.doanltweb.dao.OrderDao;
import com.example.doanltweb.dao.ProductDao;
import com.example.doanltweb.dao.model.Order;
import com.example.doanltweb.dao.model.OrderDetail;
import com.example.doanltweb.dao.model.Product;
import com.example.doanltweb.dao.model.User;
import com.example.doanltweb.service.ProductService;
import com.example.doanltweb.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet(name = "OrderController", value = "/OrderController")
public class OrderController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	OrderDao orderDao = new OrderDao();
    	Map<Order,List<OrderDetail>> order = orderDao.getOrderWithDetails();
        request.setAttribute("orderMap", order);
         // quản lý báo cáo

        System.out.println(order);
        request.getRequestDispatcher("donhang.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }
}




