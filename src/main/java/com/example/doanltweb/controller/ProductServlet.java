
package com.example.doanltweb.controller;

import java.io.*;
import java.util.List;
import com.example.doanltweb.dao.model.Product;
import com.example.doanltweb.dao.model.Supplier;
import com.example.doanltweb.service.ProductService;
import com.example.doanltweb.service.SupplierService;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;

@WebServlet(name = "ProductServlet", value = "/trangchu")
public class ProductServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ProductService productService = new ProductService();
        List<Product> all = productService.getAllProducts();

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Chỉ lấy tối đa 5 sản phẩm
        int limit = Math.min(all.size(), 4);

        for (int i = 0; i < limit; i++) {
            Product p = all.get(i);
            out.println("<div class='col-md-3'>");
            out.println("<a href='chitietsanpham?id=" + p.getId() + "' style='text-decoration: none'>");
            out.println("<div class='card position-relative'>");
            out.println("<div class='discount-badge'>-10%</div>");
            out.println("<img src='assets/imgs/maybom/" + p.getImage() + "' class='card-img-top' alt='" + p.getNameProduct() + "' />");
            out.println("<div class='card-body themaybom' style='height: 200px'>");
            out.println("<h6 class='card-title'>" + p.getNameProduct() + "</h6>");
            out.println("<p class='old-price'>Giá cũ: 720.000đ</p>");
            out.println("<p class='new-price'>Giá mới: 650.000đ</p>");
            out.println("<button class='btn btn-primary btn-sm' >Xem ngay</button>");
            out.println("<button class='btn btn-danger btn-sm ms-4' >Mua ngay</button>");
            out.println("</div></div></a></div>");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}
