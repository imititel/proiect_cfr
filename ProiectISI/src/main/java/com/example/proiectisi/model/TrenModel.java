package com.example.proiectisi.model;

public class TrenModel {
    private String nume;
    private String oraPlecare;
    private String durata;

    public TrenModel(String nume, String oraPlecare, String durata) {
        this.nume = nume;
        this.oraPlecare = oraPlecare;
        this.durata = durata;
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

    // Metoda toString, dacă este necesară
    @Override
    public String toString() {
        return "Tren{" +
               "nume='" + nume + '\'' +
               ", oraPlecare='" + oraPlecare + '\'' +
               ", durata='" + durata + '\'' +
               '}';
    }
}
