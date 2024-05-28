package com.example.proiectisi.dao;

import com.example.proiectisi.model.TrenModel;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

public class TrenDAO {
    private final HikariDataSource dataSource;

    public TrenDAO() {
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
            // Tratează excepțiile
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
            // Tratează excepțiile
        }

        return tren;
    }

}

   
