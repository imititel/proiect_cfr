<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.proiectisi.dao.UtilizatoriDAO" %>
<%@ page import="com.example.proiectisi.model.UtilizatoriModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="head.html"%>

<html>
<head>
    <title>Management Utilizatori</title>
    <!-- Adaugă aici orice CSS sau JS necesar -->
</head>
<body>

<h2>Lista Utilizatori</h2>
<%
    UtilizatoriDAO dao = new UtilizatoriDAO();
	List<UtilizatoriModel> listaUtilizatori = dao.getAllUtilizatori();
%>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Acțiuni</th>
    </tr>
    <%
        for (UtilizatoriModel utilizator : listaUtilizatori) {
    %>
    <tr>
        <td><%= utilizator.getId() %></td>
        <td><%= utilizator.getUsername() %></td>
        <td>
            <a href="editUtilizator.jsp?id=<%= utilizator.getId() %>">Edit</a> |
            <a href="deleteUtilizator?id=<%= utilizator.getId() %>" onclick="return confirm('Ești sigur?');">Șterge</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

<h2>Adaugă Utilizator Nou</h2>
<form action="addUtilizator" method="post">
    Username: <input type="text" name="username" required><br>
    Parola: <input type="password" name="password" required><br>
    <input type="submit" value="Adaugă">
</form>

</body>
</html>
