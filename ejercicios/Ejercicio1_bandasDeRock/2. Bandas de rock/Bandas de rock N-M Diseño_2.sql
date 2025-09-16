DROP DATABASE IF EXISTS db_bandas_de_rockNM;
CREATE DATABASE IF NOT EXISTS db_bandas_de_rockNM;
USE db_bandas_de_rockNM;

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
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS t_rel_grupo_integrante (
  cod_grupo int NOT NULL,
  cod_integrante int NOT NULL,
  PRIMARY KEY (cod_grupo, cod_integrante)
);


INSERT INTO t_grupo (id, nombre) VALUES (2, 'Depeche Mode');
INSERT INTO t_grupo (id, nombre) VALUES (8, 'Nirvana');
INSERT INTO t_grupo (id, nombre) VALUES (13, 'Foo Fighters');

INSERT INTO t_integrante (id, nombre) VALUES (6, 'Alan Wilder');
INSERT INTO t_integrante (id, nombre) VALUES (7, 'Andrew Fletcher');
INSERT INTO t_integrante (id, nombre) VALUES (8, 'Dave Gahan');
INSERT INTO t_integrante (id, nombre) VALUES (9, 'Martin Gore');

INSERT INTO t_integrante (id, nombre) VALUES (29, 'Dave Gröhl');
INSERT INTO t_integrante (id, nombre) VALUES (30, 'Krist Novoselic');
INSERT INTO t_integrante (id, nombre) VALUES (31, 'Kurt Cobain');
INSERT INTO t_integrante (id, nombre) VALUES (43, 'Nate Mendel');

INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (2, 7);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (2, 8);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (2, 9);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (8, 29);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (8, 30);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (8, 31);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (13, 43);
INSERT INTO t_rel_grupo_integrante (cod_grupo, cod_integrante) VALUES (13, 29);


-- Paso 3: Creación de las FK
ALTER TABLE t_rel_grupo_integrante DROP FOREIGN KEY t_rel_grupo_integrante_fk_1;
ALTER TABLE t_rel_grupo_integrante DROP FOREIGN KEY t_rel_grupo_integrante_fk_2;
ALTER TABLE t_rel_grupo_integrante ADD CONSTRAINT t_rel_grupo_integrante_fk_1 FOREIGN KEY (cod_grupo) REFERENCES t_grupo (id);
ALTER TABLE t_rel_grupo_integrante ADD CONSTRAINT t_rel_grupo_integrante_fk_2 FOREIGN KEY (cod_integrante) REFERENCES t_integrante (id);