package com.example.doanltweb.service;

import com.example.doanltweb.dao.UserDao;
import com.example.doanltweb.dao.model.User;

import java.util.List;

public class UserService {
    static UserDao userDao = new UserDao();
    public List<User> getUserList() {
        return userDao.getAllUsers();
    }
    public User getUserById(int id) {
        return userDao.getUserbyid(id);
    }
    public boolean deleteUserById(int id) {
        return userDao.delete(id);
    }


    public static void main(String[] args) {
        UserService userService = new UserService();
        List<User> userList = userService.getUserList();
        System.out.println(userList);
    }
}
