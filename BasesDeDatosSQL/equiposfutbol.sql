DROP DATABASE IF EXISTS db_futbol;
CREATE DATABASE IF NOT EXISTS db_futbol;
USE db_futbol;

-- Paso 1: Borrado de las tablas, si existen

-- Paso 2: Creación de las tablas con sus datos

CREATE TABLE t_equipo (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO t_equipo (id, nombre) VALUES (1, 'Barcelona');
INSERT INTO t_equipo (id, nombre) VALUES (2, 'Espanyol');
INSERT INTO t_equipo (id, nombre) VALUES (3, 'CD Fontsanta Fatjo');
INSERT INTO t_equipo (id, nombre) VALUES (4, 'CF Damm');
INSERT INTO t_equipo (id, nombre) VALUES (5, 'Nàstic');
INSERT INTO t_equipo (id, nombre) VALUES (6, 'CF La Torreta');
INSERT INTO t_equipo (id, nombre) VALUES (7, 'CF Reus');
INSERT INTO t_equipo (id, nombre) VALUES (8, 'Girona');

SELECT * FROM t_equipo AS e1, t_equipo AS e2 where e1.id != e2.id AND e1.id > e2.id order by e1.id, e1.id;