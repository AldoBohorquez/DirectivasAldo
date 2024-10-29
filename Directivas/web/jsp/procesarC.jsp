<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>

<%
    ArrayList<HashMap<String, String>> peliculas = (ArrayList<HashMap<String, String>>) session.getAttribute("peliculas");
    if (peliculas == null) {
        peliculas = new ArrayList<>();
        session.setAttribute("peliculas", peliculas);
    }
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String precio = request.getParameter("precio");
    String fechaEstreno = request.getParameter("fechaEstreno");
    String duracion = request.getParameter("duracion");

    if (nombre != null && descripcion != null && precio != null && fechaEstreno != null && duracion != null) {
        HashMap<String, String> pelicula = new HashMap<>();
        pelicula.put("id", String.valueOf(peliculas.size() + 1));
        pelicula.put("nombre", nombre);
        pelicula.put("descripcion", descripcion);
        pelicula.put("precio", precio);
        pelicula.put("fechaEstreno", fechaEstreno);
        pelicula.put("duracion", duracion);
        peliculas.add(pelicula);
        session.setAttribute("peliculas", peliculas);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }
            .container {
                margin-top: 40px;
            }
            h3 {
                text-align: center;
                font-weight: bold;
                color: #343a40;
            }
            .table {
                margin-top: 20px;
            }
            .table thead {
                background-color: #343a40;
                color: white;
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: #f2f2f2;
            }
        </style>
        <title>Lista de Películas</title>
    </head>
    <body>
        <div class="container">
            <h3>Lista de Películas</h3>
            <table class="table table-striped table-bordered shadow-sm">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Fecha de Estreno</th>
                        <th>Duración (min)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pelicula" items="${sessionScope.peliculas}">
                        <tr>
                            <td>${pelicula.id}</td>
                            <td>${pelicula.nombre}</td>
                            <td>${pelicula.descripcion}</td>
                            <td>${pelicula.precio}</td>
                            <td>${pelicula.fechaEstreno}</td>
                            <td>${pelicula.duracion}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty sessionScope.peliculas}">
                        <tr>
                            <td colspan="6" class="text-center">No se han agregado películas todavía.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </body>
</html>