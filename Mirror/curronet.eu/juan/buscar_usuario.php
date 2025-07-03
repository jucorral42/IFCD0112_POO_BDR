<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Buscar Usuario</title>
</head>
<body>
    <h2>Buscar Usuario</h2>
    <form method="POST" action="">
        <label for="usuario">Nombre de Usuario:</label>
        <input type="text" id="usuario" name="usuario" required>
        <input type="submit" value="Buscar">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Recoger el nombre de usuario desde el formulario
        $usuario = $_POST['usuario'];

        // Conexión a la base de datos
        $conn = new mysqli("localhost", "usuario_bd", "contraseña_bd", "manuherr_curronet");

        // Verificar conexión
        if ($conn->connect_error) {
            die("Conexión fallida: " . $conn->connect_error);
        }

        // Consulta SQL (sin bind_param, como pediste)
        $sql = "SELECT * FROM t_usuarios_juan WHERE nombre = '$usuario'";
        $result = $conn->query($sql);

        // Verificar si hay resultados
        if ($result && $result->num_rows > 0) {
            echo "<h3>Usuarios encontrados:</h3>";
            echo "<table border='1'>";
            echo "<tr>";
            while ($field = $result->fetch_field()) {
                echo "<th>" . htmlspecialchars($field->name) . "</th>";
            }
            echo "</tr>";

            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                foreach ($row as $value) {
                    echo "<td>" . htmlspecialchars($value) . "</td>";
                }
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "<p>No se encontró ningún usuario con ese nombre.</p>";
        }

        // Cerrar conexión
        $conn->close();
    }
    ?>
</body>
</html>
