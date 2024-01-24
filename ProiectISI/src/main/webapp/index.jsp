<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="headMin.html"%>
<!DOCTYPE html>
<html>
<head>
    <title>Log In</title>
</head>
<body>
<form id="main" method="post" action="${pageContext.request.contextPath}/login">
    <h1 id="title">Log in</h1>
    <div class = "login">
        <img src="assets/img/tesla_logo.png" alt="tesla logo" width="200" height="200">
        <input name="user" id="user" type="text" placeholder="Introduceti username-ul">
        <input name="parola" id="parola" type="password" placeholder="Introduceti parola">

        <input class="submit" type="submit" name="submit" value="Log In">
    </div>

    <input name="remember" id="remember" type="checkbox" value="Tine minte username-ul">
    <label for="remember">Tine minte username-ul</label>
</form>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
</body>
</html>