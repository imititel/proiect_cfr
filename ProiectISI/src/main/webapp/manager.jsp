<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.proiectisi.dao.UtilizatoriDAO" %>
<%@ page import="com.example.proiectisi.model.UtilizatoriModel" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.util.logging.Level" %>
<%@ include file="head.html" %>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Management Utilizatori</title>
    <style>
        body {
            background-image: url('assets/img/fundal_manager.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .form-container {
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Lista Utilizatori</h2>
    <%
        Logger logger = Logger.getLogger("ManagerLog");
        UtilizatoriDAO dao = new UtilizatoriDAO();
        List<UtilizatoriModel> listaUtilizatori = dao.getAllUtilizatori();
    %>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Tip Utilizator</th>
            <th>Acțiuni</th>
        </tr>
        <%
            for (UtilizatoriModel utilizator : listaUtilizatori) {
        %>
        <tr>
            <td><%= utilizator.getId() %></td>
            <td><%= utilizator.getUsername() %></td>
            <td><%= utilizator.getUserType() %></td>
            <td>
                <!-- Formular pentru Editare -->
                <form action="manager.jsp" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id" value="<%= utilizator.getId() %>">
                    Username: <input type="text" name="newUsername" value="<%= utilizator.getUsername() %>" required>
                    Parola: <input type="password" name="newPassword" required>
                    <input type="submit" value="Edit">
                </form>
                |
                <!-- Formular pentru Ștergere -->
                <form action="manager.jsp" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= utilizator.getId() %>">
                    <input type="submit" value="Șterge" onclick="return confirm('Ești sigur?');">
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <div style="text-align: center; margin-top: 20px;">
        <a href="vizualizareBilete" class="btn">Vizualizează Bilete Vândute</a>
    </div>
</div>

<div class="container form-container">
    <h2>Adaugă Utilizator Nou</h2>
    <form action="manager.jsp" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Parola:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="codf">Cod Funcție CFR:</label>
            <input type="text" id="codf" name="codf" required>
            <small class="form-text">
                Coduri: 1 - Manager CFR, 2 - Casier CFR, 3 - Client
            </small>
        </div>
        <div class="form-group">
            <input type="submit" value="Adaugă">
        </div>
    </form>
</div>

<%
String action = request.getParameter("action");
String username = request.getParameter("username");
String password = request.getParameter("password");
String codf = request.getParameter("codf");
Object user = null;

if (username != null && password != null && codf != null) {
    UtilizatoriModel newUser = new UtilizatoriModel();
    newUser.setUsername(username);
    newUser.setPassword(password);
    newUser.setCodf(codf);

    boolean usernameTaken = dao.isUsernameTaken(username);

    if (usernameTaken) {
        response.sendRedirect("user_already_taken.jsp?message=Username already taken");
        logger.warning("Username already taken.");
    } else {
        boolean insertSuccessful = dao.insert(newUser, user);

        if (insertSuccessful) {
            response.sendRedirect("manager.jsp");
            logger.info("New user added successfully.");
        } else {
            logger.warning("Error adding new user.");
        }
    }
} else if (action != null) {
    if (action.equals("edit")) {
        String id = request.getParameter("id");
        String newUsername = request.getParameter("newUsername");
        String newPassword = request.getParameter("newPassword");
        UtilizatoriModel updatedUser = new UtilizatoriModel();
        updatedUser.setUsername(newUsername);
        updatedUser.setPassword(newPassword);

        boolean updateSuccessful = dao.update(updatedUser, id, user);

        if (updateSuccessful) {
            response.sendRedirect("manager.jsp");
            logger.info("User updated successfully.");
        } else {
            logger.warning("Error updating user.");
        }
    } else if (action.equals("delete")) {
        String id = request.getParameter("id");

        dao.delete(id, user);

        logger.info("User deleted successfully.");
        response.sendRedirect("manager.jsp");
    }
}
%>

<div class="container form-container">
    <h2>Filtrare</h2>
    <form action="utilizatori" method="get">
        <input type="hidden" name="action" value="filter">
        <label for="tren">Tren:</label>
        <input type="text" id="tren" name="tren">

        <label for="utilizator">Utilizator:</label>
        <input type="text" id="utilizator" name="utilizator">

        <label for="dataInceput">Data Inceput:</label>
        <input type="date" id="dataInceput" name="dataInceput">

        <label for="dataSfarsit">Data Sfarsit:</label>
        <input type="date" id="dataSfarsit" name="dataSfarsit">

        <button type="submit">Filtreaza</button>
    </form>

     <!-- Display Filter Results -->
    <h2>Rezultate Filtrare</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID Tren</th>
                <th>Nume Tren</th>
                <th>ID Utilizator</th>
                <th>Nume Utilizator</th>
                <th>Data</th>
                <th>Actiune</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="log" items="${logs}">
                <tr>
                    <td>${log.trenId}</td>
                    <td>${log.trenName}</td>
                    <td>${log.userId}</td>
                    <td>${log.userName}</td>
                    <td><fmt:formatDate value="${log.date}" pattern="yyyy-MM-dd" /></td>
                    <td>${log.action}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<div class="container form-container">
    <h2>Generare Rapoarte</h2>
    <form action="utilizatori" method="get">
        <input type="hidden" name="action" value="report">
        <label for="reportDataInceput">Data Inceput:</label>
        <input type="date" id="reportDataInceput" name="reportDataInceput">

        <label for="reportDataSfarsit">Data Sfarsit:</label>
        <input type="date" id="reportDataSfarsit" name="reportDataSfarsit">

        <button type="submit">Genereaza Raport</button>
    </form>

    <h2>Rezultate Raport</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID Tren</th>
                <th>Nume Tren</th>
                <th>ID Utilizator</th>
                <th>Nume Utilizator</th>
                <th>Numar Bilete</th>
                <th>Total Vanzari</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="report" items="${reports}">
                <tr>
                    <td>${report.trenId}</td>
                    <td>${report.trenName}</td>
                    <td>${report.userId}</td>
                    <td>${report.userName}</td>
                    <td>${report.ticketCount}</td>
                    <td>${report.totalSales}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
