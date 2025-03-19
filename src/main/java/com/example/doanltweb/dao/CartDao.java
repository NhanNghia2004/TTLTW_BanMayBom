package com.example.doanltweb.dao;

import java.util.List;

import org.jdbi.v3.core.Jdbi;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.Cart;
import com.example.doanltweb.dao.model.CartItem;


public class CartDao {

	public Cart getCartByUserId(int id) {
		 Jdbi jdbi = JDBIConnect.get();
	        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM cart WHERE user_id = :id")
	                .bind("id", id)
	                .mapToBean(Cart.class).findOne().orElse(null));
	}
	
	public Cart createCart(int userId) {
	    Jdbi jdbi = JDBIConnect.get();

	    // Chèn vào database và lấy ID của cart vừa tạo
	    Integer cartId = jdbi.withHandle(handle ->
	        handle.createUpdate("INSERT INTO cart (user_id) VALUES (:userId)")
	            .bind("userId", userId)
	            .executeAndReturnGeneratedKeys("id") // Lấy ID của giỏ hàng vừa tạo
	            .mapTo(Integer.class)
	            .findOne()
	            .orElse(null)
	    );

	    // Nếu không tạo được, trả về null
	    if (cartId == null) {
	        return null;
	    }

	    // Trả về đối tượng Cart mới
	    return new Cart(cartId, userId, 0,0);
	}
	
	public CartItem existInCartItem(int cartId, int productId) {
		return null;
	}
	
	public CartItem updateCartItem(int cartId, int productId,  int quantity) {
		return null;
		
	}
	
	public CartItem addToCartItem(int cartId, int productId,  int quantity) {
		return null;
		
	}
	
	public List<CartItem> getListCartItemByCartId(int cartId) {
		return null;
		
	}


}
