<?php
// test_db.php

// Parámetros de conexión
$host = 'localhost';
$dbname = 'manuherr_curronet';
$user = 'manuherr_curronet';
$pass = '8)Srp9SSS5oFsf%3y9';

// 1) Conexión con PDO
try {
    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ]);
    echo "Conexión exitosa a la base de datos.<br>";
} catch (PDOException $e) {
    die("Error de conexión: " . $e->getMessage());
}

// 2) Crear la tabla t_cliente_prueba (si no existe)
try {
    $sqlCreate = "
        CREATE TABLE IF NOT EXISTS t_cliente_prueba (
            id INT AUTO_INCREMENT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            email VARCHAR(150) NOT NULL,
            creado_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ";
    $pdo->exec($sqlCreate);
    echo "Tabla <strong>t_cliente_prueba</strong> creada (o ya existía).<br>";
} catch (PDOException $e) {
    die("Error al crear la tabla: " . $e->getMessage());
}

// 3) Insertar un registro de prueba
try {
    $stmt = $pdo->prepare("INSERT INTO t_cliente_prueba (nombre, email) VALUES (?, ?)");
    $stmt->execute(['Cliente de Prueba', 'prueba@manuherran.com']);
    echo "Registro insertado con ID: " . $pdo->lastInsertId() . "<br>";
} catch (PDOException $e) {
    die("Error al insertar el registro: " . $e->getMessage());
}

// 4) Opcional: leer y mostrar los registros
try {
    $rows = $pdo->query("SELECT * FROM t_cliente_prueba")->fetchAll();
    echo "<h3>Contenido de t_cliente_prueba:</h3><pre>";
    print_r($rows);
    echo "</pre>";
} catch (PDOException $e) {
    die("Error al leer registros: " . $e->getMessage());
}
