<?php
session_start();

// Verificar que el usuario ha iniciado sesión
if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bienvenido</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<h1>¡Bienvenido, <?php echo htmlspecialchars($_SESSION['usuario']); ?>!</h1>

<p>Has iniciado sesión correctamente.</p>
<p><a href="index.php">Ir a la página principal</a></p>
<p><a href="logout.php">Cerrar sesión</a></p>

</body>
</html>
