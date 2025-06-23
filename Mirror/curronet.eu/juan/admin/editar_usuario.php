<?php
session_start();
require_once '../includes/config.php';

if (!isset($_SESSION['usuario']) || $_SESSION['rol'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}


// Validar el ID del usuario
$id = $_GET['id'] ?? null;
if (!$id || !is_numeric($id)) {
    die("ID inválido.");
}

$mensaje = '';

// Obtener los datos actuales
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    $stmt = $conn->prepare("SELECT nombre, email FROM t_usuarios_juan WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows !== 1) {
        die("Usuario no encontrado.");
    }

    $usuario = $resultado->fetch_assoc();
    $nombre = $usuario['nombre'];
    $email = $usuario['email'];
    $stmt->close();
} else {
    // Si se envió el formulario
    $nombre = $_POST['nombre'] ?? '';
    $email = $_POST['email'] ?? '';

    $stmt = $conn->prepare("UPDATE t_usuarios_juan SET nombre = ?, email = ? WHERE id = ?");
    $stmt->bind_param("ssi", $nombre, $email, $id);

    if ($stmt->execute()) {
        $mensaje = '✅ Usuario actualizado correctamente.';
    } else {
        $mensaje = '❌ Error al actualizar: ' . $conn->error;
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario</title>
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>

<h1>Editar Usuario</h1>

<p><a href="usuarios.php">← Volver a gestión de usuarios</a></p>

<?php if ($mensaje): ?>
    <p><?php echo $mensaje; ?></p>
<?php endif; ?>

<form method="post">
    <label for="nombre">Nombre:</label><br>
    <input type="text" name="nombre" value="<?php echo htmlspecialchars($nombre); ?>" required><br><br>

    <label for="email">Correo electrónico:</label><br>
    <input type="email" name="email" value="<?php echo htmlspecialchars($email); ?>" required><br><br>

    <button type="submit">Guardar cambios</button>
</form>

</body>
</html>
