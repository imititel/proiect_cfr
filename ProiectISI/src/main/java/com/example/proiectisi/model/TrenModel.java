package com.example.proiectisi.model;
import java.time.LocalDate; 

public class TrenModel {
    private int trenId;
    private String numarTren;
    private String nume;
    private String oraPlecare;
    private String durata;
    private String statiePlecare;
    private String statieSosire;
    private LocalDate data;
    private String loc;
    private String clasa;
    private double pret;
    private int id;

    // Constructor cu toate câmpurile
    public TrenModel(int trenId, String numarTren, String nume, String oraPlecare, 
                     String durata, String statiePlecare, String statieSosire, 
                     LocalDate data, String loc, String clasa, double pret) {
        this.trenId = trenId;
        this.numarTren = numarTren;
        this.nume = nume;
        this.oraPlecare = oraPlecare;
        this.durata = durata;
        this.statiePlecare = statiePlecare;
        this.statieSosire = statieSosire;
        this.data = data;
        this.loc = loc;
        this.clasa = clasa;
        this.pret = pret;
    }

    public int getTrenId() {
        return trenId;
    }

    public void setTrenId(int trenId) {
        this.trenId = trenId;
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
    
    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }
    
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getOraPlecare() {
        return oraPlecare;
    }

    public void setOraPlecare(String oraPlecare) {
        this.oraPlecare = oraPlecare;
    }


    public String getDurata() {
        return durata;
    }

    public void setDurata(String durata) {
        this.durata = durata;
    }
    
    public String getNumarTren() {
        return numarTren;
    }

    public void setNumarTren(String numarTren) {
        this.numarTren = numarTren;
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
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
