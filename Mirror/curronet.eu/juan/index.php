<?php
session_start();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bienvenido a Curronet CRM</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <img src="assets/img/logo.png" alt="Logo CRM" style="max-width: 150px;">

    <h1>Bienvenido al CRM de la Comunidad</h1>

    <?php if (isset($_SESSION['usuario'])): ?>
        <p>Hola, <?php echo htmlspecialchars($_SESSION['usuario']); ?> | <a href="logout.php">Cerrar sesión</a></p>
        <p><a href="tienda.php">Ir a la tienda</a></p>
        <p><a href="admin/dashboard.php">Panel de administración</a></p>
    <?php else: ?>
        <p><a href="login.php">Iniciar sesión</a> | <a href="registro.php">Registrarse</a></p>
    <?php endif; ?>

</body>
</html>
