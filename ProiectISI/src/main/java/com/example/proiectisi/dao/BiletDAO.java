package com.example.proiectisi.dao;

import com.example.proiectisi.model.BiletModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BiletDAO {

    private Connection connection;

    public BiletDAO(Connection connection) {
        this.connection = connection;
    }

    public List<BiletModel> getAllBilete() throws SQLException {
        List<BiletModel> bilete = new ArrayList<>();
        String query = "SELECT * FROM bilete"; // Presupunând că aveți o tabelă "bilete"
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            BiletModel bilet = new BiletModel();
            // Setează atributele biletului aici, de exemplu:
            // bilet.setId(resultSet.getInt("id"));
            // bilet.setNume(resultSet.getString("nume"));
            // ...
            bilete.add(bilet);
        }

        return bilete;
    }

    // Alte metode pentru operațiuni CRUD
}
