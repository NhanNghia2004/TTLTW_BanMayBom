package com.example.doanltweb.dao;

import com.example.doanltweb.dao.db.JDBIConnect;
import com.example.doanltweb.dao.model.Product;
import com.example.doanltweb.dao.model.User;
import org.jdbi.v3.core.Jdbi;
import org.apache.commons.codec.digest.DigestUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDao {
    static Map<Integer, User> data = new HashMap<>();

    public List<User> getAllUsers() {
        Jdbi jdbi = JDBIConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM user").mapToBean(User.class).list());
    }

    public User getUserbyid(int id) {
        Jdbi jdbi = JDBIConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM user where id_user= :id").bind("id_user", id)
                .mapToBean(User.class).findOne().orElse(null));
    }

    public User login(String username, String password) {
        Jdbi jdbi = JDBIConnect.get();
        try {
            return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM user WHERE username = :username AND password = :password")
                    .bind("username", username)
                    .bind("password", password)
                    .mapToBean(User.class)
                    .findOne()
                    .orElse(null));
        } catch (Exception e) {
            e.printStackTrace();  // Hoặc log vào một logger riêng
            return null;
        }
    }

    public void insert(String username,
                       String password,
                       String fullname,
                       String email,
                       String phone,
                       String address,
                       int idPermission) {
        Jdbi jdbi = JDBIConnect.get();
        jdbi.useHandle(handle -> handle.createUpdate("INSERT INTO user (username, password, fullname, email, phone, address, idPermission) VALUES (:username, :password, :fullname, :email, :phone, :address, :idPermission)")
                .bind("username", username)
                .bind("password", password) // Ensure password is properly hashed/salted
                .bind("fullname", fullname)
                .bind("email", email)
                .bind("phone", phone)
                .bind("address", address)
                .bind("idPermission", idPermission)
                .execute());
    }

    public boolean delete(int id) {
        Jdbi jdbi = JDBIConnect.get();
        try {
            jdbi.useHandle(handle -> handle.createUpdate("DELETE FROM user WHERE id = :id")
                    .bind("id", id)
                    .execute());
            return true; // Xóa thành công
        } catch (Exception e) {
            e.printStackTrace(); // In thông tin lỗi
            return false; // Xóa thất bại
        }
    }

    public static void main(String[] args) {
        UserDao userDao = new UserDao();
        List<User> users = userDao.getAllUsers();
    }
}