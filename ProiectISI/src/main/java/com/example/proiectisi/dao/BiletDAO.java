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

    public BiletDAO() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/proiect_cfr");
        config.setUsername("admin");
        config.setPassword("intel123");
        config.setMaximumPoolSize(10);
        config.setIdleTimeout(600000);
        config.setMaxLifetime(1800000);

        dataSource = new HikariDataSource(config);
    }

    public List<BiletModel> getAllBilete() throws SQLException {
        List<BiletModel> bilete = new ArrayList<>();
        String sql = "SELECT * FROM bilete";
        
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()) {
            
            while (rs.next()) {
                BiletModel bilet = new BiletModel();
                bilet.setBiletId(rs.getInt("bilet_id"));
                bilet.setNumeCalator(rs.getString("nume_calator"));
                bilet.setNumarTren(rs.getString("numar_tren"));
                bilet.setStatiePlecare(rs.getString("statie_plecare"));
                bilet.setStatieSosire(rs.getString("statie_sosire"));
                bilet.setData(rs.getString("data"));
                bilet.setOra(rs.getString("ora"));
                bilet.setLoc(rs.getString("loc"));
                bilet.setClasa(rs.getString("clasa"));
                bilet.setPret(rs.getDouble("pret"));
                bilete.add(bilet);
            }
        }
        return bilete;
    }
}
