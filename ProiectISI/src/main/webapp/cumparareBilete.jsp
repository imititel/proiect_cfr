<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.example.proiectisi.model.BiletModel,com.example.proiectisi.dao.BiletDAO" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Bilete CFR</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        header {
            background: #50b3a2;
            color: white;
            padding-top: 30px;
            min-height: 70px;
            border-bottom: #e8491d 3px solid;
        }
        header a {
            color: #ffffff;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 16px;
        }
        header ul {
            padding: 0;
            margin: 0;
            list-style: none;
            overflow: hidden;
        }
        header li {
            float: left;
            display: inline;
        }
        header nav {
            float: right;
            margin-top: 10px;
        }
        header .highlight, header .current a {
            color: #e8491d;
            font-weight: bold;
        }
        header a:hover {
            color: #ffffff;
            font-weight: bold;
        }
        .cta {
            float: right;
            margin-top: 10px;
        }
        .cta a {
            padding: 4px 8px;
            background: #e8491d;
            color: #ffffff;
            border-radius: 5px;
            text-transform: uppercase;
            font-weight: bold;
            text-decoration: none;
        }
        .search-form {
            background: #ffffff;
            padding: 15px;
            box-shadow: 0px 0px 10px 0px #000000;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .search-form h2 {
            margin: 0 0 15px 0;
        }
        .search-form label {
            display: block;
            margin-bottom: 5px;
        }
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: -50px;
        }
        
        .header-image {
            width: 100%;
            height: 300px;
       		background: url('assets/img/cropped-cfr.png');
            background-size: cover;
            margin-bottom: 20px;
        }

        .search-form {
            width: 90%;
            max-width: 600px;
            padding: 20px;
            background: #fff;
            box-shadow: 0px 0px 10px 0px #000000;
            margin-top: 20px;
        }

        .search-form label, .search-form input, .search-form button {
            width: 100%;
            margin-bottom: 10px;
        }

        .search-form button[type="submit"] {
            background-color: #50b3a2;
            color: white;
            cursor: pointer;
            padding: 10px 0;
            border: none;
            border-radius: 5px;
        }

        .cookie-warning {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            text-align: center;
            padding: 10px;
            z-index: 1000;
        }

        .cookie-warning button {
            background-color: #e8491d;
            border: none;
            color: white;
            padding: 5px 10px;
            margin-left: 10px;
            cursor: pointer;
        }
    </style>
    <script>
        function hideCookieWarning() {
            document.getElementById('cookie-warning').style.display = 'none';
        }

        function swapValues() {
            var from = document.getElementById('from').value;
            var to = document.getElementById('to').value;
            document.getElementById('from').value = to;
            document.getElementById('to').value = from;
        }
    </script>
</head>
<body>

<div class="header-image"></div>

<div class="container">
    <header>
        <!-- Restul header-ului... -->
    </header>

    <h2>Mers tren trafic intern</h2>

    <div class="search-form">
        <form action="cautareBilete" method="get">
            <label for="from">De la:</label>
            <input type="text" id="from" name="from"><br>

            <label for="to">Până la:</label>
            <input type="text" id="to" name="to"><br>

            <button type="button" onclick="swapValues()">Inversează</button><br><br>

            <label for="dataPlecare">Data plecare:</label>
            <input type="date" id="dataPlecare" name="dataPlecare" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"><br><br>

            <input type="submit" value="Caută">
        </form>
    </div>
</div>

<div class="cookie-warning" id="cookie-warning">
    Acest site folosește cookies. <button onclick="hideCookieWarning()">Am înțeles</button>
</div>

</body>
</html>
