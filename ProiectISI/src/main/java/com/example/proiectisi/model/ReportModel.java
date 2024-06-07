package com.example.proiectisi.model;

public class ReportModel {
    private int trenId;
    private String trenName;
    private int userId;
    private String userName;
    private int ticketCount;
    private double totalSales;
    
    // Getters and setters
    public int getTrenId() {
        return trenId;
    }

    public void setTrenId(int trenId) {
        this.trenId = trenId;
    }

    public String getTrenName() {
        return trenName;
    }

    public void setTrenName(String trenName) {
        this.trenName = trenName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getTicketCount() {
        return ticketCount;
    }

    public void setTicketCount(int ticketCount) {
        this.ticketCount = ticketCount;
    }

    public double getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(double totalSales) {
        this.totalSales = totalSales;
    }
}
