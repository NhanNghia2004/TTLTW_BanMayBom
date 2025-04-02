package com.example.doanltweb.dao.model;

import java.util.Date;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

public class Order {
	private int id;
	private User user;
	private double totalPrice;
	private String ordeDate;
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
	public String getOrdeDate() {
		return ordeDate;
	}
	public void setOrdeDate(String ordeDate) {
		this.ordeDate = ordeDate;
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
	public Order(int id, User user, double totalPrice, String ordeDate, String status, Payment paymentMethod,
			int quantity) {
		super();
		this.id = id;
		this.user = user;
		this.totalPrice = totalPrice;
		this.ordeDate = ordeDate;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.quantity = quantity;
	}



	
}	
