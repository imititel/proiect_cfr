<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.proiectisi.model.TrenModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rezultate Căutare Trenuri</title>
    <!-- Stiluri și scripturi aici -->
</head>
<body>

<div class="container">
    <h1>Rezultate Căutare Trenuri</h1>

    <!-- Restul formularului de căutare -->

    <!-- Afisarea rezultatelor -->
    <div id="results">
        <table>
            <tr>
                <th>Nume Tren</th>
                <th>Ora de Plecare</th>
                <th>Durata Călătoriei</th>
            </tr>
            <% 
            Object trenuriObj = request.getAttribute("trenuri");
            if (trenuriObj instanceof List<?>) {
                List<?> listaGenerica = (List<?>) trenuriObj;
                List<TrenModel> trenuri = new ArrayList<>();
                for (Object obj : listaGenerica) {
                    if (obj instanceof TrenModel) {
                        trenuri.add((TrenModel) obj);
                    }
                }
                for(TrenModel tren : trenuri) {
            %>
                    <tr>
                        <td><%= tren.getNume() %></td>
                        <td><%= tren.getOraPlecare() %></td>
                        <td><%= tren.getDurata() %></td>
                    </tr>
            <% 
                }
            } else {
                // Opțional: Gestionarea cazului în care trenuri nu este o listă sau este null
            %>
                <tr>
                    <td colspan="3">Nu s-au găsit rezultate.</td>
                </tr>
            <% 
            }
            %>
        </table>
    </div>
</div>

</body>
</html>
