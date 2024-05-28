package com.example.proiectisi.model;

public class BiletModel {
    private int biletId;
    private String numeCalator;
    private String numarTren;
    private String statiePlecare;
    private String statieSosire;
    private String data;
    private String ora;
    private String loc;
    private String clasa;
    private double pret;

    // Getters and setters
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

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getOra() {
        return ora;
    }

    public void setOra(String ora) {
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
