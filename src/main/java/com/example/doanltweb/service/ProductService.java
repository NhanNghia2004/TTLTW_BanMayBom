package com.example.doanltweb.service;



import com.example.doanltweb.dao.ProductDao;
import com.example.doanltweb.dao.model.Product;

import java.util.List;

public class ProductService {
    static ProductDao productdao = new ProductDao();
    public List<Product> getAll() {
        return productdao.getAll();
    }
    public Product getdetail(int in) {
        return productdao.getById(in);
    }
    public List<Product> getAllProductSale() {
        return productdao.getSaleProduct();
    }
    public boolean removeProductById(String in) {
        return productdao.deleteById(in);
    }
    public List<Product> getProductBySupplier(int in) {
        return productdao.getProductBySupplier(in);
    }

    public static void main(String[] args) {
        ProductService productService = new ProductService();
        List<Product> list = productService.getAll();
//        for (Product product : list) {
//            System.out.println(product);
//        }
        List<Product> list1 = productService.getProductBySupplier(1);
        for (Product product : list1) {
            System.out.println(product);
        }
    }
}
