package com.example.proiectisi.dao;

import com.example.proiectisi.SqlConnection;
import com.example.proiectisi.model.ClientiModel;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ClientiDAO {
    Connection connection = SqlConnection.getInstance().getConnection();
    LogsDAO logsDAO = new LogsDAO();

    public ClientiDAO() throws SQLException, ClassNotFoundException {
    }

 // Metoda pentru a obține detalii despre un client folosind ID-ul său
    public ClientiModel getClientById(String codc) throws SQLException {
        String sql = "SELECT * FROM client WHERE codc = ?";
        try (PreparedStatement preparedStatement = this.connection.prepareStatement(sql)) {
            preparedStatement.setString(1, codc);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    ClientiModel client = new ClientiModel();
                    client.setNumec(resultSet.getString("numec"));
                    client.setPrenumec(resultSet.getString("prenumec"));
                    client.setCnp(resultSet.getString("cnp"));
                    client.setAdresac(resultSet.getString("adresac"));
                    client.setTelefonc(resultSet.getString("telefonc"));
                    client.setEmailc(resultSet.getString("emailc"));
                    client.setLocalitate(resultSet.getString("localitate"));
                    client.setJudet(resultSet.getString("judet"));
                    client.setTara(resultSet.getString("tara"));
                    return client;
                }
            }
        }
        return null; 
    }
    // Metoda pentru a obține codul funcției (rolului) unui utilizator
    public int getCodf(String username) throws SQLException {
        String sql = "SELECT codf FROM utilizatori WHERE username = ?";
        try (PreparedStatement preparedStatement = this.connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("codf");
                }
            }
        }
        return -1; // sau orice alt cod care indică că utilizatorul nu a fost găsit
    }

    // Metoda pentru a verifica dacă un cod de funcție este permis pentru o anumită acțiune
    public boolean isAllowed(int codf, int[] allowedCodes) {
        for (int code : allowedCodes) {
            if (code == codf) {
                return true;
            }
        }
        return false;
    }
    
    public boolean insert(ClientiModel clientiModel, Object user) throws ClassNotFoundException, SQLException {
        boolean status = true;
        PreparedStatement preparedStatement = connection
                .prepareStatement("INSERT INTO client(numec, prenumec, cnp, telefonc, emailc, adresac, localitate, \n" +
                        "                     judet, tara) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
        preparedStatement.setString(1, clientiModel.getNumec());
        preparedStatement.setString(2, clientiModel.getPrenumec());
        preparedStatement.setString(3, clientiModel.getCnp());
        preparedStatement.setString(4, clientiModel.getTelefonc());
        preparedStatement.setString(5, clientiModel.getEmailc());
        preparedStatement.setString(6, clientiModel.getAdresac());
        preparedStatement.setString(7, clientiModel.getLocalitate());
        preparedStatement.setString(8, clientiModel.getJudet());
        preparedStatement.setString(9, clientiModel.getTara());

        System.out.println(preparedStatement);
        if (preparedStatement.execute())
            return true;

        logsDAO.logs(user, preparedStatement.toString());

        return status;
    }

    public boolean update(ClientiModel clientiModel, String codc, Object user) throws ClassNotFoundException, SQLException {
        boolean status = true;
        PreparedStatement preparedStatement = connection
                .prepareStatement("UPDATE client SET numec = ?, prenumec = ?, cnp = ?, \n" +
                        "                                  telefonc = ?, emailc = ?, adresac = ?, localitate = ?, \n" +
                        "                   judet = ?, tara = ? WHERE codc = ?;");
        preparedStatement.setString(1, clientiModel.getNumec());
        preparedStatement.setString(2, clientiModel.getPrenumec());
        preparedStatement.setString(3, clientiModel.getCnp());
        preparedStatement.setString(4, clientiModel.getTelefonc());
        preparedStatement.setString(5, clientiModel.getEmailc());
        preparedStatement.setString(6, clientiModel.getAdresac());
        preparedStatement.setString(7, clientiModel.getLocalitate());
        preparedStatement.setString(8, clientiModel.getJudet());
        preparedStatement.setString(9, clientiModel.getTara());
        preparedStatement.setString(10, codc);

        System.out.println(preparedStatement);
        if (preparedStatement.execute())
            return true;

        logsDAO.logs(user, preparedStatement.toString());

        return status;
    }

    public void delete(String codc, Object user) throws SQLException {
        PreparedStatement preparedStatement = connection
                .prepareStatement("DELETE FROM client where codc = ?;");
        preparedStatement.setString(1, codc);
        preparedStatement.execute();

        logsDAO.logs(user, preparedStatement.toString());
    }
}
