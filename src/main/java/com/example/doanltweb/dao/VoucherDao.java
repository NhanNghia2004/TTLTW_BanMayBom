package com.example.doanltweb.dao;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.Voucher;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class VoucherDao {
    private static final Jdbi jdbi = JDBIConnect.get();
    public List<Voucher> getAllVouchers() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM vouchers")
                        .mapToBean(Voucher.class)
                        .list());
    }

    public static void main(String[] args) {
        VoucherDao voucherDao = new VoucherDao();

        // Lấy tất cả voucher từ database
        List<Voucher> vouchers = voucherDao.getAllVouchers();

        // In danh sách voucher ra console
        for (Voucher v : vouchers) {
            System.out.println("ID: " + v.getId());
            System.out.println("Code: " + v.getCode());
            System.out.println("Discount: " + v.getDiscountValue());
            System.out.println("Min Order: " + v.getMinOrderValue());
            System.out.println("Usage Limit: " + v.getUsageLimit());
            System.out.println("Used Count: " + v.getUsedCount());
            System.out.println("Max per User: " + v.getMaxUsagePerUser());
            System.out.println("Valid Range: " + v.getValidRange());
            System.out.println("Status: " + v.getStatus());
            System.out.println("---------------------------");
        }

    }
}
