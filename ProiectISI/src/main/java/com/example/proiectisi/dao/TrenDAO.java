package com.example.proiectisi.dao;

import com.example.proiectisi.SqlConnection;
import com.example.proiectisi.model.ReportModel;
import com.example.proiectisi.model.TrenModel;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TrenDAO {
    Connection connection = SqlConnection.getInstance().getConnection();
    private final HikariDataSource dataSource;

    public TrenDAO() throws SQLException, ClassNotFoundException {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/proiect_cfr");
        config.setUsername("admin");
        config.setPassword("intel123");
        config.setMaximumPoolSize(10);
        config.setIdleTimeout(600000);
        config.setMaxLifetime(1800000);

        dataSource = new HikariDataSource(config);
    }

    public List<TrenModel> cautaTrenuri(String deLa, String panaLa, String data) {
        List<TrenModel> trenuri = new ArrayList<>();
        
        String sql = "SELECT * FROM trenuri WHERE statie_plecare = ? AND statie_sosire = ? AND data = ?";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setString(1, deLa);
            preparedStatement.setString(2, panaLa);

            try {
                java.sql.Date sqlDate = java.sql.Date.valueOf(data);
                preparedStatement.setDate(3, sqlDate);
            } catch (IllegalArgumentException e) {
                System.err.println("Formatul datei este incorect: " + data);
                return trenuri;
            }

            System.out.println("Execut SQL: " + preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                TrenModel tren = new TrenModel(
                        rs.getInt("tren_id"),
                        rs.getString("numar_tren"),
                        rs.getString("nume"),
                        rs.getString("ora_plecare"),
                        rs.getString("durata"),
                        rs.getString("statie_plecare"),
                        rs.getString("statie_sosire"),
                        rs.getDate("data").toLocalDate(),
                        rs.getString("loc"),
                        rs.getString("clasa"),
                        rs.getDouble("pret")
                );

                trenuri.add(tren);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return trenuri;
    }
    
    public TrenModel getTrenById(String trenId) {
        TrenModel tren = null;
        String sql = "SELECT * FROM trenuri WHERE tren_id = ?";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, trenId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                tren = new TrenModel(
                    rs.getInt("tren_id"),
                    rs.getString("numar_tren"),
                    rs.getString("nume"),
                    rs.getString("ora_plecare"),
                    rs.getString("durata"),
                    rs.getString("statie_plecare"),
                    rs.getString("statie_sosire"),
                    rs.getDate("data").toLocalDate(),
                    rs.getString("loc"),
                    rs.getString("clasa"),
                    rs.getDouble("pret")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tren;
    }
    
    public List<TrenModel> getAllTrenuri() {
        List<TrenModel> listaTrenuri = new ArrayList<>();
        String sql = "SELECT tren_id, numar_tren, nume, ora_plecare, durata, statie_plecare, statie_sosire, data, loc, clasa, pret FROM trenuri";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                TrenModel tren = new TrenModel(
                    rs.getInt("tren_id"),
                    rs.getString("numar_tren"),
                    rs.getString("nume"),
                    rs.getString("ora_plecare"),
                    rs.getString("durata"),
                    rs.getString("statie_plecare"),
                    rs.getString("statie_sosire"),
                    rs.getDate("data").toLocalDate(),
                    rs.getString("loc"),
                    rs.getString("clasa"),
                    rs.getDouble("pret")
                );
                listaTrenuri.add(tren);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaTrenuri;
    }
    
    public TrenModel getTrenByNumar(String numarTren) {
        TrenModel tren = null;
        String sql = "SELECT * FROM trenuri WHERE numar_tren = ?";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, numarTren);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                tren = new TrenModel(
                    rs.getInt("tren_id"),
                    rs.getString("numar_tren"),
                    rs.getString("nume"),
                    rs.getString("ora_plecare"),
                    rs.getString("durata"),
                    rs.getString("statie_plecare"),
                    rs.getString("statie_sosire"),
                    rs.getDate("data").toLocalDate(),
                    rs.getString("loc"),
                    rs.getString("clasa"),
                    rs.getDouble("pret")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tren;
    }
    
    public List<TrenModel> filterTrains(String tren, String utilizator, Date dataInceput, Date dataSfarsit) {
        List<TrenModel> filteredTrains = new ArrayList<>();
        String sql = "SELECT * FROM trenuri WHERE nume LIKE ? AND utilizator LIKE ? AND data BETWEEN ? AND ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + tren + "%");
            ps.setString(2, "%" + utilizator + "%");
            ps.setDate(3, dataInceput);
            ps.setDate(4, dataSfarsit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TrenModel trenModel = new TrenModel(
                        rs.getInt("tren_id"),
                        rs.getString("numar_tren"),
                        rs.getString("nume"),
                        rs.getString("ora_plecare"),
                        rs.getString("durata"),
                        rs.getString("statie_plecare"),
                        rs.getString("statie_sosire"),
                        rs.getDate("data").toLocalDate(),
                        rs.getString("loc"),
                        rs.getString("clasa"),
                        rs.getDouble("pret")
                    );
                    trenModel.setId(rs.getInt("tren_id")); // Setare ID suplimentar
                    filteredTrains.add(trenModel);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return filteredTrains;
    }

    public List<ReportModel> generateReports(Date dataInceput, Date dataSfarsit) {
        List<ReportModel> reports = new ArrayList<>();
        String sql = "SELECT t.tren_id AS trenId, t.nume AS trenName, u.id AS userId, u.nume AS userName, COUNT(b.id) AS ticketCount, SUM(b.pret) AS totalSales " +
                     "FROM bilet b " +
                     "JOIN trenuri t ON b.tren_id = t.tren_id " +
                     "JOIN utilizatori u ON b.utilizator_id = u.id " +
                     "WHERE b.data BETWEEN ? AND ? " +
                     "GROUP BY t.tren_id, t.nume, u.id, u.nume";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setDate(1, dataInceput);
            ps.setDate(2, dataSfarsit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ReportModel reportModel = new ReportModel();
                    reportModel.setTrenId(rs.getInt("trenId"));
                    reportModel.setTrenName(rs.getString("trenName"));
                    reportModel.setUserId(rs.getInt("userId"));
                    reportModel.setUserName(rs.getString("userName"));
                    reportModel.setTicketCount(rs.getInt("ticketCount"));
                    reportModel.setTotalSales(rs.getDouble("totalSales"));
                    reports.add(reportModel);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }
}
