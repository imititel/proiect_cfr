<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="headMin.html"%>
<!DOCTYPE html>
<html>
<head>
    <title>Autentificare</title>
    <style>
        body {
            background: url('assets/img/main_cfr_background.png') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 35%; /* Reducerea lățimii containerului */
            margin: 50px auto; /* Centrarea containerului */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .login-container img {
            margin-bottom: 20px;
        }

        .login-container h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login-form input[type="text"], .login-form input[type="password"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .login-form input[type="submit"] {
            width: 50%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        .login-form input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Stiluri suplimentare după cum este necesar */
    </style>
</head>
<body>

<div class="login-container">
    <h1>Cumpără bilete de tren online</h1>
    <img src="assets/img/cfr_romania.png" alt="logo cfr" width="200" height="200">

    <!-- Login form starts here -->
     <form class="login-form" id="main" method="post" action="${pageContext.request.contextPath}/login">
        <input name="user" id="user" type="text" placeholder="Introduceți numele de utilizator">
        <input name="parola" id="parola" type="password" placeholder="Introduceți parola">
        <input type="submit" name="submit" value="Autentificare">
    </form>
    <!-- Login form ends here -->

    <input name="remember" id="remember" type="checkbox" value="Tine minte username-ul">
    <label for="remember">Ține minte numele de utilizator</label>
</div>
<%--<a href="hello-servlet">Hello Servlet</a>--%>

</body>
</html>
