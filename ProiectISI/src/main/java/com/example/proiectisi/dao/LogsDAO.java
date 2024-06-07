package com.example.proiectisi.dao;

import com.example.proiectisi.SqlConnection;
import com.example.proiectisi.model.LogModel;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LogsDAO {
    Connection connection = SqlConnection.getInstance().getConnection();

    public LogsDAO() throws SQLException, ClassNotFoundException {
    }

    public void logsConnect(Object user, boolean action, String sessionID) throws SQLException {
        String username = (String) user;
        String actionType = action ? "login" : "logout";
        String sql = "INSERT INTO logs (username, actiune, comanda, datal, oral, codf) VALUES (?, ?, ?, CURRENT_DATE, CURRENT_TIME, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, actionType);
            preparedStatement.setString(3, sessionID);
            preparedStatement.setInt(4, getCodf(username));
            preparedStatement.executeUpdate();
        }
    }

    private int getCodf(String username) throws SQLException {
        String sql = "SELECT codf FROM utilizatori WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                } else {
                    return -1;
                }
            }
        }
    }

    public List<LogModel> filterLogs(String tren, String utilizator, Date dataInceput, Date dataSfarsit) {
        List<LogModel> filteredLogs = new ArrayList<>();
        String sql = "SELECT * FROM logs WHERE tren_name LIKE ? AND user_name LIKE ? AND datal BETWEEN ? AND ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + tren + "%");
            ps.setString(2, "%" + utilizator + "%");
            ps.setDate(3, dataInceput);
            ps.setDate(4, dataSfarsit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    LogModel logModel = new LogModel();
                    logModel.setTrenId(rs.getInt("tren_id"));
                    logModel.setTrenName(rs.getString("tren_name"));
                    logModel.setUserId(rs.getInt("user_id"));
                    logModel.setUserName(rs.getString("user_name"));
                    logModel.setDate(rs.getDate("datal"));
                    logModel.setAction(rs.getString("actiune"));
                    filteredLogs.add(logModel);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return filteredLogs;
    }
}
