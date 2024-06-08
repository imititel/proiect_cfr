package com.example.proiectisi.controller;

import com.example.proiectisi.dao.BiletDAO;
import com.example.proiectisi.model.BiletModel;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/obtine_date_tren")
public class ObtineDateTrenServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final BiletDAO biletDAO;

    public ObtineDateTrenServlet() throws ClassNotFoundException, SQLException {
        biletDAO = new BiletDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trenSelectatId = request.getParameter("numar_tren");

        if (trenSelectatId == null || trenSelectatId.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Număr tren invalid.");
            return;
        }

        BiletModel bilet = biletDAO.getBiletByNumarTren(trenSelectatId);

        if (bilet == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("Trenul cu numărul specificat nu a fost găsit.");
            return;
        }

        String jsonResponse = "{"
                + "\"nume_calator\": \"" + bilet.getNumeCalator() + "\","
                + "\"numar_tren\": \"" + bilet.getNumarTren() + "\","
                + "\"statie_plecare\": \"" + bilet.getStatiePlecare() + "\","
                + "\"statie_sosire\": \"" + bilet.getStatieSosire() + "\","
                + "\"data\": \"" + bilet.getData() + "\","
                + "\"ora\": \"" + bilet.getOra() + "\","
                + "\"loc\": \"" + bilet.getLoc() + "\","
                + "\"clasa\": \"" + bilet.getClasa() + "\","
                + "\"pret\": " + bilet.getPret()
                + "}";

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse);
    }
}
