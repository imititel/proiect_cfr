<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.proiectisi.dao.UtilizatoriDAO" %>
<%@ page import="com.example.proiectisi.model.UtilizatoriModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.util.logging.Level" %>
<%@ include file="head.html" %>

<html>
<head>

	<% 
	Logger logger = Logger.getLogger("ManagerLog");
	%>
    <title>Management Utilizatori</title>
    <style>
        body {
            background-image: url('assets/img/fundal_manager.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }
        h2 {
            text-align: center;
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
        .form-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Lista Utilizatori</h2>
    <%
        UtilizatoriDAO dao = new UtilizatoriDAO();
    	List<UtilizatoriModel> listaUtilizatori = dao.getAllUtilizatori();
    	%>
    	<table border="1">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Tip Utilizator</th>
            <th>Acțiuni</th>
        </tr>
        <%
            for (UtilizatoriModel utilizator : listaUtilizatori) {
        %>
        <tr>
            <td><%= utilizator.getId() %></td>
            <td><%= utilizator.getUsername() %></td>
            <td><%= utilizator.getUserType() %></td>
            <td>
                <!-- Formular pentru Editare -->
                <form action="manager.jsp" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id" value="<%= utilizator.getId() %>">
                    Username: <input type="text" name="newUsername" value="<%= utilizator.getUsername() %>" required>
                    Parola: <input type="password" name="newPassword" required>
                    <input type="submit" value="Edit">
                </form>
                |
                <!-- Formular pentru Ștergere -->
                <form action="manager.jsp" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= utilizator.getId() %>">
                    <input type="submit" value="Șterge" onclick="return confirm('Ești sigur?');">
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>

<head>
    <title>Adauga Utilizator CFR</title>
    <style>
    /* CSS Styles */
    .container {
        /* existing styles... */
    }

    .form-container {
        background-color: #f8f8f8;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        width: 50%; /* Adjust the width of the form container */
        margin: auto; /* Center the container */
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    .form-group input[type="text"],
    .form-group input[type="password"] {
        width: 100%; /* Full width of the form-group */
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 0.9em; /* Adjust font size if needed */
    }

    .form-group .form-text {
        font-size: 0.8em; /* Slightly smaller font for descriptions */
        color: #666;
    }

    .form-group input[type="submit"] {
        background-color: #007bff;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .form-group input[type="submit"]:hover {
        background-color: #0056b3;
    }
	</style>
</head>
<body>

    <!-- Form HTML -->
    <div class="container form-container">
        <h2>Adaugă Utilizator Nou</h2>
        <form action="manager.jsp" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Parola:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="codf">Cod Funcție CFR:</label>
                <input type="text" id="codf" name="codf" required>
                <small class="form-text">
                    Coduri: 1 - Manager CFR, 2 - Casier CFR, 3 - Client
                </small>
            </div>
            <div class="form-group">
                <input type="submit" value="Adaugă">
            </div>
        </form>
    </div>

</body>

<%
String action = request.getParameter("action");
String username = request.getParameter("username");
String password = request.getParameter("password");
String codf = request.getParameter("codf");
Object user = null;

if (username != null && password != null && codf != null) {
    // Create a new user model
    UtilizatoriModel newUser = new UtilizatoriModel();
    newUser.setUsername(username);
    newUser.setPassword(password);
    newUser.setCodf(codf);

    // Check if the username is already taken
    boolean usernameTaken = dao.isUsernameTaken(username);
    
    if (usernameTaken) {
        // Username is already taken, display an error message
        response.sendRedirect("error.jsp?message=Username already taken");
        logger.warning("<p>Username already taken.</p>");
    } else {
        // Insert the new user
        boolean insertSuccessful = dao.insert(newUser, user);

        if (insertSuccessful) {
            response.sendRedirect("manager.jsp");
            logger.info("<p>New user added successfully.</p>");
        } else {
            logger.warning("<p>Error adding new user.</p>");
        }
    }
} else if (action != null) {
    if (action.equals("edit")) {
        // Obțineți datele din formular și apelați metoda pentru editare din UtilizatoriDAO
        String id = request.getParameter("id");
        String newUsername = request.getParameter("newUsername");
        String newPassword = request.getParameter("newPassword");
        UtilizatoriModel updatedUser = new UtilizatoriModel();
        updatedUser.setUsername(newUsername);
        updatedUser.setPassword(newPassword);

        boolean updateSuccessful = dao.update(updatedUser, id, user);

        if (updateSuccessful) {
        	response.sendRedirect("manager.jsp");
            logger.info("<p>User updated successfully.</p>");
        } else {
            logger.warning("<p>Error updating user.</p>");
        }
    } else if (action.equals("delete")) {
        // Obțineți ID-ul utilizatorului și apelați metoda pentru ștergere din UtilizatoriDAO
        String id = request.getParameter("id");

        // Call the delete method without trying to capture a return value
        dao.delete(id, user);

        // Provide a success message since no return value is available
        logger.info("<p>User deleted successfully.</p>");
        response.sendRedirect("manager.jsp");
    }
}
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout Button</title>
    <style>
        /* Stilurile CSS pentru buton */
        .logout-button {
            background-color: #ff0000; /* Culoarea de fundal */
            color: #ffffff; /* Culoarea textului */
            padding: 10px 20px; /* Spațierea în interiorul butonului */
            border: none; /* Fără bordură */
            border-radius: 5px; /* Colțuri rotunjite */
            cursor: pointer; /* Indicator de cursor la hover */
            position: absolute;
            top: 10px; /* Distanța de la partea de sus a paginii */
            right: 10px; /* Distanța de la partea dreaptă a paginii */
        }

        /* Stilul butonului la hover (când mouse-ul este deasupra butonului) */
        .logout-button:hover {
            background-color: #cc0000; /* Schimbarea culorii de fundal */
        }
    </style>
</head>
<body>
    <button class="logout-button" onclick="logout()">Logout</button>

    <script>
        function logout() {
            // Redirecționează către pagina principală (index.jsp)
            window.location.href = "index.jsp";
        }
    </script>
</body>

</body>
</html>
