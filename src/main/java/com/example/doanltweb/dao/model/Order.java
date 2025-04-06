package com.example.doanltweb.dao.model;

import java.util.Date;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

public class Order {
	private int id;
	private User user;
	private double totalPrice;
	private String orderDate;
	private String status;
	private Payment paymentMethod;
	private int quantity;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	


	public Order() {
		super();
	}
	public Order(int id, User user, double totalPrice, String orderDate, String status, Payment paymentMethod,
			int quantity) {
		super();
		this.id = id;
		this.user = user;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.quantity = quantity;
	}


	@Override
	public String toString() {
	    return "Order{id=" + id + ", orderDate=" + orderDate + ", status=" + status + ", totalPrice=" + totalPrice + "}";
	}

	
}	
