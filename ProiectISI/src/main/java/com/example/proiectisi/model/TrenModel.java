package com.example.proiectisi.model;
import java.time.LocalDate; 

public class TrenModel {
    private String nume;
    private String oraPlecare;
    private String durata;
    private String statiePlecare;
    private String statieSosire;
    private LocalDate data;

    public TrenModel(String nume, String oraPlecare, String durata) {
        this.nume = nume;
        this.oraPlecare = oraPlecare;
        this.durata = durata;
    }

 // Getter și setter pentru statiePlecare
    public String getStatiePlecare() {
        return statiePlecare;
    }

    public void setStatiePlecare(String statiePlecare) {
        this.statiePlecare = statiePlecare;
    }

    // Getter și setter pentru statieSosire
    public String getStatieSosire() {
        return statieSosire;
    }

    public void setStatieSosire(String statieSosire) {
        this.statieSosire = statieSosire;
    }
    
    // Getter și setter pentru data
    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }
    
    // Getter și setter pentru nume
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    // Getter și setter pentru oraPlecare
    public String getOraPlecare() {
        return oraPlecare;
    }

    public void setOraPlecare(String oraPlecare) {
        this.oraPlecare = oraPlecare;
    }

    // Getter și setter pentru durata
    public String getDurata() {
        return durata;
    }

    public void setDurata(String durata) {
        this.durata = durata;
    }
    
    
    @Override
    public String toString() {
        return "Tren{" +
               "nume='" + nume + '\'' +
               ", oraPlecare='" + oraPlecare + '\'' +
               ", durata='" + durata + '\'' +
               ", statiePlecare='" + statiePlecare + '\'' +
               ", statieSosire='" + statieSosire + '\'' +
               ", data=" + data +
               '}';
    }
}
