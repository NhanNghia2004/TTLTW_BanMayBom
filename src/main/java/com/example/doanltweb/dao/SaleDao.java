package com.example.doanltweb.dao;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.Sale;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SaleDao {

    private static final Jdbi jdbi = JDBIConnect.get();

    // Thêm một Sale mới
    public boolean addSale(Sale sale) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO sales (id, promotion, description, status, startDate, endDate, idProduct) " +
                                "VALUES (:id, :promotion, :description, :status, :startDate, :endDate, :idProduct)")
                        .bindBean(sale)
                        .execute() > 0);
    }

    // Lấy tất cả các Sale
    public List<Sale> getAllSales() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM sales")
                        .mapToBean(Sale.class)
                        .list());
    }

    // Lấy Sale theo ID
    public Sale getSaleById(int id) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM sales WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Sale.class)
                        .findOnly());
    }

    // Cập nhật thông tin Sale
    public boolean updateSale(Sale sale) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE sales SET promotion = :promotion, description = :description, status = :status, " +
                                "startDate = :startDate, endDate = :endDate, idProduct = :idProduct WHERE id = :id")
                        .bindBean(sale)
                        .execute() > 0);
    }

    // Xóa Sale theo ID
    public boolean deleteSale(int id) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM sales WHERE id = :id")
                        .bind("id", id)
                        .execute() > 0);
    }

    // Phương thức main để kiểm tra CRUD
    public static void main(String[] args) {
        SaleDao saleDAO = new SaleDao();

//        // Thêm một Sale mới
//        Sale sale1 = new Sale(1, "Giảm giá cho máy bơm T1", "Khuyến mãi giảm giá 15% cho sản phẩm máy bơm T1", 1, "2025-01-14", "2026-02-14", 1);
//        saleDAO.addSale(sale1);

        // Lấy tất cả các Sale
        List<Sale> allSales = saleDAO.getAllSales();
        System.out.println("Danh sách các Sale:");
        for (Sale sale : allSales) {
            System.out.println(sale);
        }

        // Lấy một Sale theo ID
        Sale fetchedSale = saleDAO.getSaleById(1);
        System.out.println("Sale theo ID 1: " + fetchedSale);

//        // Cập nhật Sale
//        if (fetchedSale != null) {
//            fetchedSale.setPromotion("Giảm giá đặc biệt cho máy bơm T1");
//            saleDAO.updateSale(fetchedSale);
//            System.out.println("Sale sau khi cập nhật: " + saleDAO.getSaleById(1));
//        }
//
//        // Xóa Sale theo ID
//        saleDAO.deleteSale(1);
//        System.out.println("Sale đã bị xóa");
//
//        // Kiểm tra lại tất cả các Sale sau khi xóa
//        List<Sale> allSalesAfterDeletion = saleDAO.getAllSales();
//        System.out.println("Danh sách các Sale sau khi xóa:");
//        for (Sale sale : allSalesAfterDeletion) {
//            System.out.println(sale);
        }
    }

