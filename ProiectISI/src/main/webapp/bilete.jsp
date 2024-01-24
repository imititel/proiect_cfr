<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.proiectisi.SqlConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.proiectisi.dao.UtilizatoriDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Vânzare Bilete</title>
    <!-- Includere CSS și JS aici dacă este necesar -->
</head>
<body>
    <h1>Vânzare Bilete</h1>
    <form action="procesareBilet" method="post">
        <label for="destinatie">Destinație:</label>
        <input type="text" id="destinatie" name="destinatie"><br><br>
        
        <label for="dataPlecare">Data Plecare:</label>
        <input type="date" id="dataPlecare" name="dataPlecare"><br><br>

        <label for="clasa">Clasa:</label>
        <select id="clasa" name="clasa">
            <option value="economie">Economie</option>
            <option value="business">Business</option>
            <option value="primaClasa">Prima Clasă</option>
        </select><br><br>

        <input type="submit" value="Emitere Bilet">
    </form>
</body>
</html>