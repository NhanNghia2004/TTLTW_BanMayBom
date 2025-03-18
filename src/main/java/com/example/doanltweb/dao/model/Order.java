package com.example.doanltweb.dao.model;

import java.util.Date;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

public class Order {
	private int id;
	@ColumnName("idUser")
	private int idUser;
	private double totalPrice;
	private String ordeDate;
	private String status;
	@ColumnName("idPayment")
	private int idPayment;
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
	
	public Order(int id, int idUser, double totalPrice, String ordeDate, String status, int idPayment, int quantity) {
		super();
		this.id = id;
		this.idUser = idUser;
		this.totalPrice = totalPrice;
		this.ordeDate = ordeDate;
		this.status = status;
		this.idPayment = idPayment;
		this.quantity = quantity;
	}
	public Order() {
		super();
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", idUser=" + idUser + ", totalPrice=" + totalPrice + ", ordeDate=" + ordeDate
				+ ", status=" + status + ", idPayment=" + idPayment + ", quantity=" + quantity + "]";
	}

	
}	
