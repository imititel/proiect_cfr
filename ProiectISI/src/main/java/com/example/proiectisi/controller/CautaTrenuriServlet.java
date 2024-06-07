package com.example.proiectisi.controller;

import com.example.proiectisi.dao.TrenDAO;

import com.example.proiectisi.model.TrenModel;
import com.example.proiectisi.model.CriteriiCautareTrenModel;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "cautaTrenuri", value = "/cautaTrenuri")
public class CautaTrenuriServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
        CriteriiCautareTrenModel criterii = new CriteriiCautareTrenModel();
        criterii.setDeLa(request.getParameter("from"));
        criterii.setPanaLa(request.getParameter("to"));
        criterii.setData(request.getParameter("departure"));

        System.out.println("from: " + criterii.getDeLa());
        System.out.println("to: " + criterii.getPanaLa());
        System.out.println("departure: " + criterii.getData());

        if (criterii.getData() == null || criterii.getData().trim().isEmpty()) {
            System.err.println("Data călătoriei nu a fost furnizată.");
            return; 
        }

        TrenDAO trenDAO = null;
		try {
			trenDAO = new TrenDAO();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
            List<TrenModel> trenuri = trenDAO.cautaTrenuri(criterii.getDeLa(), criterii.getPanaLa(), criterii.getData());

            System.out.println("Număr de trenuri găsite: " + trenuri.size());

            request.setAttribute("trenuri", trenuri);
            RequestDispatcher dispatcher = request.getRequestDispatcher("pagina_trenuri.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Eroare la căutarea trenurilor: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error_page.jsp");
            dispatcher.forward(request, response);
        }
    }
}
