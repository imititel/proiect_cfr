package com.example.proiectisi.controller;

import com.example.proiectisi.dao.LogsDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "logout", value = "/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // Adaugă această linie
    LogsDAO logsDAO = new LogsDAO();

    public LogoutServlet() throws SQLException, ClassNotFoundException {
        // Constructorul poate fi folosit pentru inițializări suplimentare, dacă este necesar.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        // Înregistrează logout-ul în baza de date
        try {
            logsDAO.logsConnect(session.getAttribute("user"), false, session.getId());
        } catch (SQLException e) {
            // În cazul unei excepții SQL, logați eroarea
            e.printStackTrace();
        }

        // Invalidează sesiunea curentă
        session.invalidate();

        // Redirecționează utilizatorul către pagina de login
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        // Metoda POST nu este implementată în acest servlet
    }
}
