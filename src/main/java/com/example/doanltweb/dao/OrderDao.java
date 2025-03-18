package com.example.doanltweb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.Order;
import com.example.doanltweb.dao.model.OrderDetail;

public class OrderDao {
	  static Map<Integer, Order> data = new HashMap<>();

	    public List<Order> getOrderByUserId(int id) {
	        Jdbi jdbi = JDBIConnect.get();
	        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM orders WHERE idUser = :id")
	        		.bind("id", id)
	        		.map((rs, ctx) -> {
	                    int orderId = rs.getInt("id");
	                    int userId = rs.getInt("idUser");  // Kiểm tra idUser có lấy đúng không
	                    double totalPrice = rs.getDouble("totalPrice");
	                    String orderDate = rs.getString("orderDate");
	                    String status = rs.getString("status");
	                    int idPayment = rs.getInt("idPayment");
	                    int quantity = rs.getInt("quantity");


	                    return new Order(orderId, userId, totalPrice, orderDate, status, idPayment, quantity);
	                }).list());
	    }

	    public List<OrderDetail> getDetailById(int id) {
	        Jdbi jdbi = JDBIConnect.get();
	        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM detailorder WHERE idOrder = :id")
	                .bind("id", id)
	                .map((rs, ctx) -> {
	                	int detailId = rs.getInt("id");
	                	int orderId = rs.getInt("idOrder");
	                	int productId = rs.getInt("idProduct");
	                	int quantity = rs.getInt("quantity");
	                	double price = rs.getDouble("price");
	                	return new OrderDetail(detailId,orderId,productId,quantity,price);
	                }).list());
	                
	               
	    }


	     

}
