-- Crear base de datos
DROP DATABASE IF EXISTS db_bandas;
CREATE DATABASE db_bandas;
USE db_bandas;

-- Tabla de bandas
CREATE TABLE t_banda (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);



-- Tabla de instrumentos
CREATE TABLE t_instrumento (
  id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Tabla musico
CREATE TABLE t_musico (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  cod_instrumento INT,
  FOREIGN KEY (cod_instrumento) REFERENCES t_instrumento(id)
);



-- Tabla relación M:N entre bandas y músicos
CREATE TABLE t_banda_musico (
  cod_grupo INT,
  cod_miembro INT,
  PRIMARY KEY (cod_grupo, cod_miembro),
  FOREIGN KEY (cod_grupo) REFERENCES t_banda(id),
  FOREIGN KEY (cod_miembro) REFERENCES t_musico(id)
);

-- Insertar bandas
INSERT INTO t_banda (id, nombre) VALUES
(1, 'ColdPlay'),
(2, 'Depeche Mode');

-- Insertar músicos
INSERT INTO t_musico (id, nombre) VALUES
(1, 'Jonny Buckland'),
(2, 'Chris Martin'),
(3, 'Guy Berryman'),
(4, 'Phil Harvey'),
(5, 'Will Champion'),
(6, 'Alan Wilder'),
(7, 'Andrew Fletcher'),
(8, 'Dave Gahan'),
(9, 'Martin Gore'),
(10, 'Vince Clarke');

-- Insertar instrumentos
INSERT INTO t_instrumento (id, nombre) VALUES
(1, 'guitarra'),
(2, 'cantante');

-- Asignar instrumentos a músicos
UPDATE t_musico SET cod_instrumento = 1 WHERE id IN (1, 3, 4, 6, 7, 9, 10); -- guitarristas
UPDATE t_musico SET cod_instrumento = 2 WHERE id IN (2, 5, 8);               -- cantantes

-- Relacionar músicos con bandas
INSERT INTO t_banda_musico (cod_grupo, cod_miembro) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(1, 10); -- Vince Clarke también toca en ColdPlay
