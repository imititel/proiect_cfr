package com.example.proiectisi.controller;

import com.example.proiectisi.dao.GetVanzareDAO;
import com.example.proiectisi.model.BiletModel;
import com.example.proiectisi.dao.BiletDAO;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;
import java.util.ArrayList;


@WebServlet(name = "getvanzare", value = "/getvanzare")
public class GetVanzareServlet extends HttpServlet {
    Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            GetVanzareDAO getVanzareDAO = new GetVanzareDAO();

            String type = request.getParameter("type");
 
            if (type != null && type.equals("Bilete")) {
                List<BiletModel> list = getVanzareDAO.getAllBilete(); // Presupunem existența acestei metode
                String bileteList = gson.toJson(list);
                response.setContentType("application/json");
                response.getWriter().write(bileteList);
                return;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implementarea pentru doPost dacă este necesar
    }
}