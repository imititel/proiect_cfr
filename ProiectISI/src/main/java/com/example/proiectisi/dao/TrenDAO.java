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
         // Verifică și validează formatul datei
            try {
                java.sql.Date sqlDate = java.sql.Date.valueOf(data);
                preparedStatement.setDate(3, sqlDate);
            } catch (IllegalArgumentException e) {
                System.err.println("Formatul datei este incorect: " + data);
                // Aici poți trata cum crezi de cuviință această eroare, de exemplu, să continui cu o dată implicită sau să returnezi o listă goală etc.
                return trenuri; // sau un alt mod de tratare a erorii
            }
            
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
            	TrenModel tren = new TrenModel(rs.getString("nume"), rs.getString("ora_plecare"), rs.getString("durata"));
                tren.setNume(rs.getString("nume"));
                tren.setOraPlecare(rs.getTime("ora_plecare").toString()); // Converteste java.sql.Time in String
                tren.setDurata(rs.getString("durata"));
                tren.setStatiePlecare(rs.getString("statie_plecare"));
                tren.setStatieSosire(rs.getString("statie_sosire"));
                
                // Conversia din java.sql.Date în LocalDate
                LocalDate dataCălătoriei = rs.getDate("data").toLocalDate(); // Schimbă numele variabilei pentru a evita duplicate
                tren.setData(dataCălătoriei);

                trenuri.add(tren);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Tratarea erorilor de conexiune și interogare
        }

        return trenuri;
    }
}
