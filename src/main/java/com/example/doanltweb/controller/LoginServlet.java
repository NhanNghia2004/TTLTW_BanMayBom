package com.example.doanltweb.controller;import java.io.*;

import com.example.doanltweb.dao.LogDao;
import com.example.doanltweb.dao.UserDao;
import com.example.doanltweb.dao.model.User;
import com.mysql.cj.Session;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Jdbi;

@WebServlet(name = "LoginServlet", value = "/LoginController")
public class LoginServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        
        String ip = request.getRemoteAddr();
        Integer count = (Integer) session.getAttribute("loginFail"); // Lấy số lần đăng nhập thất bại
        if (count == null) {
            count = 0; // Nếu chưa có, gán mặc định là 0
        }	
        
        // Khởi tạo UserDao để kiểm tra đăng nhập
        UserDao userDao = new UserDao();
        User user = userDao.login(username, password);  // Phương thức checkUser đã kiểm tra mật khẩu mã hóa

        // Kiểm tra kết quả đăng nhập
        if (user != null) {
            
            session.setAttribute("auth", user); // Lưu thông tin người dùng vào session
            LogDao.saveLog(user.getId(), "INFO", ip, "LOGIN", "username=" + username, "SUCCESS");

            // Nếu người dùng là Admin (role == 1)
            if (user.getIdPermission() == 1 ) {
                System.out.println("lỗi");
                response.sendRedirect("admin");
            } else {
//                response.sendRedirect("trangchu");
            	response.sendRedirect("/DoAnLTWeb/trangchu");
            }
        } else {
            // Nếu đăng nhập không thành công, hiển thị thông báo lỗi
        	count++; // Tăng số lần thất bại
            session.setAttribute("loginFail", count); // Lưu lại số lần thất bại vào session
        	LogDao.saveLog(0, "WARN", ip, "LOGIN", "username=" + username,"Login fail: " + count +"times");
            request.setAttribute("error", "Đăng nhập không thành công. Vui lòng kiểm tra lại thông tin.");
            request.setAttribute("username", username);
            System.out.println(session.getAttribute("auth"));
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}