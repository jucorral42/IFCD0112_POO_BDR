<?php
$conexion = new mysqli("localhost", "root", "root", "db_fabrica1");
$conexion->set_charset("utf8");

if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Fábrica</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f7fa;
            color: #333;
        }
        header {
            background: #007acc;
            color: white;
            padding: 20px;
            text-align: center;
        }
        h2 {
            border-bottom: 2px solid #007acc;
            padding-bottom: 5px;
        }
        .container {
            padding: 20px;
        }
        form, table {
            margin-bottom: 30px;
            background: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
        }
        input[type="text"], select {
            padding: 8px;
            width: 250px;
        }
        button {
            padding: 8px 16px;
            background: #007acc;
            color: white;
            border: none;
            border-radius: 4px;
            margin-top: 10px;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ccc;
        }
        footer {
            text-align: center;
            font-size: 14px;
            padding: 20px;
            background: #eee;
        }
    </style>
</head>
<body>
<header>
    <h1>Gestión de Materias Primas y Componentes</h1>
</header>

<div class="container">
    <form method="GET">
        <h2>1. Materias primas suministradas por proveedor</h2>
        <select name="proveedor">
            <?php
            $res = $conexion->query("SELECT nombre FROM t_proveedor ORDER BY nombre");
            while ($row = $res->fetch_assoc()) {
                echo "<option value='{$row['nombre']}'>{$row['nombre']}</option>";
            }
            ?>
        </select>
        <button type="submit" name="consulta" value="materias">Consultar</button>
    </form>

    <?php
    if ($_GET['consulta'] == 'materias' && !empty($_GET['proveedor'])) {
        $proveedor = $conexion->real_escape_string($_GET['proveedor']);
        $sql = "
        SELECT nombre_proveedor, nombre_material_primario, nombre_producto_final 
        FROM v_proveedor_material_producto 
        WHERE nombre_proveedor = '$proveedor'";
        $resultado = $conexion->query($sql);
        echo "<table><tr><th>Proveedor</th><th>Materia Prima</th><th>Componente Final</th></tr>";
        while ($fila = $resultado->fetch_assoc()) {
            echo "<tr><td>{$fila['nombre_proveedor']}</td><td>{$fila['nombre_material_primario']}</td><td>{$fila['nombre_producto_final']}</td></tr>";
        }
        echo "</table>";
    }
    ?>

    <form method="GET">
        <h2>2. Componentes con stock inferior al mínimo</h2>
        <button type="submit" name="consulta" value="stock">Mostrar</button>
    </form>

    <?php
    if ($_GET['consulta'] == 'stock') {
        $res = $conexion->query("SELECT * FROM v_aviso_stock");
        echo "<table><tr><th>ID</th><th>Nombre</th><th>Stock Actual</th><th>Stock Mínimo</th></tr>";
        while ($fila = $res->fetch_assoc()) {
            echo "<tr><td>{$fila['id']}</td><td>{$fila['nombre']}</td><td>{$fila['stock_actual']}</td><td>{$fila['stock_minimo']}</td></tr>";
        }
        echo "</table>";
    }
    ?>

    <form method="GET">
        <h2>3. Jerarquía de materiales (inmediatos hijos y padres)</h2>
        <input type="text" name="material" placeholder="Nombre del material" required>
        <button type="submit" name="consulta" value="jerarquia">Consultar</button>
    </form>

    <?php
    if ($_GET['consulta'] == 'jerarquia' && !empty($_GET['material'])) {
        $material = $conexion->real_escape_string($_GET['material']);
        $sql = "
            SELECT padre.id AS id_padre, padre.nombre AS nombre_padre,
                   hijo.id AS id_hijo, hijo.nombre AS nombre_hijo
            FROM t_relacion_objeto_objeto r
            JOIN t_material hijo ON hijo.id = r.cod_objeto_recurso
            JOIN t_material padre ON padre.id = r.cod_objeto_final
            WHERE padre.nombre = '$material' OR hijo.nombre = '$material'";
        $res = $conexion->query($sql);
        echo "<table><tr><th>ID Padre</th><th>Nombre Padre</th><th>ID Hijo</th><th>Nombre Hijo</th></tr>";
        while ($row = $res->fetch_assoc()) {
            echo "<tr><td>{$row['id_padre']}</td><td>{$row['nombre_padre']}</td><td>{$row['id_hijo']}</td><td>{$row['nombre_hijo']}</td></tr>";
        }
        echo "</table>";
    }
    ?>

    <h2>📊 Tablas de la Base de Datos</h2>

    <h3>t_proveedor</h3>
    <?php
    $res = $conexion->query("SELECT * FROM t_proveedor");
    echo "<table><tr>";
    while ($field = $res->fetch_field()) echo "<th>{$field->name}</th>";
    echo "</tr>";
    while ($row = $res->fetch_assoc()) {
        echo "<tr>";
        foreach ($row as $dato) echo "<td>$dato</td>";
        echo "</tr>";
    }
    echo "</table>";
    ?>

    <h3>t_material</h3>
    <?php
    $res = $conexion->query("SELECT * FROM t_material");
    echo "<table><tr>";
    while ($field = $res->fetch_field()) echo "<th>{$field->name}</th>";
    echo "</tr>";
    while ($row = $res->fetch_assoc()) {
        echo "<tr>";
        foreach ($row as $dato) echo "<td>$dato</td>";
        echo "</tr>";
    }
    echo "</table>";
    ?>

    <h3>t_relacion_objeto_objeto</h3>
    <?php
    $res = $conexion->query("SELECT * FROM t_relacion_objeto_objeto");
    echo "<table><tr>";
    while ($field = $res->fetch_field()) echo "<th>{$field->name}</th>";
    echo "</tr>";
    while ($row = $res->fetch_assoc()) {
        echo "<tr>";
        foreach ($row as $dato) echo "<td>$dato</td>";
        echo "</tr>";
    }
    echo "</table>";
    ?>
</div>

<footer>
    &copy; 2025 Fábrica Industrial - Consulta de datos
</footer>

</body>
</html>
