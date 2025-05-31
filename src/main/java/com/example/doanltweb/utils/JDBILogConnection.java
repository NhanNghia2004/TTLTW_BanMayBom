package com.example.doanltweb.utils;

import com.example.doanltweb.dao.db.JDBIConnect;
import org.apache.logging.log4j.core.appender.db.jdbc.ConnectionSource;
import org.apache.logging.log4j.core.LifeCycle;

import java.sql.Connection;
import java.sql.SQLException;

public class JDBILogConnection implements ConnectionSource {

    @Override
    public Connection getConnection() throws SQLException {
        return JDBIConnect.get().open().getConnection();
    }

    @Override
    public String toString() {
        return "JDBILogConnection";
    }

    // Các phương thức dưới đây giúp log4j quản lý vòng đời
    @Override
    public State getState() {
        return State.STARTED;
    }

    @Override
    public void initialize() {}

    @Override
    public void start() {}

    @Override
    public void stop() {}

    @Override
    public boolean isStarted() {
        return true;
    }

    @Override
    public boolean isStopped() {
        return false;
    }
}
