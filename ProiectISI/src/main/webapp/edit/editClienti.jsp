<%@ page import="com.example.proiectisi.model.ClientiModel" %>
<%@ page import="com.example.proiectisi.dao.ClientiDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../headMin.html"%>
<html>
<head>
    <title>Editare Client</title>
</head>
<body>
<%
    ClientiDAO clientiDAO = new ClientiDAO();
    String codc = request.getParameter("codc");
    ClientiModel client = null;

    try {
        String userSession = (String) session.getAttribute("user");
        if (userSession != null && codc != null) {
            int codLog = clientiDAO.getCodf(userSession);
            if (clientiDAO.isAllowed(codLog, new int[]{4, 6, 7})) {
                client = clientiDAO.getClientById(codc);
            } else {
                response.sendRedirect("index.jsp");
                return;
            }
        } else {
            response.sendRedirect("index.jsp");
            return;
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
        return;
    }
%>

<form id="prod" method="post" action="${pageContext.request.contextPath}/clienti" autocomplete="off">
    <p>Cod client: <%= codc %></p>
    <input name="codc" type="hidden" value="<%= codc %>">
    <input name="numec" type="text" placeholder="Nume" value="<%= client.getNumec() %>">
    <input name="prenumec" type="text" placeholder="Prenume" value="<%= client.getPrenumec() %>">
    <!-- Continuă cu restul câmpurilor folosind modelul ClientiModel -->

    <input name="action" value="edit" type="hidden">
    <input name="act" type="submit" value="Actualizeaza">
</form>
</body>
</html>
