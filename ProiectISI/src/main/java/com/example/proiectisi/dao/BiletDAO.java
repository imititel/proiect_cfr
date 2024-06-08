package com.example.proiectisi.dao;

import com.example.proiectisi.model.BiletModel;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BiletDAO {
    private final HikariDataSource dataSource;

    public BiletDAO() throws SQLException, ClassNotFoundException {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/proiect_cfr");
        config.setUsername("admin");
        config.setPassword("intel123");
        config.setMaximumPoolSize(10);
        config.setIdleTimeout(600000);
        config.setMaxLifetime(1800000);

        dataSource = new HikariDataSource(config);
    }

    public BiletModel getBiletByNumarTren(String numarTren) {
        BiletModel bilet = null;
        String sql = "SELECT * FROM bilete WHERE numar_tren = ? LIMIT 1";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, numarTren);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                bilet = new BiletModel(
                    rs.getInt("bilet_id"),
                    rs.getString("nume_calator"),
                    rs.getString("numar_tren"),
                    rs.getString("statie_plecare"),
                    rs.getString("statie_sosire"),
                    rs.getDate("data"),
                    rs.getTime("ora"),
                    rs.getString("loc"),
                    rs.getString("clasa"),
                    rs.getDouble("pret")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bilet;
    }

    public List<BiletModel> getAllBilete() throws SQLException {
        List<BiletModel> bilete = new ArrayList<>();
        String sql = "SELECT * FROM bilete";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                BiletModel bilet = new BiletModel(
                    rs.getInt("bilet_id"),
                    rs.getString("nume_calator"),
                    rs.getString("numar_tren"),
                    rs.getString("statie_plecare"),
                    rs.getString("statie_sosire"),
                    rs.getDate("data"),
                    rs.getTime("ora"),
                    rs.getString("loc"),
                    rs.getString("clasa"),
                    rs.getDouble("pret")
                );
                bilete.add(bilet);
            }
        }
        return bilete;
    }
}
