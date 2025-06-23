<?php
session_start();
require_once '../includes/config.php';

// Verifica que el usuario esté autenticado
if (!isset($_SESSION['usuario'])) {
    header("Location: ../login.php");
    exit();
}

// Consultar todos los usuarios
$sql = "SELECT id, nombre, email, fecha_registro FROM t_usuarios_juan ORDER BY fecha_registro DESC";
$resultado = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }
        th {
            background-color: #eee;
        }
    </style>
</head>
<body>

<h1>Usuarios Registrados</h1>

<p><a href="dashboard.php">Volver al panel</a> | <a href="../logout.php">Cerrar sesión</a></p>

<?php if ($resultado && $resultado->num_rows > 0): ?>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Fecha de registro</th>
            <th>Acción</th>
        </tr>
        <?php while ($usuario = $resultado->fetch_assoc()): ?>
            <tr>
                <td><?php echo $usuario['id']; ?></td>
                <td><?php echo htmlspecialchars($usuario['nombre']); ?></td>
                <td><?php echo htmlspecialchars($usuario['email']); ?></td>
                <td><?php echo $usuario['fecha_registro']; ?></td>
                <td>
                    <?php if ($_SESSION['rol'] === 'admin'): ?>
                       <a href="editar_usuario.php?id=<?php echo $usuario['id']; ?>" style="padding:5px 10px; background:#4CAF50; color:#fff; text-decoration:none; border-radius:4px;">Editar</a>

                    <?php else: ?>
                        —
                    <?php endif; ?>
                </td>
            </tr>
        <?php endwhile; ?>
    </table>
<?php else: ?>
    <p>No hay usuarios registrados.</p>
<?php endif; ?>

</body>
</html>
