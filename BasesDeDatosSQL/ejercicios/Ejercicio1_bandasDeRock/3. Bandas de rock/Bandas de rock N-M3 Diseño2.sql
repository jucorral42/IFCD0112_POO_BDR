DROP DATABASE IF EXISTS db_bandas_de_rockNMI;
CREATE DATABASE IF NOT EXISTS db_bandas_de_rockNMI;
USE db_bandas_de_rockNMI;

-- Paso 1: Borrado de las tablas, si existen
DROP TABLE IF EXISTS t_grupo;
DROP TABLE IF EXISTS t_integrante;
DROP TABLE IF EXISTS t_rel_grupo_integrante;

-- Paso 2: Creación de las tablas con sus datos y PK
CREATE TABLE IF NOT EXISTS t_grupo (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS t_integrante (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  instrumento ENUM('CA','BJ','BT') NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS t_rel_grupo_integrante (
  cod_grupo int NOT NULL,
  cod_integrante int NOT NULL,
  PRIMARY KEY (cod_grupo, cod_integrante)
);

INSERT INTO t_grupo (id, nombre) VALUES (8, 'Nirvana');
INSERT INTO t_grupo (id, nombre) VALUES (13, 'Foo Fighters');
INSERT INTO t_grupo (id, nombre) VALUES (20, 'Iron Maiden');

INSERT INTO t_integrante (id, nombre, instrumento) VALUES (29, 'Dave Gröhl', 'BT');
INSERT INTO t_integrante (id, nombre, instrumento) VALUES (43, 'Nate Mendel', 'BJ');
INSERT INTO t_integrante (id, nombre, instrumento) VALUES (201, 'Steve Harris', 'BJ');

INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (8, 29);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (13, 43);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (13, 29);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (20, 201);


-- Paso 3: Creación de las FK
ALTER TABLE t_rel_grupo_integrante ADD CONSTRAINT t_rel_grupo_integrante_fk_1 FOREIGN KEY (cod_grupo) REFERENCES t_grupo (id);
ALTER TABLE t_rel_grupo_integrante ADD CONSTRAINT t_rel_grupo_integrante_fk_2 FOREIGN KEY (cod_integrante) REFERENCES t_integrante (id);