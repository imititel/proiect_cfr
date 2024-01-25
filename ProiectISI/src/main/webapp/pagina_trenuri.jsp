<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.proiectisi.model.TrenModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rezultate Căutare Trenuri</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('assets/img/cfr_background.png') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            margin: 20px auto;
            padding: 20px;
            width: 80%;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Rezultate Căutare Trenuri</h1>

    <table>
        <thead>
            <tr>
                <th>Nume Tren</th>
                <th>Ora de Plecare</th>
                <th>Durata Călătoriei</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tren" items="${trenuri}">
                <tr>
                    <td>${tren.getNume()}</td>
                    <td>${tren.getOraPlecare()}</td>
                    <td>${tren.getDurata()}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty trenuri}">
                <tr>
                    <td colspan="3">Nu există trenuri disponibile pentru criteriile selectate.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

</body>
</html>
