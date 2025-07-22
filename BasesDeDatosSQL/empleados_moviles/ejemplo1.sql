DROP DATABASE IF EXISTS db_empleados_moviles1;
CREATE DATABASE IF NOT EXISTS db_empleados_moviles1;
USE db_empleados_moviles1;

DROP TABLE IF EXISTS t_empleados_moviles;

CREATE TABLE IF NOT EXISTS t_empleados_moviles
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) UNIQUE
);

INSERT INTO t_empleados_moviles (nombre,telefono) VALUES 
('Ana',NULL),
('Elizabeth',666656545),
('Antonio', NULL),
('Jorge', NULL),
('Juan', 682358675),
('lidia',NULL);
