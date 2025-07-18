-- DROP DATABASE IF EXISTS db_sedes;
-- CREATE DATABASE IF NOT EXISTS db_sedes;
-- USE db_sedes;

-- Paso 1: Borrado de las tablas, si existen
DROP TABLE IF EXISTS t_sede;
DROP TABLE IF EXISTS t_departamento;
DROP TABLE IF EXISTS t_empleado;

-- Paso 2: Creación de las tablas con sus datos

CREATE TABLE t_sede (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE t_departamento (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  cod_director int NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE t_empleado (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  cod_sede int NOT NULL,
  cod_departamento int NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO t_sede (id, nombre) VALUES (1, 'Madrid');
INSERT INTO t_sede (id, nombre) VALUES (2, 'Bilbao');
INSERT INTO t_sede (id, nombre) VALUES (3, 'Sevilla');
INSERT INTO t_sede (id, nombre) VALUES (4, 'Granada');

INSERT INTO t_departamento (id, nombre, cod_director) VALUES (1, 'Dirección General', 2);
INSERT INTO t_departamento (id, nombre, cod_director) VALUES (2, 'IT', 10);
INSERT INTO t_departamento (id, nombre, cod_director) VALUES (3, 'Comercial', 1);
INSERT INTO t_departamento (id, nombre, cod_director) VALUES (4, 'RRHH', 10);
INSERT INTO t_departamento (id, nombre, cod_director) VALUES (5, 'Administración y finanzas', NULL);
INSERT INTO t_departamento (id, nombre, cod_director) VALUES (6, 'Operaciones', 10);
INSERT INTO t_departamento (id, nombre, cod_director) VALUES (7, 'Márketing', 10);
INSERT INTO t_departamento (id, nombre, cod_director) VALUES (8, 'Comunicación', 10);

INSERT INTO t_empleado (id, nombre, cod_sede, cod_departamento) VALUES (1, 'Ana', 4, 3);
INSERT INTO t_empleado (id, nombre, cod_sede, cod_departamento) VALUES (2, 'Lidia', 2, 1);


-- Paso 3: Creación de las FK
ALTER TABLE t_empleado ADD CONSTRAINT t_empleado_fk_1 FOREIGN KEY (cod_sede) REFERENCES t_sede (id);
ALTER TABLE t_empleado ADD CONSTRAINT t_empleado_fk_2 FOREIGN KEY (cod_departamento) REFERENCES t_departamento (id);
ALTER TABLE t_departamento ADD CONSTRAINT t_departamento_fk_1 FOREIGN KEY (cod_director) REFERENCES t_empleado (id);
