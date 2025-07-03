-- Eliminar y crear la base de datos
DROP DATABASE IF EXISTS db_bandas;
CREATE DATABASE db_bandas;
USE db_bandas;

-- Tabla de grupos (bandas)
CREATE TABLE t_grupo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

-- Tabla de músicos/integrantes
CREATE TABLE t_integrante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

-- Tabla de instrumentos
CREATE TABLE t_instrumento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Tabla de roles (guitarrista, bajista, teclista...)
CREATE TABLE t_rol (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Tabla participación: grupo + integrante + rol (único rol por músico en cada grupo)
CREATE TABLE t_participacion (
  id_grupo INT,
  id_integrante INT,
  id_rol INT,
  PRIMARY KEY (id_grupo, id_integrante),
  FOREIGN KEY (id_grupo) REFERENCES t_grupo(id),
  FOREIGN KEY (id_integrante) REFERENCES t_integrante(id),
  FOREIGN KEY (id_rol) REFERENCES t_rol(id)
);

-- Tabla que asocia qué instrumentos toca cada músico en cada grupo
CREATE TABLE t_instrumento_integrante (
  id_grupo INT,
  id_integrante INT,
  id_instrumento INT,
  PRIMARY KEY (id_grupo, id_integrante, id_instrumento),
  FOREIGN KEY (id_grupo, id_integrante) REFERENCES t_participacion(id_grupo, id_integrante),
  FOREIGN KEY (id_instrumento) REFERENCES t_instrumento(id)
);

-- Insertar grupos
INSERT INTO t_grupo (nombre) VALUES 
('Nirvana'),
('Coldplay'),
('Foo Fighters');

-- Insertar músicos
INSERT INTO t_integrante (nombre) VALUES 
('Dave Grohl'),
('Chris Martin'),
('Jonny Buckland');

-- Insertar instrumentos
INSERT INTO t_instrumento (nombre) VALUES 
('batería'),
('guitarra'),
('teclado');

-- Insertar roles
INSERT INTO t_rol (nombre) VALUES 
('baterista'),
('guitarrista'),
('teclista');

-- Insertar participaciones

-- Dave Grohl en Nirvana como baterista
INSERT INTO t_participacion (id_grupo, id_integrante, id_rol) VALUES (1, 1, 1);

-- Dave Grohl en Foo Fighters como guitarrista
INSERT INTO t_participacion (id_grupo, id_integrante, id_rol) VALUES (3, 1, 2);

-- Chris Martin en Coldplay como teclista
INSERT INTO t_participacion (id_grupo, id_integrante, id_rol) VALUES (2, 2, 3);

-- Jonny Buckland en Coldplay como guitarrista
INSERT INTO t_participacion (id_grupo, id_integrante, id_rol) VALUES (2, 3, 2);

-- Insertar instrumentos tocados

-- Dave Grohl en Nirvana toca batería y teclado
INSERT INTO t_instrumento_integrante (id_grupo, id_integrante, id_instrumento) VALUES 
(1, 1, 1), -- batería
(1, 1, 3); -- teclado

-- Dave Grohl en Foo Fighters toca guitarra
INSERT INTO t_instrumento_integrante (id_grupo, id_integrante, id_instrumento) VALUES
(3, 1, 2); -- guitarra

-- Chris Martin en Coldplay toca guitarra y teclado
INSERT INTO t_instrumento_integrante (id_grupo, id_integrante, id_instrumento) VALUES
(2, 2, 2), -- guitarra
(2, 2, 3); -- teclado

-- Jonny Buckland en Coldplay toca guitarra
INSERT INTO t_instrumento_integrante (id_grupo, id_integrante, id_instrumento) VALUES
(2, 3, 2);

-- Intento inválido: Insertar instrumento para músico sin participación previa (debe fallar)
-- Por ejemplo, intentar que Dave Grohl toque batería en Coldplay sin tener participación ahí

--INSERT INTO t_instrumento_integrante (id_grupo, id_integrante, id_instrumento) VALUES (2, 1, 1);
-- Esta línea comentada lanzaría error de restricción de clave foránea si la descomentas y ejecutas.

