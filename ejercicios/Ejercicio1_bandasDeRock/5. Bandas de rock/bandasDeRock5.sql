-- Eliminar y crear la base de datos
DROP DATABASE IF EXISTS db_bandas5;
CREATE DATABASE db_bandas5;
USE db_bandas5;

-- Tabla de bandas
CREATE TABLE t_banda (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  nombre VARCHAR(100) NOT NULL
);

-- Tabla de músicos
CREATE TABLE t_musico (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

-- Tabla de instrumentos
CREATE TABLE t_instrumento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Tabla de roles
CREATE TABLE t_rol (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Tabla de participación (sin restricciones únicas adicionales)
CREATE TABLE t_participacion (
  id_banda INT,
  id_musico INT,
  id_instrumento INT,
  id_rol INT,
  UNIQUE (id_banda, id_musico, id_instrumento, id_rol),
  FOREIGN KEY (id_banda) REFERENCES t_banda(id),
  FOREIGN KEY (id_musico) REFERENCES t_musico(id),
  FOREIGN KEY (id_instrumento) REFERENCES t_instrumento(id),
  FOREIGN KEY (id_rol) REFERENCES t_rol(id)
);


-- Insertar bandas
INSERT INTO t_banda (id, nombre) VALUES
(1, 'Metallica'),
(2, 'Nirvana'),
(3, 'Foo Fighters');

-- Insertar músicos
INSERT INTO t_musico (id, nombre) VALUES
(1, 'James Hetfield'),
(2, 'Dave Grohl');

-- Insertar instrumentos
INSERT INTO t_instrumento (id, nombre) VALUES
(1, 'guitarra'),
(2, 'batería'),
(3, 'voz');

-- Insertar roles
INSERT INTO t_rol (id, nombre) VALUES
(1, 'guitarrista'),
(2, 'baterista'),
(3, 'cantante');

-- Participaciones

-- James Hetfield en Metallica: cantante y guitarrista
INSERT INTO t_participacion (id_banda, id_musico, id_instrumento, id_rol) VALUES
(1, 1, 1, 1), -- guitarra, guitarrista
(1, 1, 3, 3); -- voz, cantante

-- Dave Grohl en Nirvana: baterista
INSERT INTO t_participacion (id_banda, id_musico, id_instrumento, id_rol) VALUES
(2, 2, 2, 2); -- batería, baterista

-- Dave Grohl en Foo Fighters: cantante y guitarrista
INSERT INTO t_participacion (id_banda, id_musico, id_instrumento, id_rol) VALUES
(3, 2, 3, 3), -- voz, cantante
--(3, 2, 3, 3), prueba duplicado
(3, 2, 1, 1); -- guitarra, guitarrista
