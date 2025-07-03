<?php
$host = 'localhost';
$usuario = 'manuherr_curronet';
$contrasena = '8)Srp9SSS5oFsf%3y9';
$bd = 'manuherr_curronet';

$conn = new mysqli($host, $usuario, $contrasena, $bd);

if ($conn->connect_error) {
    die('Error de conexión: ' . $conn->connect_error);
}
?>
