package com.example.proiectisi.model;

public class BiletModel {
    private int id;
    private String destinatie;
    private String dataPlecare;
    private double pret;

    // Constructor fără parametri
    public BiletModel() {
    }

    // Constructor cu parametri
    public BiletModel(int id, String destinatie, String dataPlecare, double pret) {
        this.id = id;
        this.destinatie = destinatie;
        this.dataPlecare = dataPlecare;
        this.pret = pret;
    }

    // Getteri
    public int getId() {
        return id;
    }

    public String getDestinatie() {
        return destinatie;
    }

    public String getDataPlecare() {
        return dataPlecare;
    }

    public double getPret() {
        return pret;
    }

    // Setteri
    public void setId(int id) {
        this.id = id;
    }

    public void setDestinatie(String destinatie) {
        this.destinatie = destinatie;
    }

    public void setDataPlecare(String dataPlecare) {
        this.dataPlecare = dataPlecare;
    }

    public void setPret(double pret) {
        this.pret = pret;
    }

    // Alte metode necesare...
}