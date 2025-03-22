package com.example.doanltweb.dao;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.Product;
import com.example.doanltweb.dao.model.Supplier;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDao {
    static Map<Integer, Product> data = new HashMap<>();

    public List<Product> getAll() {
        Jdbi jdbi = JDBIConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM product").mapToBean(Product.class).list());
    }

    public Product getById(int id) {
        Jdbi jdbi = JDBIConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM product WHERE id = :id")
                .bind("id", id)
                .mapToBean(Product.class).findOne().orElse(null));
    }

    public List<Product> getSaleProduct() {
        Jdbi jdbi = JDBIConnect.get();
        String query = "SELECT * FROM product " +
                "WHERE id IN (SELECT idProduct FROM sale WHERE status = 1)";
        return jdbi.withHandle(handle -> {
            Query q = handle.createQuery(query);
            return q.mapToBean(Product.class).list();
        });
    }
    public List<Product> getProductBySupplier(int supplierId) {
        Jdbi jdbi = JDBIConnect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM product WHERE idSupplier = :supplierid")
                        .bind("supplierid", supplierId)
                        .mapToBean(Product.class)
                        .list()
        );
    }


    public boolean deleteById(String id) {
        Jdbi jdbi = JDBIConnect.get();
        return JDBIConnect.get().withHandle(h -> {
            String sql = "DELETE FROM product WHERE id = :id";
            return h.createUpdate(sql).bind("id", id).execute() > 0;
        });
    }

}
