<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>CRM de Juan – Bienvenido</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #f4f6f8, #e2eafc);
            color: #333;
        }

        .header {
            text-align: center;
            padding: 60px 20px 30px;
        }

        .logo {
            max-width: 100px;
            margin-bottom: 10px;
        }

        h1 {
            font-size: 32px;
            margin: 10px 0;
            color: #0052CC;
        }

        .intro {
            max-width: 700px;
            margin: 0 auto;
            text-align: center;
            font-size: 18px;
            line-height: 1.6;
        }

        .cta {
            margin-top: 40px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .cta a {
            padding: 14px 28px;
            text-decoration: none;
            font-weight: 600;
            border-radius: 6px;
            font-size: 16px;
            transition: 0.3s;
        }

        .login-btn {
            background-color: #007BFF;
            color: white;
        }

        .login-btn:hover {
            background-color: #0056b3;
        }

        .register-btn {
            background-color: #28A745;
            color: white;
        }

        .register-btn:hover {
            background-color: #1e7e34;
        }

        .footer {
            text-align: center;
            padding: 30px 10px;
            font-size: 14px;
            color: #666;
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 26px;
            }

            .cta {
                flex-direction: column;
            }

            .cta a {
                width: 80%;
            }
        }
    </style>
</head>
<body>

<div class="header">
    <img src="assets/img/logo.png" alt="Logo CRM" class="logo">
    <h1>Bienvenido al CRM de Juan</h1>
    <p class="intro">
        Este sistema está diseñado para gestionar usuarios, productos y servicios de una comunidad profesional.<br>
        Accede con tu cuenta para explorar las funcionalidades o regístrate si aún no eres miembro.
    </p>
    <div class="cta">
        <a href="login.php" class="login-btn">Iniciar sesión</a>
        <a href="registro.php" class="register-btn">Registrarse</a>
    </div>
</div>

<div class="footer">
    &copy; <?php echo date("Y"); ?> CRM de Juan. Todos los derechos reservados.
</div>

</body>
</html>
