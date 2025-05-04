package com.example.doanltweb.dao.model;

import java.sql.Date;
import java.time.LocalDate;

public class Voucher {
    private int id;
    private String code;
    private String discountValue;       // Ví dụ: "15%", "300000VND"
    private double minOrderValue;       // DECIMAL(10,2)
    private Integer usageLimit;         // Có thể null
    private int usedCount;
    private int maxUsagePerUser;
    private LocalDate startDate;
    private LocalDate endDate;
    private int status;

    public Voucher() {
    }

    public Voucher(int id, String code, String discountValue, double minOrderValue, Integer usageLimit, int usedCount, int maxUsagePerUser, LocalDate startDate, LocalDate endDate, int status) {
        this.id = id;
        this.code = code;
        this.discountValue = discountValue;
        this.minOrderValue = minOrderValue;
        this.usageLimit = usageLimit;
        this.usedCount = usedCount;
        this.maxUsagePerUser = maxUsagePerUser;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(String discountValue) {
        this.discountValue = discountValue;
    }

    public double getMinOrderValue() {
        return minOrderValue;
    }

    public void setMinOrderValue(double minOrderValue) {
        this.minOrderValue = minOrderValue;
    }

    public Integer getUsageLimit() {
        return usageLimit;
    }

    public void setUsageLimit(Integer usageLimit) {
        this.usageLimit = usageLimit;
    }

    public int getUsedCount() {
        return usedCount;
    }

    public void setUsedCount(int usedCount) {
        this.usedCount = usedCount;
    }

    public int getMaxUsagePerUser() {
        return maxUsagePerUser;
    }

    public void setMaxUsagePerUser(int maxUsagePerUser) {
        this.maxUsagePerUser = maxUsagePerUser;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Voucher{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", discountValue='" + discountValue + '\'' +
                ", minOrderValue=" + minOrderValue +
                ", usageLimit=" + usageLimit +
                ", usedCount=" + usedCount +
                ", maxUsagePerUser=" + maxUsagePerUser +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", status=" + status +
                '}';
    }
}
