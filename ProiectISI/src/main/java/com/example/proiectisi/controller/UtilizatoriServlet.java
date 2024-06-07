package com.example.proiectisi.controller;

import com.example.proiectisi.dao.UtilizatoriDAO;
import com.example.proiectisi.dao.TrenDAO;
import com.example.proiectisi.dao.LogsDAO;
import com.example.proiectisi.model.LogModel;
import com.example.proiectisi.model.ReportModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "utilizatori", value = "/utilizatori")
public class UtilizatoriServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UtilizatoriDAO utilizatoriDAO;
    private TrenDAO trenDAO;
    private LogsDAO logsDAO;

    public UtilizatoriServlet() throws SQLException, ClassNotFoundException {
        this.trenDAO = new TrenDAO();
        this.logsDAO = new LogsDAO();
    }

    public void init() {
        try {
            utilizatoriDAO = new UtilizatoriDAO();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Action: " + action);
        if ("filter".equals(action)) {
            String tren = request.getParameter("tren");
            String utilizator = request.getParameter("utilizator");
            Date dataInceput = Date.valueOf(request.getParameter("dataInceput"));
            Date dataSfarsit = Date.valueOf(request.getParameter("dataSfarsit"));
            System.out.println("Filter Params: Tren=" + tren + ", Utilizator=" + utilizator + ", DataInceput=" + dataInceput + ", DataSfarsit=" + dataSfarsit);
            List<LogModel> logs = logsDAO.filterLogs(tren, utilizator, dataInceput, dataSfarsit);
            request.setAttribute("logs", logs);
            System.out.println("Logs found: " + logs.size());
        } else if ("report".equals(action)) {
            Date dataInceput = Date.valueOf(request.getParameter("reportDataInceput"));
            Date dataSfarsit = Date.valueOf(request.getParameter("reportDataSfarsit"));
            System.out.println("Report Params: DataInceput=" + dataInceput + ", DataSfarsit=" + dataSfarsit);
            List<ReportModel> reports = trenDAO.generateReports(dataInceput, dataSfarsit);
            request.setAttribute("reports", reports);
            System.out.println("Reports found: " + reports.size());
        }
        request.getRequestDispatcher("manager.jsp").forward(request, response);
    }
}
