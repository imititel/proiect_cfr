<!-- pagina_bilete.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.proiectisi.model.BiletModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Bilete Vândute</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
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
        .header {
            background-color: #50b3a2;
            color: white;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Bilete Vândute</h1>
</div>
<div class="container">
    <table>
        <tr>
            <th>ID Bilet</th>
            <th>Nume Călător</th>
            <th>Număr Tren</th>
            <th>Stație Plecare</th>
            <th>Stație Sosire</th>
            <th>Data</th>
            <th>Ora</th>
            <th>Loc</th>
            <th>Clasă</th>
            <th>Preț</th>
        </tr>
        <%
            List<BiletModel> bilete = (List<BiletModel>) request.getAttribute("bilete");
            if (bilete != null && !bilete.isEmpty()) {
                for (BiletModel bilet : bilete) {
        %>
        <tr>
            <td><%= bilet.getBiletId() %></td>
            <td><%= bilet.getNumeCalator() %></td>
            <td><%= bilet.getNumarTren() %></td>
            <td><%= bilet.getStatiePlecare() %></td>
            <td><%= bilet.getStatieSosire() %></td>
            <td><fmt:formatDate value="<%= bilet.getData() %>" pattern="yyyy-MM-dd" /></td>
            <td><%= bilet.getOra() %></td>
            <td><%= bilet.getLoc() %></td>
            <td><%= bilet.getClasa() %></td>
            <td><%= bilet.getPret() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="10">Nu există bilete vândute.</td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
