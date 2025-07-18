-- Eliminar la BD si ya existe y crearla de nuevo
DROP DATABASE IF EXISTS empleado_coche;
CREATE DATABASE IF NOT EXISTS empleado_coche;
USE empleado_coche;

-- Eliminar tablas si ya existen (en orden para evitar conflictos)
DROP TABLE IF EXISTS asignacion_coche;
DROP TABLE IF EXISTS coche_empresa;
DROP TABLE IF EXISTS t_empleado;

-- Crear tabla de empleados
CREATE TABLE t_empleado (
    dni VARCHAR(9) NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

-- Crear tabla de coches de empresa
CREATE TABLE coche_empresa (
    matricula VARCHAR(10) NOT NULL PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    color VARCHAR(30) NOT NULL
);

-- Crear tabla de asignaciones de coches
CREATE TABLE asignacion_coche (
    id_asignacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dni_empleado VARCHAR(9) NOT NULL,
    matricula_coche VARCHAR(10) NOT NULL,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (dni_empleado) REFERENCES t_empleado(dni),
    FOREIGN KEY (matricula_coche) REFERENCES coche_empresa(matricula)
);

-- Insertar algunos empleados
INSERT INTO t_empleado (dni, nombre, apellidos, email, telefono) VALUES
('12345678A', 'Juan', 'Pérez García', 'juan.perez@example.com', '600123456'),
('87654321B', 'Laura', 'Martínez López', 'laura.martinez@example.com', '600654321'),
('11223344C', 'Carlos', 'Sánchez Ruiz', 'carlos.sanchez@example.com', '600112233');

-- Insertar algunos coches
INSERT INTO coche_empresa (matricula, marca, modelo, color) VALUES
('1234ABC', 'Toyota', 'Corolla', 'Blanco'),
('5678DEF', 'Ford', 'Focus', 'Azul'),
('9012GHI', 'Seat', 'León', 'Rojo');

-- Insertar algunas asignaciones
INSERT INTO asignacion_coche (dni_empleado, matricula_coche, fecha_asignacion) VALUES
('12345678A', '1234ABC', '2025-07-01'),
('87654321B', '5678DEF', '2025-07-02'),
('11223344C', '9012GHI', '2025-07-03');
