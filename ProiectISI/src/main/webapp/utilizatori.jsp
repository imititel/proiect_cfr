<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.proiectisi.SqlConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.proiectisi.dao.UtilizatoriDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="head.html"%>

<html>
<head>
    <title>Utilizatori</title>
</head>
<body>
<%
    try {
        UtilizatoriDAO utilizatoriDAO = new UtilizatoriDAO();
        Object userSession = session.getAttribute("user");
        if (userSession == null) {
            response.sendRedirect("index.jsp");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<div id="nav-placeholder"></div>

<script>
    $(function(){
        $("#nav-placeholder").load("assets/nav/manager.html");
    });
    function myFunction() {
        let pw_ele = document.getElementById("pass");
        if (pw_ele.type === "password") {
            pw_ele.type = "text";
        } else {
            pw_ele.type = "password";
        }
    }
</script>

<div id="prod">
    <form id="form" method="post" action="${pageContext.request.contextPath}/utilizatori" onsubmit="return validate('utilizatori')" autocomplete="off">
        <label>Logat cu <%=session.getAttribute("user")%></label>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>

        <div class="input">
            <input name="username" type="text" placeholder="Denumire">
            <input name="password" id="pass" type="password" placeholder="Parola">
            <input type="checkbox" id="check" onmousedown="myFunction()" onmouseup="myFunction()">
        </div>

        <input name="adauga" type="submit" value="Adauga">
    </form>

    <hr>

    <div class="link">
        <!-- Linkuri pentru export Excel și PDF -->
    </div>

    <hr>

    <input type='text' id='searchTable' placeholder='Cautare'>
</div>

<%
    try {
        Connection connection = SqlConnection.getInstance().getConnection();
        String sql = "select * from utilizatori;";
        PreparedStatement stmt = connection.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        if(!rs.next()) {
            System.out.println("No Records in the table");
        } else {
%>
<table id="table">
    <thead>
        <tr>
            <th>Cod utilizator</th>
            <th>Username</th>
            <th>Parola</th>
        </tr>
    </thead>
    <tbody>
    <% do { %>
        <tr>
            <td><%= rs.getInt(1)%></td>
            <td><%= rs.getString(2)%></td>
            <td><%= rs.getString(3)%></td>
            <td class="link">
                <a id="edit" href="${pageContext.request.contextPath}/edit/editUtilizatori.jsp?userid=<%= rs.getString(1)%>">Editeaza</a>
                <a id="delete" href="${pageContext.request.contextPath}/utilizatori?action=delete&userid=<%= rs.getString(1)%>">Sterge</a>
            </td>
        </tr>
    <% } while(rs.next()); %>
    </tbody>
</table>
<% 
        }
    } catch(Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
    }
%>
</body>
</html>
