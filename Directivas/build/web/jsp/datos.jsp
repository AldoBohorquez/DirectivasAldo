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
                margin-top: 60px;
                max-width: 600px;
            }
            h3 {
                color: #343a40;
                font-weight: bold;
                text-align: center;
                margin-bottom: 20px;
            }
            .form-group label {
                font-weight: bold;
                color: #343a40;
            }
            .btn-primary {
                background-color: #007bff;
                font-weight: bold;
                width: 100%;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
        </style>
        <title>Datos de Pel�cula</title>
    </head>
    <body>
        <div class="container shadow p-4 rounded bg-white">
            <h3>Registrar Nueva Pel�cula</h3>
            <form role="form" name="pelicula" action="procesarC.jsp" method="POST" onsubmit="return validarFormulario()">
                <div class="form-group">
                    <label for="nombre">Nombre de la Pel�cula:</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre" required>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripci�n:</label>
                    <textarea class="form-control" name="descripcion" id="descripcion" placeholder="Descripci�n" required></textarea>
                </div>
                <div class="form-group">
                    <label for="precio">Precio:</label>
                    <input type="number" class="form-control" name="precio" id="precio" placeholder="Precio" min="1" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="fechaEstreno">Fecha de Estreno:</label>
                    <input type="date" class="form-control" name="fechaEstreno" id="fechaEstreno" required>
                </div>
                <div class="form-group">
                    <label for="duracion">Duraci�n en Minutos:</label>
                    <input type="number" class="form-control" name="duracion" id="duracion" placeholder="Duraci�n en minutos" min="1" required>
                </div>
                <input type="submit" class="btn btn-primary" value="Registrar Pel�cula">
            </form>
        </div>

        <script>
            function validarFormulario() {
                const nombre = document.getElementById('nombre').value.trim();
                const descripcion = document.getElementById('descripcion').value.trim();
                const precio = parseFloat(document.getElementById('precio').value);
                const fechaEstreno = document.getElementById('fechaEstreno').value;
                const duracion = parseInt(document.getElementById('duracion').value);

                // Validar nombre de la pel�cula
                if (nombre.length < 2) {
                    alert('El nombre de la pel�cula debe tener al menos 2 caracteres.');
                    return false;
                }

                // Validar descripci�n
                if (descripcion.length < 6) {
                    alert('La descripci�n debe tener al menos 10 caracteres.');
                    return false;
                }

                // Validar precio
                if (isNaN(precio) || precio <= 0) {
                    alert('El precio debe ser un n�mero positivo.');
                    return false;
                }

                // Validar fecha de estreno
                const fechaActual = new Date().toISOString().split('T')[0];
                if (fechaEstreno > fechaActual) {
                    alert('La fecha de estreno no puede ser en el futuro.');
                    return false;
                }

                // Validar duraci�n
                if (isNaN(duracion) || duracion <= 0) {
                    alert('La duraci�n debe ser un n�mero positivo.');
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
