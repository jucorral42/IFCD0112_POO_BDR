<?php
// Configuración de la base de datos
$host = 'localhost';
$db = 'mi_base_datos'; // Cambiar por el nombre real de tu base
$user = 'root';
$pass = 'root';

function mostrarRegistrosBD($tabla) {
    global $host, $db, $user, $pass;

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT * FROM $tabla";
        $stmt = $pdo->query($sql);
        $registros = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($registros) {
            echo "<h3>Registros en la tabla '$tabla':</h3>";
            foreach ($registros as $registro) {
                echo implode(' | ', $registro) . "<br>";
            }
        } else {
            echo "La tabla '$tabla' está vacía o no tiene registros.<br>";
        }

    } catch (PDOException $e) {
        echo "Error al acceder a la tabla '$tabla': " . $e->getMessage() . "<br>";
    }
}

function mostrarRegistrosFichero($nombreFichero) {
    if (!file_exists($nombreFichero)) {
        echo "El fichero '$nombreFichero' no existe.<br>";
        return;
    }

    echo "<h3>Registros en el fichero '$nombreFichero':</h3>";
    $lineas = file($nombreFichero, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lineas as $linea) {
        echo htmlspecialchars($linea) . "<br>";
    }
}
