DROP DATABASE IF EXISTS db_sedes;
CREATE DATABASE IF NOT EXISTS db_sedes;
USE db_sedes;

-- Paso 1: Borrado de las tablas, si existen
DROP TABLE IF EXISTS t_sede;
DROP TABLE IF EXISTS t_empleado;

-- Paso 2: Creación de las tablas con sus datos

CREATE TABLE t_sede (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  nombre cod_empleado_gerente int NOT NULl,
  PRIMARY KEY (id)
);
CREATE TABLE t_empleado (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  cod_sede int NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO t_sede (id, nombre) VALUES (1, 'Madrid');
INSERT INTO t_sede (id, nombre) VALUES (2, 'Bilbao');
INSERT INTO t_sede (id, nombre) VALUES (3, 'Sevilla');
INSERT INTO t_sede (id, nombre) VALUES (4, 'Granada');


INSERT INTO t_empleado (id, nombre,cod_sede) VALUES (1, 'Ana',4);
INSERT INTO t_empleado (id, nombre,cod_sede) VALUES (2, 'Lidia',2);
INSERT INTO t_empleado (id, nombre,cod_sede) VALUES (3, 'Lidia1',2);
INSERT INTO t_empleado (id, nombre,cod_sede) VALUES (4, 'Lidia2',1);
INSERT INTO t_empleado (id, nombre,cod_sede) VALUES (5, 'Lidia3',3);


-- Paso 3: Creación de las PK y FK

-- Paso 4: Consultas

SELECT * FROM t_sede, t_empleado;

SELECT t_sede.nombre, t_empleado.nombre FROM t_sede, t_empleado where t_sede.id=t_empleado.cod_sede;
SELECT t_sede.nombre, t_empleado.nombre FROM t_sede, t_empleado where t_sede.id=t_empleado.cod_sede;