package com.example.doanltweb.controller.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import com.example.doanltweb.dao.ProductDao;
import com.example.doanltweb.dao.StockInDao;
import com.example.doanltweb.dao.model.Product;
import com.example.doanltweb.dao.model.StockIn;

@MultipartConfig
@WebServlet("/StockInController")
public class StockInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StockInDao stockInDao = new StockInDao();
    ProductDao productDao = new ProductDao();   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<StockIn> records = stockInDao.getAllRecord();
		request.setAttribute("records", records);
		request.getRequestDispatcher("nhaphang.jsp").forward(request, response);
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8"); // đảm bảo nhận tiếng Việt
	    
	    try {
	        // Lấy dữ liệu từ form
	        int productId = Integer.parseInt(request.getParameter("productId"));
	        int quantity = Integer.parseInt(request.getParameter("quantity"));

	        Product product = productDao.getById(productId);
	        boolean s =stockInDao.newStockIn(quantity,product); 

	        response.setStatus(HttpServletResponse.SC_OK); // 200
	        response.getWriter().write("Thành công");

	    } catch (Exception e) {
	    	 e.printStackTrace();
	    	 response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
		     response.getWriter().write(e.getMessage());
	    }
	}


}
