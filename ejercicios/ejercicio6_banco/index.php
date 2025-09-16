<?php
$dsn = "mysql:host=localhost;dbname=db_banco;charset=utf8mb4";
$user = "root";
$pass = "root";

try {
    $pdo = new PDO($dsn, $user, $pass);
} catch (PDOException $e) {
    die("Error de conexión: " . $e->getMessage());
}

function printTable($data, $title = "") {
    if (!$data) return;
    echo "<h2>$title</h2><table border='1' cellpadding='5'><thead><tr>";
    foreach (array_keys($data[0]) as $col) {
        echo "<th>$col</th>";
    }
    echo "</tr></thead><tbody>";
    foreach ($data as $row) {
        echo "<tr>";
        foreach ($row as $cell) {
            echo "<td>" . htmlspecialchars($cell) . "</td>";
        }
        echo "</tr>";
    }
    echo "</tbody></table><br>";
}

function mostrarTablas($pdo) {
    $stmt = $pdo->query("SHOW TABLES");
    $tablas = $stmt->fetchAll(PDO::FETCH_COLUMN);
    foreach ($tablas as $tabla) {
        $stmt = $pdo->query("SELECT * FROM `$tabla`"); // Seguridad con backticks
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($rows) {
            printTable($rows, "Tabla: $tabla");
        } else {
            echo "<h2>Tabla: $tabla (vacía)</h2><br>";
        }
    }
}

$resultado = [];
$consulta = $_POST['consulta'] ?? '';
$parametro = $_POST['parametro'] ?? '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $consulta) {
    switch ($consulta) {
        case 'total_sucursal':
            $stmt = $pdo->prepare("
                SELECT s.id AS sucursal_id, ciu.nombre AS ciudad, SUM(p.importe_prestado) AS total_prestado
                FROM t_prestamo p
                JOIN t_sucursal s ON p.cod_sucursal = s.id
                LEFT JOIN t_ciudad ciu ON s.cod_ciudad = ciu.id
                WHERE s.id = :id
                GROUP BY s.id, ciu.nombre
            ");
            $stmt->execute(['id' => $parametro]);
            $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
            break;

        case 'total_todas_sucursales':
            $stmt = $pdo->query("
                SELECT s.id AS sucursal_id, ciu.nombre AS ciudad, SUM(p.importe_prestado) AS total_prestado
                FROM t_prestamo p
                JOIN t_sucursal s ON p.cod_sucursal = s.id
                LEFT JOIN t_ciudad ciu ON s.cod_ciudad = ciu.id
                GROUP BY s.id, ciu.nombre
            ");
            $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
            break;

        case 'prestamos_cliente':
            $stmt = $pdo->prepare("CALL sp_prestamos_por_cliente(:id_cliente)");
            $stmt->execute(['id_cliente' => $parametro]);
            $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
            break;

        case 'prestamos_empleado':
            $stmt = $pdo->prepare("
                SELECT p.*
                FROM t_prestamo p
                JOIN tr_prestamo_cliente pc ON p.id = pc.cod_prestamo
                JOIN tr_cliente_empleado ce ON pc.cod_cliente = ce.cod_cliente
                WHERE ce.cod_empleado = :id_empleado
            ");
            $stmt->execute(['id_empleado' => $parametro]);
            $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
            break;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Consultas Banco</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background: #f9f9f9; }
        table { border-collapse: collapse; margin-bottom: 40px; background-color: #fff; }
        th, td { border: 1px solid #999; padding: 8px 12px; text-align: left; }
        th { background-color: #ddd; }
        h2 { background-color: #f0f0f0; padding: 10px; border-left: 4px solid #007BFF; }
        form { margin-bottom: 30px; background: #fff; border: 1px solid #ccc; padding: 20px; width: fit-content; border-radius: 6px; }
        label, select, input, button { display: block; margin-bottom: 12px; font-size: 1rem; }
        input, select { padding: 5px; width: 250px; }
        button { padding: 8px 12px; background-color: #007BFF; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #0056b3; }
        hr { margin: 40px 0; }
    </style>
    <script>
        function mostrarCampoParametro() {
            const consulta = document.getElementById("consulta").value;
            const divParametro = document.getElementById("parametroDiv");
            const label = document.getElementById("paramLabel");

            if (consulta === "total_sucursal") {
                divParametro.style.display = "block";
                label.innerText = "ID de sucursal:";
            } else if (consulta === "prestamos_cliente") {
                divParametro.style.display = "block";
                label.innerText = "ID de cliente:";
            } else if (consulta === "prestamos_empleado") {
                divParametro.style.display = "block";
                label.innerText = "ID de empleado:";
            } else {
                divParametro.style.display = "none";
            }
        }

        window.onload = mostrarCampoParametro;
    </script>
</head>
<body>
    <h1>Consultas a la Base de Datos del Banco</h1>

    <form method="POST">
        <label for="consulta">Selecciona una consulta:</label>
        <select name="consulta" id="consulta" onchange="mostrarCampoParametro()" required>
            <option value="">-- Elige una opción --</option>
            <option value="total_sucursal" <?= $consulta === 'total_sucursal' ? 'selected' : '' ?>>1. Total préstamos para una sucursal (requiere ID)</option>
            <option value="total_todas_sucursales" <?= $consulta === 'total_todas_sucursales' ? 'selected' : '' ?>>2. Total préstamos por cada sucursal</option>
            <option value="prestamos_cliente" <?= $consulta === 'prestamos_cliente' ? 'selected' : '' ?>>3. Préstamos de un cliente (requiere ID)</option>
            <option value="prestamos_empleado" <?= $consulta === 'prestamos_empleado' ? 'selected' : '' ?>>4. Préstamos gestionados por un empleado (requiere ID)</option>
        </select>

        <div id="parametroDiv" style="display:none;">
            <label id="paramLabel" for="parametro">ID:</label>
            <input type="number" name="parametro" id="parametro" min="1" value="<?= htmlspecialchars($parametro) ?>">
        </div>

        <button type="submit">Ejecutar consulta</button>
    </form>

    <hr>

    <?php
    if ($consulta && $resultado) {
        printTable($resultado, "Resultado de la consulta");
    } elseif ($consulta) {
        echo "<p><strong>No se encontraron resultados.</strong></p>";
    } else {
        echo "<h2>Contenido completo de la base de datos:</h2>";
        mostrarTablas($pdo);
    }
    ?>
</body>
</html>
