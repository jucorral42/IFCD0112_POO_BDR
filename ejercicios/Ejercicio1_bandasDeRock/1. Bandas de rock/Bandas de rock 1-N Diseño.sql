DROP DATABASE IF EXISTS db_bandas_de_rock1N;
CREATE DATABASE IF NOT EXISTS db_bandas_de_rock1N;
USE db_bandas_de_rock1N;

-- Paso 1: Borrado de las tablas, si existen
DROP TABLE IF EXISTS t_grupo;
DROP TABLE IF EXISTS t_integrante;

-- Paso 2: Creación de las tablas con sus datos y PK
CREATE TABLE IF NOT EXISTS t_grupo (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS t_integrante (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  cod_grupo int NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO t_grupo (id, nombre) VALUES (2, 'Depeche Mode');
INSERT INTO t_grupo (id, nombre) VALUES (8, 'Nirvana');

INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (6, 'Alan Wilder', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (7, 'Andrew Fletcher', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (8, 'Dave Gahan', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (9, 'Martin Gore', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (10, 'Vince Clarke', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (29, 'Dave Gröhl', 8);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (30, 'Krist Novoselic', 8);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (31, 'Kurt Cobain', 8);

-- Paso 3: Creación de las FK

ALTER TABLE t_integrante ADD CONSTRAINT t_integrante_fk_1 FOREIGN KEY (cod_grupo) REFERENCES t_grupo (id);