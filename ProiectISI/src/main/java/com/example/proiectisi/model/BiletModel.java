package com.example.proiectisi.model;

import java.sql.Date;
import java.sql.Time;

public class BiletModel {
    private int biletId;
    private String numeCalator;
    private String numarTren;
    private String statiePlecare;
    private String statieSosire;
    private Date data;
    private Time ora;
    private String loc;
    private String clasa;
    private double pret;

    public BiletModel(int biletId, String numeCalator, String numarTren, String statiePlecare, String statieSosire, Date data, Time ora, String loc, String clasa, double pret) {
        this.biletId = biletId;
        this.numeCalator = numeCalator;
        this.numarTren = numarTren;
        this.statiePlecare = statiePlecare;
        this.statieSosire = statieSosire;
        this.data = data;
        this.ora = ora;
        this.loc = loc;
        this.clasa = clasa;
        this.pret = pret;
    }

    // Getters and Setters
    public int getBiletId() {
        return biletId;
    }

    public void setBiletId(int biletId) {
        this.biletId = biletId;
    }

    public String getNumeCalator() {
        return numeCalator;
    }

    public void setNumeCalator(String numeCalator) {
        this.numeCalator = numeCalator;
    }

    public String getNumarTren() {
        return numarTren;
    }

    public void setNumarTren(String numarTren) {
        this.numarTren = numarTren;
    }

    public String getStatiePlecare() {
        return statiePlecare;
    }

    public void setStatiePlecare(String statiePlecare) {
        this.statiePlecare = statiePlecare;
    }

    public String getStatieSosire() {
        return statieSosire;
    }

    public void setStatieSosire(String statieSosire) {
        this.statieSosire = statieSosire;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Time getOra() {
        return ora;
    }

    public void setOra(Time ora) {
        this.ora = ora;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    public String getClasa() {
        return clasa;
    }

    public void setClasa(String clasa) {
        this.clasa = clasa;
    }

    public double getPret() {
        return pret;
    }

    public void setPret(double pret) {
        this.pret = pret;
    }
}
