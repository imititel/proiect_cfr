package com.example.proiectisi.model;

import java.sql.Date;

public class LogModel {
    private int trenId;
    private String trenName;
    private int userId;
    private String userName;
    private Date date;
    private String action;

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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
