DROP DATABASE IF EXISTS db_bandas_de_rockNM;
CREATE DATABASE IF NOT EXISTS db_bandas_de_rockNM;
USE db_bandas_de_rockNM;

DROP TABLE IF EXISTS t_grupo;
CREATE TABLE IF NOT EXISTS t_grupo (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS t_integrante;
CREATE TABLE IF NOT EXISTS t_integrante (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS t_integrante;
CREATE TABLE IF NOT EXISTS t_integrante (
  cod_grupo int,
  cod_integrante int,
  PRIMARY KEY (cod_grupo, cod_integrante)
);

INSERT INTO t_grupo (id, nombre) VALUES (1, 'ColdPlay');
INSERT INTO t_grupo (id, nombre) VALUES (2, 'Depeche Mode');
INSERT INTO t_grupo (id, nombre) VALUES (3, 'El arrebato');
INSERT INTO t_grupo (id, nombre) VALUES (4, 'Green Day');
INSERT INTO t_grupo (id, nombre) VALUES (5, 'HB');
INSERT INTO t_grupo (id, nombre) VALUES (6, 'Linkin Park');
INSERT INTO t_grupo (id, nombre) VALUES (7, 'Marea');
INSERT INTO t_grupo (id, nombre) VALUES (8, 'Nirvana');
INSERT INTO t_grupo (id, nombre) VALUES (9, 'One Direction');
INSERT INTO t_grupo (id, nombre) VALUES (10, 'Tenacious D');
INSERT INTO t_grupo (id, nombre) VALUES (11, 'The Police');
INSERT INTO t_grupo (id, nombre) VALUES (12, 'xxxtentacion');



INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (1, 'Jonny Buckland', 1);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (2, 'Chris Martin', 1);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (3, 'Guy Berryman', 1);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (4, 'Phil Harvey', 1);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (5, 'Will Champion', 1);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (6, 'Alan Wilder', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (7, 'Andrew Fletcher', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (8, 'Dave Gahan', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (9, 'Martin Gore', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (10, 'Vince Clarke', 2);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (11, 'Francisco Javier Labandón Pérez', 3);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (12, 'Billie Joe Armstrong', 4);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (13, 'Mike Dirnt', 4);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (14, 'Tré Cool', 4);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (15, 'Charlie', 5);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (16, 'Nasta', 5);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (17, 'Roca', 5);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (18, 'Brad Delson', 6);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (19, 'Colin Brittain', 6);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (20, 'Dave Farrell', 6);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (21, 'Emily Armstrong', 6);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (22, 'Joe Hahn', 6);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (23, 'Mike Shinoda', 6);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (24, 'Alén Ayerdi', 7);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (25, 'César Ramallo', 7);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (26, 'Edu Beaumont “Piñas”', 7);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (27, 'Kolibrí Díaz', 7);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (28, 'Kutxi Romero', 7);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (29, 'Dave Gröhl', 8);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (30, 'Krist Novoselic', 8);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (31, 'Kurt Cobain', 8);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (32, 'Harry Styles', 9);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (33, 'Liam Payne', 9);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (34, 'Louis Tomlinson', 9);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (35, 'Niall Horan', 9);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (36, 'Zayn Malik', 9);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (37, 'Jack Black', 10);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (38, 'Kyle Gass', 10);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (39, 'Andy Summers', 11);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (40, 'Stewart Copeland', 11);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (41, 'Sting', 11);
INSERT INTO t_integrante (id, nombre, cod_grupo) VALUES (42, 'Jahseh Dwayne Ricardo Onfroy', 12);
