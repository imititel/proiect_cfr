package com.example.proiectisi.controller;

import com.example.proiectisi.dao.TrenDAO;
import com.example.proiectisi.model.TrenModel;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/obtine_date_tren")
public class ObtineDateTrenServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final TrenDAO trenDAO; // Adăugați o referință la TrenDAO

    public ObtineDateTrenServlet() {
        trenDAO = new TrenDAO(); // Inițializați TrenDAO în constructor
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obțineți parametrul "numar_tren" din cerere
        String trenSelectatId = request.getParameter("numar_tren");

        // Verificați dacă parametrul "numar_tren" este valid și tratați erorile dacă este necesar
        if (trenSelectatId == null || trenSelectatId.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Număr tren invalid.");
            return;
        }

        // Apelați metoda getTrenByNumar din TrenDAO pentru a obține datele trenului
        // Notă: Asigurați-vă că metoda există în TrenDAO și că poate gestiona căutarea după numărul trenului
        TrenModel tren = trenDAO.getTrenByNumar(trenSelectatId);

        // Verificați dacă trenul a fost găsit sau nu
        if (tren == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("Trenul cu numărul specificat nu a fost găsit.");
            return;
        }

        // Convertiți obiectul TrenModel în format JSON
        String jsonResponse = "{\"nume\": \"" + tren.getNume() + "\", \"loc\": \"" + tren.getLoc() + "\", \"clasa\": \"" + tren.getClasa() + "\", \"pret\": " + tren.getPret() + "}";

        // Setăm tipul de conținut al răspunsului la JSON
        response.setContentType("application/json");

        // Trimitem răspunsul JSON înapoi la client
        response.getWriter().write(jsonResponse);
    }
}
