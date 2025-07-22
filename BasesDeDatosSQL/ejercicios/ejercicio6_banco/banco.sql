DROP DATABASE IF EXISTS db_banco;
CREATE DATABASE IF NOT EXISTS db_banco;
USE db_banco;

-- Eliminamos tablas
DROP TABLE IF EXISTS t_persona;
DROP TABLE IF EXISTS t_empleado;
DROP TABLE IF EXISTS t_cliente;
DROP TABLE IF EXISTS t_sucursal;
DROP TABLE IF EXISTS t_cuenta;
DROP TABLE IF EXISTS t_prestamo;
DROP TABLE IF EXISTS tr_cliente_empleado;
DROP TABLE IF EXISTS tr_cuenta_cliente;

-- Creamos tablas
CREATE TABLE IF NOT EXISTS t_persona
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nif varchar(10),
    direccion VARCHAR(100),
    telefono VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS t_sucursal
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ciudad VARCHAR(50) UNIQUE NOT NULL,
    activos DECIMAL (100,2)
);

CREATE TABLE IF NOT EXISTS t_empleado
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idEmp VARCHAR(20) NOT NULL UNIQUE,
    cod_persona INT NOT NULL UNIQUE,
    cod_jefe VARCHAR(20) NOT NULL,
    incorporacion DATE DEFAULT (CURRENT_DATE)
);


CREATE TABLE IF NOT EXISTS t_cliente
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idCli VARCHAR(20) NOT NULL UNIQUE,
    cod_persona INT NOT NULL UNIQUE,
    cod_cuenta INT NOT NULL UNIQUE,
    cod_prestamo INT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS t_cuenta
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_cuenta INT NOT NULL UNIQUE,
    saldo DECIMAL (100,2) DEFAULT 0,
    ultimo_acceso TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tipo_cuenta ENUM ('Cuenta corriente','Cuenta ahorro'),
    interes_anual DECIMAL (5,2),
    ultimo_descubierto TIMESTAMP
);

CREATE TABLE IF NOT EXISTS t_cuenta_corriente
(
    cod_cuenta INT;
    interes_anual DECIMAL (5,2),
    ultimo_descubierto TIMESTAMP
);

CREATE TABLE IF NOT EXISTS t_cuenta_ahorro
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_cuenta INT NOT NULL UNIQUE,
    saldo DECIMAL (100,2) DEFAULT 0,
    ultimo_acceso TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tipo_cuenta ENUM ('Cuenta corriente','Cuenta ahorro'),
    interes_anual DECIMAL (5,2),
    ultimo_descubierto TIMESTAMP
);

CREATE TABLE IF NOT EXISTS t_prestamo
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_sucursal INT NOT NULL,
    cod_cuenta INT NOT NULL,
    firmado boolean DEFAULT false,
    cod_cliente_firma INT NOT NULL,
    UNIQUE(cod_cuenta,cod_cliente_firma),
    importe_prestado DECIMAL (20,2) NOT NULL,
    importe_pendiente DECIMAL(20,2) NOT NULL,
);


CREATE TABLE IF NOT EXISTS tr_cliente_empleado
(
    id INT NOT NULL AUTO_INCREMENT,
    cod_cliente INT NOT NULL,
    cod_empleado INT NOT NULL,
    tipo_relacion ENUM ('responsable de prestamos', 'asesor personal') NOT NULL,
    PRIMARY KEY (cod_cliente, cod_empleado, tipo_relacion)
);

CREATE TABLE IF NOT EXISTS tr_cuenta_cliente
(
    cod_cliente INT NOT NULL,
    cod_cuenta  INT NOT NULL,
    jerarquia_titulares INT NOT NULL,
    PRIMARY KEY (cod_cliente,cod_cuenta,jerarquia_titulares)
);


CREATE TABLE IF NOT EXISTS tr_devolucion_prestamo
(   
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_prestamo INT NOT NULL,
    importe DECIMAL (10.,2),
    pendiente boolean DEFAULT true,
    fecha TIMESTAMP ,
    PRIMARY KEY (cod_prestamo,importe)
);





    /*2️⃣ Si quieres un contador por grupo (categoria), debes calcularlo tú en la inserción, por ejemplo en MySQL:

sql
Copiar
Editar
INSERT INTO ejemplo (categoria, numero)
SELECT 'A', IFNULL(MAX(numero), 0) + 1
FROM ejemplo
WHERE categoria = 'A';
/*

