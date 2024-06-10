package com.example.proiectisi.controller;

import com.example.proiectisi.dao.BiletDAO;
import com.example.proiectisi.model.BiletModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "vizualizareBilete", value = "/vizualizareBilete")
public class VizualizareBileteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BiletDAO biletDAO = null;
        try {
            biletDAO = new BiletDAO();
            List<BiletModel> bilete = biletDAO.getAllBilete();
            request.setAttribute("bilete", bilete);
            System.out.println("Număr de bilete găsite: " + bilete.size());
            RequestDispatcher dispatcher = request.getRequestDispatcher("pagina_bilete.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Eroare la obținerea biletelor: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error_page.jsp");
            dispatcher.forward(request, response);
        }
    }
}
