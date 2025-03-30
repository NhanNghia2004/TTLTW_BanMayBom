package com.example.doanltweb.dao.model;

public class Sale {
    private int id;
    private String promotion;
    private String description;
    private int status;
    private String startDate;
    private String endDate;
    private int idProduct;

    public Sale() {
    }
    public Sale(int id, String promotion, String description, int status, String startDate, String endDate, int idProduct) {
        this.id = id;
        this.promotion = promotion;
        this.description = description;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.idProduct = idProduct;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    @Override
    public String toString() {
        return "Sale{" +
                "id=" + id +
                ", promotion='" + promotion + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", idProduct=" + idProduct +
                '}';
    }
}
