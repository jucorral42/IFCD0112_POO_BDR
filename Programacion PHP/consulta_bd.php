<?php
// Datos de conexión
$host = 'localhost';
$dbname = 'manuherr_curronet';
$user = 'manuherr_curronet';
$pass = '8)Srp9SSS5oFsf%3y9';

try {
    // Crear conexión con PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Generar nombre aleatorio de tabla
    $tableName = "tabla_" . uniqid();

    // Crear la tabla
    $sqlCreate = "CREATE TABLE `$tableName` (
        id INT AUTO_INCREMENT PRIMARY KEY,
        dato VARCHAR(255)
    )";
    $pdo->exec($sqlCreate);

    // Insertar 10 datos aleatorios
    $stmtInsert = $pdo->prepare("INSERT INTO `$tableName` (dato) VALUES (:dato)");
    for ($i = 1; $i <= 10; $i++) {
        $randomText = "dato_" . rand(1000, 9999);
        $stmtInsert->execute([':dato' => $randomText]);
    }

    // Leer el dato número 8
    $stmtSelect = $pdo->prepare("SELECT dato FROM `$tableName` ORDER BY id ASC LIMIT 1 OFFSET 7");
    $stmtSelect->execute();
    $result = $stmtSelect->fetch(PDO::FETCH_ASSOC);

    echo "Dato número 8: " . ($result['dato'] ?? 'No encontrado') . "<br>";
    echo "Tabla utilizada: $tableName";

} catch (PDOException $e) {
    echo "Error de conexión o ejecución: " . $e->getMessage();
}
?>
