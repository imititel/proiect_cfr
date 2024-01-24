<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.proiectisi.SqlConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.proiectisi.dao.UtilizatoriDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../headMin.html"%>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<%
    int codLog;
    try {
        UtilizatoriDAO utilizatoriDAO = new UtilizatoriDAO();
        Object userSession = session.getAttribute("user");
        if (userSession != null && request.getParameter("userid") != null) {
            codLog = utilizatoriDAO.getCodf(userSession);
            if (codLog != 4)
                response.sendRedirect("index.jsp");
        } else
            response.sendRedirect("index.jsp");
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<form id="prod" method="post" action="${pageContext.request.contextPath}/utilizatori" autocomplete="off">
    <p>Cod utilizator: ${param.userid}</p>
    <%
        int codf = 0;
        try {
            Connection connection = SqlConnection.getInstance().getConnection();
            String sql = "select * from utilizatori where userid = ?;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, request.getParameter("userid"));
            ResultSet rs = stmt.executeQuery();
            if (!rs.next())
                System.out.println("No Records in the table");
            else {
                codf = rs.getInt(4);
    %>
    <input name="userid" type="hidden" value="${param.userid}">
    <input name="username" type="text" placeholder="Utilizator" value="<%=rs.getString(2)%>">
    <input name="password" id="pass" type="password" placeholder="Parola" value="<%=rs.getString(3)%>">
    <input type="checkbox" id="check" onmousedown="myFunction()" onmouseup="myFunction()">
    <input name="password2" type="password" placeholder="Confirmati">
    <script>
        function myFunction() {
            let pw_ele = document.getElementById("pass");
            if (pw_ele.type === "password") {
                pw_ele.type = "text";
            } else {
                pw_ele.type = "password";
            }
        }
    </script>

    <%}

    } catch (Exception e) {
        System.out.println(e.getMessage());
        e.getStackTrace();
    }
    %>

    <%
        try {
            Connection connection = SqlConnection.getInstance().getConnection();
            String sql = "select codf, denf from functie;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (!rs.next())
                System.out.println("No Records in the table");
            else { %>
    <select id="combo" name="functii">

        <% do {%>
        <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
        <% } while (rs.next());
            }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                e.getStackTrace();
            } %>
    </select>
    <script type='text/javascript'>
        document.getElementById("combo").value = <%=codf%>;
    </script>
    <input name="action" value="edit" type="hidden">
    <input name="act" type="submit" value="Actualizeaza">
</form>
</body>
</html>
