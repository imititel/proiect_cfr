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
    <title>Clienti</title>
     <style>
        .hiddenRow {
            display: none;
        }
    </style>
</head>
<body>
<%
    int codLog = -1;
    try {
        UtilizatoriDAO utilizatoriDAO = new UtilizatoriDAO();
        Object userSession = session.getAttribute("user");
        if (userSession != null) {
            codLog = utilizatoriDAO.getCodf(userSession);
            if (!utilizatoriDAO.isAllowed(codLog, new int[]{4, 6, 7}))
                response.sendRedirect("index.jsp");
        } else
            response.sendRedirect("index.jsp");
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<div id="nav-placeholder">

</div>

<script>
    const cod = <%=codLog %>;
    if (cod === 4)
        $("#nav-placeholder").load("assets/nav/manager.html");
    else if (cod === 6 || cod === 7)
        $("#nav-placeholder").load("assets/nav/consilier.html");
</script>

<div id="prod">
    <form id="form" method="post" action="${pageContext.request.contextPath}/clienti" onsubmit="return validate('clienti')" autocomplete="off">
        <label>Logat cu <%=session.getAttribute("user")%></label>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>

        <div class="input">
            <input name="numec" type="text" placeholder="Nume">
            <label id="numec1" class="dnone">✓</label>
            <label id="numec0" class="dnone">✖</label>
        </div>

        <div class="input">
            <input name="prenumec" type="text" placeholder="Prenume">
            <label id="prenumec1" class="dnone">✓</label>
            <label id="prenumec0" class="dnone">✖</label>
        </div>

        <div class="input">
            <input name="cnp" type="text" placeholder="CNP">
            <label id="cnp1" class="dnone">✓</label>
            <label id="cnp0" class="dnone">✖</label>
        </div>

        <div class="input">
            <input name="adresac" type="text" placeholder="Adresa">
            <label id="adresac1" class="dnone">✓</label>
            <label id="adresac0" class="dnone">✖</label>
        </div>

        <div class="input">
            <input name="telefonc" type="text" placeholder="Nr. de telefon">
            <label id="telefonc1" class="dnone">✓</label>
            <label id="telefonc0" class="dnone">✖</label>
        </div>

        <div class="input">
            <input name="emailc" type="text" placeholder="Email">
            <label id="emailc1" class="dnone">✓</label>
            <label id="emailc0" class="dnone">✖</label>
        </div>

        <div class="input">
            <input name="localitate" type="text" placeholder="Localitate">
            <label id="localitate1" class="dnone">✓</label>
            <label id="localitate0" class="dnone">✖</label>
        </div>

        <div class="input">
            <input name="judet" type="text" placeholder="Judet">
            <label id="judet1" class="dnone">✓</label>
            <label id="judet0" class="dnone">✖</label>
        </div>

        <div class="input">
            <input name="tara" type="text" placeholder="Tara">
            <label id="tara1" class="dnone">✓</label>
            <label id="tara0" class="dnone">✖</label>
        </div>

        <% if (codLog != 6) {%>
        <hr>
            <div class="link">
                <a class="edit" onclick="exportToExcel('table', 'Clienti')"><img src="${pageContext.request.contextPath}/assets/img/excel.png" alt="Export Excel" title="Export Excel"></a>
                <a class="edit" onclick="exportToPDF('#table', 'Clienti')"><img src="${pageContext.request.contextPath}/assets/img/pdf.png" alt="Export PDF" title="Export PDF"></a>
            </div>
        <% } %>
        <hr>
        <input name="adauga" type="submit" value="Adauga">
    </form>
    <input type='text' id='searchTable' placeholder='Cautare'>
</div>

<% try {
    Connection connection = SqlConnection.getInstance().getConnection();
    String sql = "select * from client;";
    PreparedStatement stmt = connection.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery();
    if(!rs.next())
        System.out.println("No Records in the table");
    else {%>

<table id="table">
    <thead>
    <tr>
        <th>Cod client</th>
        <th>Nume</th>
        <th>Prenume</th>
        <th>CNP</th>
        <th>Adresa</th>
        <th>Telefon</th>
        <th>Email</th>
        <th>Localitate</th>
        <th>Judet</th>
        <th>Tara</th>
    </tr>
    </thead>
    <tbody>
    <% do {%>

    <tr>
        <td><%= rs.getInt(1)%></td>
        <td><%= rs.getString(2)%></td>
        <td><%= rs.getString(3)%></td>
        <td><%= rs.getLong(4)%></td>
        <td><%= rs.getString(5)%></td>
        <td><%= rs.getString(6)%></td>
        <td><%= rs.getString(7)%></td>
        <td><%= rs.getString(8)%></td>
        <td><%= rs.getString(9)%></td>
        <td><%= rs.getString(10)%></td>

        <% if (codLog != 7) {%>
            <td class="link">
                <a id="edit" href="${pageContext.request.contextPath}/edit/editClienti.jsp?codc=<%= rs.getString(1)%>">Editeaza</a>
				<a id="delete" href="${pageContext.request.contextPath}/clienti?action=delete&vin=<%= rs.getString(1)%>">Sterge</a>
            </td>
        <% } %>
    </tr>

    <%} while(rs.next());
    }
    }
    catch(Exception e) {
        System.out.println(e.getMessage());
        e.getStackTrace();
    } %>
    <tr class='notFound hiddenRow'>
    <td colspan='10'>Nu s-au gasit inregistrari!</td>
	</tr>
    </tbody>
</table>

</body>
</html>
