package com.example.proiectisi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlConnection {
    private static SqlConnection sqlConnection;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
           return DriverManager.getConnection("jdbc:mysql://localhost:3306/proiect_cfr", "admin", "intel123");
        } catch (ClassNotFoundException | SQLException e) {
        	System.out.print("Trying connection");
            //e.printStackTrace();
            throw new IllegalStateException("Cannot connect the database!", e);
        }
    }

    public synchronized static SqlConnection getInstance(){
    	System.out.print("Getting connection");
        if (sqlConnection == null)
            sqlConnection = new SqlConnection();
        return sqlConnection;
    }
}
