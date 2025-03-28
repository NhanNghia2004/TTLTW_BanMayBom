package com.example.doanltweb.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.CartItem;
import com.example.doanltweb.dao.model.Order;
import com.example.doanltweb.dao.model.OrderDetail;
import com.example.doanltweb.dao.model.Payment;
import com.example.doanltweb.dao.model.User;


public class OrderDao {
	  static Map<Integer, Order> data = new HashMap<>();
	  UserDao userDao = new UserDao();
	  PaymentDao paymentDao = new PaymentDao();
	  CartDao cartDao = new CartDao();
	  
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

	                    User user = userDao.getUserbyid(userId);
	                    Payment payment = paymentDao.getPaymentbyid(idPayment);
	                    return new Order(orderId, user, totalPrice, orderDate, status, payment, quantity);
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
	    public boolean createOrder(int userId, double totalPrice, int idPayment, int quantity, int cartId) {
	        Jdbi jdbi = JDBIConnect.get();

	        try {
	            return jdbi.inTransaction(handle -> {
	                // 1️⃣ Chèn đơn hàng mới và lấy ID đơn hàng
	                int orderId = handle.createUpdate(
	                        "INSERT INTO orders (user_id, total_price, payment_id, created_at, status) " +
	                        "VALUES (:userId, :totalPrice, :idPayment, NOW(), 'pending')")
	                    .bind("userId", userId)
	                    .bind("totalPrice", totalPrice)
	                    .bind("idPayment", idPayment)
	                    .executeAndReturnGeneratedKeys("id")  
	                    .mapTo(Integer.class)
	                    .one();

	                // 2️⃣ Thêm các mục vào `order_details`
	                List<CartItem> cartItems = cartDao.getListCartItemByCartId(cartId); // Lấy giỏ hàng của user

	                for (CartItem item : cartItems) {
	                    handle.createUpdate(
	                            "INSERT INTO order_details (order_id, product_id, quantity, price) " +
	                            "VALUES (:orderId, :productId, :quantity, :price)")
	                        .bind("orderId", orderId)
	                        .bind("productId", item.getProduct().getId())
	                        .bind("quantity", item.getQuantity())
	                        .bind("price", item.getProduct().getPriceProduct())
	                        .execute();
	                }

	                // 3️⃣ Xóa giỏ hàng sau khi đặt hàng thành công
	                handle.createUpdate("DELETE FROM cart WHERE user_id = :userId")
	                    .bind("userId", userId)
	                    .execute();

	                return true; // ✅ Trả về true nếu đặt hàng thành công
	            });
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false; // ❌ Trả về false nếu có lỗi xảy ra
	        }
	    }

	  


	     

}
