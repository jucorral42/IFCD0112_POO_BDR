<?php
session_start();
require_once 'includes/config.php'; // Conexión a la base de datos

$mensaje = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    // Buscar el usuario en la base de datos
    $stmt = $conn->prepare("SELECT id, nombre, password, rol FROM t_usuarios_juan WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows === 1) {
        $usuario = $resultado->fetch_assoc();

        // Verificar la contraseña
        if (password_verify($password, $usuario['password'])) {
            $_SESSION['usuario'] = $usuario['nombre'];
            $_SESSION['id_usuario'] = $usuario['id'];
            $_SESSION['rol'] = $usuario['rol'];

            // Redirigir a página de bienvenida
            header("Location: bienvenido.php");
            exit();
        } else {
            $mensaje = '❌ Contraseña incorrecta.';
        }
    } else {
        $mensaje = '❌ No existe una cuenta con ese email.';
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<h1>Iniciar sesión</h1>

<?php if ($mensaje): ?>
    <p style="color:red;"><?php echo $mensaje; ?></p>
<?php endif; ?>

<form method="post" action="login.php">
    <label for="email">Correo electrónico:</label><br>
    <input type="email" name="email" required><br><br>

    <label for="password">Contraseña:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Entrar</button>
</form>

<p>¿No tienes cuenta? <a href="registro.php">Regístrate aquí</a></p>

</body>
</html>
