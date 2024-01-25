package com.example.proiectisi.model;

public class CriteriiCautareTrenModel {
    private String deLa;
    private String panaLa;
    private String data;

    // Constructor fără parametri, dacă este necesar
    public CriteriiCautareTrenModel() {
    }

    // Getter și setter pentru 'deLa'
    public String getDeLa() {
        return deLa;
    }

    public void setDeLa(String deLa) {
        this.deLa = deLa;
    }

    // Getter și setter pentru 'panaLa'
    public String getPanaLa() {
        return panaLa;
    }

    public void setPanaLa(String panaLa) {
        this.panaLa = panaLa;
    }

    // Getter și setter pentru 'data'
    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}