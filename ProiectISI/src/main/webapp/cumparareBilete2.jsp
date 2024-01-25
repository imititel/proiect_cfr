<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.example.proiectisi.model.BiletModel,com.example.proiectisi.dao.BiletDAO" %>
<%--  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html>
<head>
    <title>Bilete CFR</title>
    <link rel="stylesheet" type="text/css" href="path/to/your/css/file.css"> <!-- Link to CSS file -->
    <script src="path/to/your/js/file.js"></script> <!-- Link to JavaScript file -->
</head>
<body>

<%-- Formularul de căutare bilet --%>
<div>
    <h2>Cauta bilet</h2>
    <form action="SearchBiletServlet" method="get"> <!-- Presupunem existența unui servlet de căutare -->
        <label for="destinatie">Destinatie:</label>
        <input type="text" id="destinatie" name="destinatie"><br><br>

        <label for="dataPlecare">Data plecare:</label>
        <input type="date" id="dataPlecare" name="dataPlecare"><br><br>

        <input type="submit" value="Cauta">
    </form>
</div>

<%-- Afișarea biletelor disponibile --%>
<div>
    <h2>Bilete disponibile</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Destinatie</th>
            <th>Data plecare</th>
            <th>Pret</th>
            <th>Rezerva</th>
        </tr>
   <%--      <% 
           // BiletDAO biletDAO = new BiletDAO();
            //List<BiletModel> bilete = biletDAO.getAllBilete(); // Presupunem existența acestei metode
            //for(BiletModel bilet : bilete) {
       %>
        <tr>
            <td><%= bilet.getId() %></td>
            <td><%= bilet.getDestinatie() %></td>
            <td><%= bilet.getDataPlecare() %></td>
            <td><%= bilet.getPret() %></td>
            <td><a href="RezervareBiletServlet?id=<%= bilet.getId() %>">Rezerva</a></td> <!-- Presupunem existența unui servlet de rezervare -->
        </tr>
      <% } %>  --%>
    </table>
</div>

</body>
</html>
