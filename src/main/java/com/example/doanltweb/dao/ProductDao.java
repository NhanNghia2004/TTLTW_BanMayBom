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
    private Jdbi jdbi;

    public ProductDao() {
        this.jdbi = JDBIConnect.get(); // Kết nối JDBI từ lớp JDBIConnect của bạn
    }

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
                            product.setIdCategory(rs.getInt("idCategory"));
                            product.setIdSupplier(rs.getInt("idSupplier"));
                            return product;
                        })
                        .list());
    }

    public boolean addProduct(Product product) {
        String sql = "INSERT INTO product (nameProduct, image, priceProduct, description, manufactureDate, power, " +
                "pressure, flowRate, pipeDiameter, voltage, brand, warrantyMonths, stock, idCategory, idSupplier) " +
                "VALUES (:nameProduct, :image, :priceProduct, :description, :manufactureDate, :power, :pressure, " +
                ":flowRate, :pipeDiameter, :voltage, :brand, :warrantyMonths, :stock, :idCategory, :idSupplier)";

        try {
            // Thêm sản phẩm vào cơ sở dữ liệu
            int rowsAffected = jdbi.withHandle(handle -> {
                return handle.createUpdate(sql)
                        .bind("nameProduct", product.getNameProduct())
                        .bind("image", product.getImage())
                        .bind("priceProduct", product.getPriceProduct())
                        .bind("description", product.getDescription())
                        .bind("manufactureDate", product.getManufactureDate())
                        .bind("power", product.getPower())
                        .bind("pressure", product.getPressure())
                        .bind("flowRate", product.getFlowRate())
                        .bind("pipeDiameter", product.getPipeDiameter())
                        .bind("voltage", product.getVoltage())
                        .bind("brand", product.getBrand())
                        .bind("warrantyMonths", product.getWarrantyMonths())
                        .bind("stock", product.getStock())
                        .bind("idCategory", product.getIdCategory())
                        .bind("idSupplier", product.getIdSupplier())
                        .execute(); // Thực thi câu lệnh SQL INSERT
            });

            if (rowsAffected > 0) {
                System.out.println("Sản phẩm đã được thêm thành công!");
                return true; // Thêm sản phẩm thành công
            } else {
                System.out.println("Không có dòng nào bị ảnh hưởng, thêm sản phẩm thất bại.");
                return false; // Không có dòng nào bị ảnh hưởng
            }
        } catch (Exception e) {
            // In ra thông báo lỗi
            System.err.println("Lỗi khi thêm sản phẩm: " + e.getMessage());
            e.printStackTrace(); // In chi tiết lỗi ra console
            return false;
        }
    }




    public Product getById(int id) {
        Jdbi jdbi = JDBIConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM product WHERE id = :id")
                .bind("id", id)
                .mapToBean(Product.class).findOne().orElse(null));
    }

    public List<Product> getSaleProduct() {
        Jdbi jdbi = JDBIConnect.get();
        String query = "SELECT * FROM Product " +
                "WHERE id IN (SELECT idProduct FROM Sale WHERE status = 1)";
        return jdbi.withHandle(handle -> {
            Query q = handle.createQuery(query);
            return q.mapToBean(Product.class).list();
        });
    }

    public List<Product> getProductBySupplier(int supplierId) {
        Jdbi jdbi = JDBIConnect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM Product WHERE idSupplier = :supplierid")
                        .bind("supplierid", supplierId)
                        .mapToBean(Product.class)
                        .list()
        );
    }


    public boolean deleteById(String id) {
        Jdbi jdbi = JDBIConnect.get();
        return JDBIConnect.get().withHandle(h -> {
            String sql = "DELETE FROM belts WHERE id = :id";
            return h.createUpdate(sql).bind("id", id).execute() > 0;
        });
    }


        public static void main(String[] args) {
            // Tạo đối tượng Product
            Product product = new Product();
            product.setNameProduct("Máy bơm nước");
            product.setImage("image_url.jpg");
            product.setPriceProduct(1000000);
            product.setDescription("Máy bơm nước hiệu quả cao");
            product.setManufactureDate("2025-03-20");
            product.setPower("2 HP");
            product.setPressure(10.5);
            product.setFlowRate(500);
            product.setPipeDiameter(50);
            product.setVoltage(220);
            product.setBrand("Bơm ABC");
            product.setWarrantyMonths(24);
            product.setStock(50);
            product.setIdCategory(1);
            product.setIdSupplier(2);

            // Khởi tạo ProductDao
            ProductDao productDao = new ProductDao();

            // Thêm sản phẩm vào cơ sở dữ liệu
            boolean success = productDao.addProduct(product);

            // Kiểm tra kết quả
            if (success) {
                System.out.println("Sản phẩm đã được thêm thành công!");
            } else {
                System.out.println("Có lỗi xảy ra khi thêm sản phẩm.");
            }
        }


}





