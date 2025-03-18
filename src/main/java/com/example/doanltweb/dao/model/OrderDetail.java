package com.example.doanltweb.dao.model;

public class OrderDetail {
	private int id;
	private int idOrder;
	private int idProduct;
	private int quantity;
	private double price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdOrder() {
		return idOrder;
	}
	public void setIdOrder(int idOrder) {
		this.idOrder = idOrder;
	}
	public int getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public OrderDetail(int id, int idOrder, int idProduct, int quantity, double price) {
		super();
		this.id = id;
		this.idOrder = idOrder;
		this.idProduct = idProduct;
		this.quantity = quantity;
		this.price = price;
	}
	
	public OrderDetail() {
		super();
	}
	
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", idOrder=" + idOrder + ", idProduct=" + idProduct + ", quantity=" + quantity
				+ ", price=" + price + "]";
	}
	
	
}
