<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
            }
            .navbar {
                background-color: #343a40;
            }
            .navbar-brand {
                color: #ffffff;
                font-weight: bold;
            }
            .navbar-nav .nav-link {
                color: #ffffff;
                font-weight: 600;
                padding: 8px 16px;
            }
            .navbar-nav .nav-link:hover {
                color: #ffc107;
            }
        </style>
        <title>Página de Inicio</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="#">Sistema de Películas</a>
            <div class="navbar-nav ml-auto">
                <a href="${pageContext.request.contextPath}/jsp/datos.jsp" class="nav-item nav-link">Datos</a>
                <a href="${pageContext.request.contextPath}/jsp/procesarC.jsp" class="nav-item nav-link">Tabla</a>
            </div>
        </nav>
    </body>
</html>
