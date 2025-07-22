DROP DATABASE IF EXISTS db_empleados_moviles2;
CREATE DATABASE IF NOT EXISTS db_empleados_moviles2;
USE db_empleados_moviles2;

DROP TABLE IF EXISTS t_empleado;

CREATE TABLE IF NOT EXISTS t_empleado
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS t_movil
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    telefono VARCHAR(20) UNIQUE,
     pin varchar(50) NOT NULL,
     puk varchar(50) NOT NULL,
);

INSERT INTO t_empleado (nombre) VALUES 
('Ana'),
('Elizabeth'),
('Antonio'),
('Jorge'),
('Juan'),
('lidia');


INSERT INTO t_empleados/moviles (telefono) VALUES 
(NULL),
(666656545),
( NULL),
( NULL),
( 682358675),
(NULL);