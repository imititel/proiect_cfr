package com.example.proiectisi.model;
import java.util.HashMap;
import java.util.Map;


import java.io.Serializable;

public class UtilizatoriModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private String username, password, codf;
    private int userid;
    
    public UtilizatoriModel(String username, String password, String codf) {
        this.username = username;
        this.password = password;
        this.codf= codf;
    }

    public UtilizatoriModel() {

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCodf() {
        return codf;
    }

    public void setCodf(String codf) {
        this.codf = codf;
    }
    
    public int getId() {
        return userid;
    }

    public void setId(int userid) {
        this.userid = userid;
    }
    
    
    // Map pentru a face maparea între codf și tipul de utilizator
    private static final Map<String, String> codfToUserType = new HashMap<>();
    static {
        codfToUserType.put("1", "Manager CFR");
        codfToUserType.put("2", "Casier CFR");
        codfToUserType.put("3", "Client");
    }
    
    
    public String getUserType() {
        // Verificați dacă codf există în map și returnați tipul de utilizator corespunzător
        if (codfToUserType.containsKey(this.codf)) {
            return codfToUserType.get(this.codf);
        } else {
            return "Unknown";
        }
    }
 
}