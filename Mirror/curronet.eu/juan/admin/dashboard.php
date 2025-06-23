<?php
session_start();

// Verifica que el usuario esté autenticado
if (!isset($_SESSION['usuario'])) {
    header("Location: ../login.php");
    exit();
}

// Aquí podrías verificar más adelante si $_SESSION['rol'] === 'admin'
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Administración</title>
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>

<h1>Panel de Administración</h1>

<p>Bienvenido, <?php echo htmlspecialchars($_SESSION['usuario']); ?>.</p>

<ul>
    <li><a href="../index.php">Inicio</a></li>
    <li><a href="../logout.php">Cerrar sesión</a></li>
</ul>

<hr>

<h2>Opciones del administrador</h2>

<ul>
    <ul>
    <li><a href="usuarios.php">Gestionar usuarios</a></li>
    <li><a href="../index.php">Inicio</a></li>
    <li><a href="../logout.php">Cerrar sesión</a></li>
</ul>


</body>
</html>
