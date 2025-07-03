<?php
session_start();
require_once 'includes/config.php'; // Conexión a la base de datos

$mensaje = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = trim($_POST['nombre'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $confirmar = $_POST['confirmar'] ?? '';

    if ($password !== $confirmar) {
        $mensaje = '⚠️ Las contraseñas no coinciden.';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $mensaje = '⚠️ El correo electrónico no es válido.';
    } else {
        // Cifrar la contraseña
        $hash = password_hash($password, PASSWORD_DEFAULT);

        // Preparar consulta para evitar SQL Injection
        $stmt = $conn->prepare("INSERT INTO t_usuarios_juan (nombre, email, password) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $nombre, $email, $hash);

        if ($stmt->execute()) {
            $mensaje = '✅ Registro exitoso. Ahora puedes <a href="login.php">iniciar sesión</a>.';
        } else {
            // Error por email duplicado u otro fallo
            if ($conn->errno === 1062) {
                $mensaje = '⚠️ El correo ya está registrado.';
            } else {
                $mensaje = '❌ Error al registrar: ' . $conn->error;
            }
        }

        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<h1>Registro de usuario</h1>

<?php if ($mensaje): ?>
    <p style="color:blue;"><?php echo $mensaje; ?></p>
<?php endif; ?>

<form method="post" action="registro.php">
    <label for="nombre">Nombre:</label><br>
    <input type="text" name="nombre" required><br><br>

    <label for="email">Correo electrónico:</label><br>
    <input type="email" name="email" required><br><br>

    <label for="password">Contraseña:</label><br>
    <input type="password" name="password" required><br><br>

    <label for="confirmar">Confirmar contraseña:</label><br>
    <input type="password" name="confirmar" required><br><br>

    <button type="submit">Registrarse</button>
</form>

<p>¿Ya tienes cuenta? <a href="login.php">Inicia sesión</a></p>

</body>
</html>
