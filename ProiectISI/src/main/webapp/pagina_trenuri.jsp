<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.proiectisi.model.TrenModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
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
        .selected {
         	background-color: #a0d2eb;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Rezultate Căutare Trenuri</h1>

    <table>
        <thead>
            <tr>
                <th>Număr Tren</th>
                <th>Nume Tren</th>
                <th>Ora de Plecare</th>
                <th>Durata Călătoriei</th>
                <th>Loc</th>
                <th>Clasă</th>
                <th>Preț</th>
                <th>Selectează</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tren" items="${trenuri}">
                <tr>
                    <td>${tren.getNumarTren()}</td>
                    <td>${tren.getNume()}</td>
                    <td>${tren.getOraPlecare()}</td>
                    <td>${tren.getDurata()}</td>
                    <td>${tren.getLoc()}</td>
                    <td>${tren.getClasa()}</td>
                    <td>${tren.getPret()}</td>
					<td><input type="checkbox" name="selectTren" value="${tren.getNumarTren()}" onclick="selectTren(this.value, this.checked)"></td>
                </tr>
            </c:forEach>
            <c:if test="${empty trenuri}">
                <tr>
                    <td colspan="8">Nu există trenuri disponibile pentru criteriile selectate.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <button type="button" onclick="exportaSiPrinteaza()">Exportă și Printează</button>
</div>

<script>
var trenSelectatId = null;

function selectTren(idTren, isChecked) {
    if (isChecked) {
        trenSelectatId = idTren;
    } else {
        trenSelectatId = null;
    }
}

function exportaSiPrinteaza() {
    console.log("xxxxxxxxxxxxxxx");
    if (trenSelectatId) {
        var locul = "";
        var clasa = ""; 
        var pret = "";

        // Exemplu de conexiune la baza de date și interogare
        var xhr = new XMLHttpRequest();
        console.log("yyyyyyyyyyy");
        xhr.open('GET', 'obtine_date_tren?id=' + trenSelectatId, false);
        xhr.send();

        if (xhr.status === 200) {
             console.log("yyyyyyyyyyy");
            var response = JSON.parse(xhr.responseText);
            locul = response.loc;
            clasa = response.clasa;
            pret = response.pret;
            console.log(xhr.status)
            console.log(xhr.responseText)
            console.log(locul)
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            // Restul codului pentru generarea PDF-ului folosind valorile obținute din baza de date

            // Adaugă titlul
            doc.setFontSize(16);
            doc.text('Bilet Tren', 105, 20, null, null, 'center');

            // Adaugă detaliile trenului
            doc.setFontSize(12);
            doc.text('Număr Tren: ' + trenSelectatId, 20, 30);

            // Adaugă detalii personalizate din baza de date
            doc.text('Loc: ' + locul, 20, 70);
            doc.text('Clasă: ' + clasa, 20, 80);
            doc.text('Preț: ' + pret + ' Lei', 20, 90);

            // Salvează PDF-ul
            doc.save('bilet_tren.pdf');
        } else {
            alert('Nu s-au putut obține informațiile din baza de date.');
        }
    } else {
        alert('Vă rugăm să selectați un tren mai întâi.');
    }
}


</script>

</body>
</html>
