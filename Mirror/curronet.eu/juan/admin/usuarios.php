<?php
session_start();
require_once '../includes/config.php';

if (!isset($_SESSION['usuario'])) {
    header("Location: ../login.php");
    exit();
}

$sql = "SELECT id, nombre, email, fecha_registro FROM t_usuarios_juan ORDER BY fecha_registro DESC";
$resultado = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #0052CC;
            color: white;
            padding: 20px;
            text-align: center;
        }

        h1 {
            margin: 0;
            font-size: 24px;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .actions a {
            text-decoration: none;
            color: #0052CC;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #e9f0fb;
        }

        td a.edit-btn {
            padding: 6px 12px;
            background-color: #007BFF;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
        }

        td a.edit-btn:hover {
            background-color: #0056b3;
        }

        .no-users {
            text-align: center;
            color: #777;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<header>
    <h1>Gestión de Usuarios del CRM</h1>
</header>

<div class="container">

    <div class="actions">
        <a href="dashboard.php">← Volver al panel</a>
        <a href="../logout.php">Cerrar sesión</a>
    </div>

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
                            <a class="edit-btn" href="editar_usuario.php?id=<?php echo $usuario['id']; ?>">Editar</a>
                        <?php else: ?>
                            —
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endwhile; ?>
        </table>
    <?php else: ?>
        <p class="no-users">No hay usuarios registrados.</p>
    <?php endif; ?>

</div>

</body>
</html>
