package com.example.doanltweb.dao;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.Voucher;
import org.jdbi.v3.core.Jdbi;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class VoucherDao {
    private static final Jdbi jdbi = JDBIConnect.get();

    public List<Voucher> getAllVouchers() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM vouchers")
                        .mapToBean(Voucher.class)
                        .list());
    }

    public boolean addVoucher(Voucher voucher) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO vouchers (code, discountValue, minOrderValue, usageLimit, usedCount, maxUsagePerUser, startDate, endDate, status) " +
                                "VALUES (:code, :discountValue, :minOrderValue, :usageLimit, :usedCount, :maxUsagePerUser, :startDate, :endDate, :status)")
                        .bind("code", voucher.getCode())
                        .bind("discountValue", voucher.getDiscountValue())
                        .bind("minOrderValue", voucher.getMinOrderValue())
                        .bind("usageLimit", voucher.getUsageLimit())
                        .bind("usedCount", voucher.getUsedCount())
                        .bind("maxUsagePerUser", voucher.getMaxUsagePerUser())
                        .bind("startDate", voucher.getStartDate())
                        .bind("endDate", voucher.getEndDate())
                        .bind("status", voucher.getStatus())
                        .execute() > 0);
    }

    public static void main(String[] args) {
        VoucherDao voucherDao = new VoucherDao();

        // Tạo mới một voucher
        Voucher newVoucher = new Voucher();
        newVoucher.setCode("NEWYEAR2027");
        newVoucher.setDiscountValue("20%");
        newVoucher.setMinOrderValue(500000.00);
        newVoucher.setUsageLimit(100);
        newVoucher.setUsedCount(0);
        newVoucher.setMaxUsagePerUser(1);

        // Parse từ chuỗi validRange -> LocalDate
        String validRange = "2025-01-01T00:00:00 to 2025-01-31T23:59:59";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        String[] parts = validRange.split(" to ");
        LocalDate start = LocalDate.parse(parts[0], formatter);
        LocalDate end = LocalDate.parse(parts[1], formatter);
        newVoucher.setStartDate(start);
        newVoucher.setEndDate(end);

        newVoucher.setStatus(1);

        // Thêm vào DB
        boolean success = voucherDao.addVoucher(newVoucher);
        if (success) {
            System.out.println("Voucher added successfully!");
        } else {
            System.out.println("Failed to add voucher.");
        }
    }

}
