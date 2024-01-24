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



public class TrenDAO {
    private final HikariDataSource dataSource;

    public TrenDAO() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/proiect_cfr");
        config.setUsername("admin"); // Să presupunem că sunt aceleași ca în UtilizatoriDAO
        config.setPassword("intel123");
        config.setMaximumPoolSize(10);
        config.setIdleTimeout(600000);
        config.setMaxLifetime(1800000);

        dataSource = new HikariDataSource(config);
    }

    public List<TrenModel> cautaTrenuri(String deLa, String panaLa, String data) {
        List<TrenModel> listaTrenuri = new ArrayList<>();
        String sql = "SELECT * FROM trenuri WHERE statie_plecare = ? AND statie_sosire = ? AND data = ?";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, deLa);
            statement.setString(2, panaLa);
            statement.setString(3, data);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String nume = resultSet.getString("nume");
                String oraPlecare = resultSet.getString("ora_plecare");
                String durata = resultSet.getString("durata");

                TrenModel tren = new TrenModel(nume, oraPlecare, durata);
                listaTrenuri.add(tren);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Tratarea excepțiilor sau logarea
        }

        return listaTrenuri;
    }
}
