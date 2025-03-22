package com.example.doanltweb.dao;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.Product;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDao {
    static Map<Integer, Product> data = new HashMap<>();

//    public List<Product> getAll() {
//        Jdbi jdbi = JDBIConnect.get();
//        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM product").mapToBean(Product.class).list());
//    }
public List<Product> getAll() {
    Jdbi jdbi = JDBIConnect.get();
    return jdbi.withHandle(handle ->
            handle.createQuery("SELECT * FROM product")
                    .map((rs, ctx) -> {
                        Product product = new Product();
                        product.setId(rs.getInt("id"));
                        product.setNameProduct(rs.getString("nameProduct"));
                        product.setImage(rs.getString("image"));
                        product.setPriceProduct(rs.getDouble("priceProduct"));
                        product.setDescription(rs.getString("description"));
                        product.setManufactureDate(rs.getString("manufactureDate"));
                        product.setPower(rs.getString("power"));
                        product.setPressure(rs.getDouble("pressure"));
                        product.setFlowRate(rs.getDouble("flowRate"));
                        product.setPipeDiameter(rs.getDouble("pipeDiameter"));
                        product.setVoltage(rs.getInt("voltage"));
                        product.setBrand(rs.getString("brand"));
                        product.setWarrantyMonths(rs.getInt("warrantyMonths"));
                        product.setStock(rs.getInt("stock"));
                        product.setIdCategory(rs.getString("idCategory"));
                        product.setIdSupplier(rs.getString("idSupplier"));
                        return product;
                    })
                    .list());
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


    // Test
    public static void main(String[] args) {
        ProductDao productDao = new ProductDao();

        // Kiểm tra getAll()
        System.out.println("Tất cả sản phẩm:");
        List<Product> allProducts = productDao.getAll();
        allProducts.forEach(product -> System.out.println(product));

        // Kiểm tra getById()
        int testId = 1;  // Giả sử ID sản phẩm là 1
        System.out.println("\nSản phẩm với ID = " + testId + ":");
        Product productById = productDao.getById(testId);
        System.out.println(productById != null ? productById : "Sản phẩm không tồn tại!");

        // Kiểm tra getSaleProduct()
        System.out.println("\nSản phẩm đang giảm giá:");
        List<Product> saleProducts = productDao.getSaleProduct();
        saleProducts.forEach(product -> System.out.println(product));

        // Kiểm tra getProductBySupplier()
        int supplierId = 1;  // Giả sử ID nhà cung cấp là 1
        System.out.println("\nSản phẩm của nhà cung cấp với ID = " + supplierId + ":");
        List<Product> supplierProducts = productDao.getProductBySupplier(supplierId);
        supplierProducts.forEach(product -> System.out.println(product));

//        // Kiểm tra deleteById()
//        String deleteId = "1";  // Giả sử muốn xóa sản phẩm có ID = 1
//        System.out.println("\nXóa sản phẩm với ID = " + deleteId + ":");
//        boolean isDeleted = productDao.deleteById(deleteId);
//        System.out.println(isDeleted ? "Xóa thành công!" : "Xóa thất bại!");
    }

}

