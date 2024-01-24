package com.example.proiectisi.controller;

import com.example.proiectisi.dao.TrenDAO;
import com.example.proiectisi.model.TrenModel;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class CautaTrenuriServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String deLa = request.getParameter("deLa");
	        String panaLa = request.getParameter("panaLa");
	        String data = request.getParameter("data");

	        TrenDAO trenDAO = new TrenDAO();
	        try {
	            List<TrenModel> trenuri = trenDAO.cautaTrenuri(deLa, panaLa, data);
	            request.setAttribute("trenuri", trenuri);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("pagina_trenuri.jsp");
	            dispatcher.forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Tratarea excepțiilor
	        }
	    }
}
