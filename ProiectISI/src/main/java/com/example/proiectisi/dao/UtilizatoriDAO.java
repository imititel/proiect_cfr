package com.example.proiectisi.dao;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


import com.example.proiectisi.model.UtilizatoriModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UtilizatoriDAO {
    private final HikariDataSource dataSource;
    LogsDAO logsDAO = new LogsDAO();

    public UtilizatoriDAO() throws SQLException, ClassNotFoundException {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/proiect_cfr");
        config.setUsername("admin");
        config.setPassword("intel123");
        config.setMaximumPoolSize(20);
        config.setIdleTimeout(600000); // 10 minutes idle timeout
        config.setMaxLifetime(1800000); // 30 minutes maximum life of the connection

        dataSource = new HikariDataSource(config);
    }

    public Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
    
    public List<UtilizatoriModel> getAllUtilizatori() throws SQLException {
        List<UtilizatoriModel> listaUtilizatori = new ArrayList<>();
        String sql = "SELECT * FROM utilizatori";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()) {
            
            while (rs.next()) {
                UtilizatoriModel utilizator = new UtilizatoriModel();
                utilizator.setId(rs.getInt("userid"));
                utilizator.setCodf(rs.getString("codf"));
                utilizator.setUsername(rs.getString("username"));
                utilizator.setPassword(rs.getString("password"));
                listaUtilizatori.add(utilizator);
            }
        }
        return listaUtilizatori;
    }

    public boolean validate(UtilizatoriModel utilizatoriModel) throws ClassNotFoundException, SQLException {
        boolean status = false;

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM utilizatori WHERE username = ? AND password = ?;")) {
            
            preparedStatement.setString(1, utilizatoriModel.getUsername());
            preparedStatement.setString(2, utilizatoriModel.getPassword());

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                // Verifică dacă resultSet are o înregistrare
                status = resultSet.next();
            }
        }
        
        return status;
    }
    
    public boolean isValidCodf(String codf) throws SQLException {
        String sql = "SELECT COUNT(*) FROM functie WHERE codf = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, codf);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public boolean insert(UtilizatoriModel utilizatoriModel, Object user) throws ClassNotFoundException, SQLException {
        boolean status = false;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO utilizatori(username, password, codf) VALUES (?, ?, ?);")) {
            
            preparedStatement.setString(1, utilizatoriModel.getUsername());
            preparedStatement.setString(2, utilizatoriModel.getPassword());
            preparedStatement.setString(3, utilizatoriModel.getCodf());

            int affectedRows = preparedStatement.executeUpdate();
            status = affectedRows > 0;

            // Log the action
            logAction(connection, user != null ? user.toString() : "unknown", "insert", preparedStatement.toString(), utilizatoriModel.getCodf());
        }
        return status;
    }

    public boolean update(UtilizatoriModel utilizatoriModel, String userid, Object user) throws ClassNotFoundException, SQLException {
        boolean status = false;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE utilizatori SET username = ?, password = ?, codf = ? WHERE userid = ?;")) {
            
            preparedStatement.setString(1, utilizatoriModel.getUsername());
            preparedStatement.setString(2, utilizatoriModel.getPassword());
            preparedStatement.setString(3, utilizatoriModel.getCodf());
            preparedStatement.setString(4, userid);

            int affectedRows = preparedStatement.executeUpdate();
            status = affectedRows > 0;

            // Log the action
            logAction(connection, user != null ? user.toString() : "unknown", "update", preparedStatement.toString(), utilizatoriModel.getCodf());
        }
        return status;
    }

    public void delete(String userid, Object user) throws SQLException {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM utilizatori WHERE userid = ?;")) {
            
            preparedStatement.setString(1, userid);
            preparedStatement.executeUpdate();

            // Log the action
            logAction(connection, user != null ? user.toString() : "unknown", "delete", preparedStatement.toString(), "-1");
        }
    }

    public int getCodf(Object userObject) throws SQLException {
        String user = userObject.toString();
        int codLog = -1;
        PreparedStatement preparedStatement = dataSource.getConnection()
                .prepareStatement("SELECT codf FROM utilizatori WHERE username = ?");
        preparedStatement.setString(1, user);
        ResultSet rs = preparedStatement.executeQuery();

        if(!rs.next())
            System.out.println("No Records in the table");
        else
            codLog = rs.getInt(1);

        return codLog;
    }

    public boolean isAllowed(int codLog, int[] allowed) {
        for (int j : allowed)
            if (j == codLog)
                return true;
        return false;
    }
    
    public boolean isUsernameTaken(String username) throws SQLException {
        String sql = "SELECT COUNT(*) FROM utilizatori WHERE username = ?";
        
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        
        return false;
    }
    
    private void logAction(Connection connection, String username, String action, String command, String codf) throws SQLException {
        // Validate codf
        if (!isValidCodf(codf)) {
            System.out.println("Invalid codf value for logging.");
            return;
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO logs (username, actiune, comanda, datal, oral, codf) VALUES (?, ?, ?, CURRENT_DATE, CURRENT_TIME, ?)")) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, action);
            preparedStatement.setString(3, command);
            preparedStatement.setString(4, codf);

            preparedStatement.executeUpdate();
        }
    }
}
