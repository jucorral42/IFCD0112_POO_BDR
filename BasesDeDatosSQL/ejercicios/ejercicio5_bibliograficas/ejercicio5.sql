-- --------------------------------------------------------
-- Base de datos: `db_bibliografica`
-- --------------------------------------------------------

DROP DATABASE IF EXISTS db_bibliografica;
CREATE DATABASE db_bibliografica;
USE db_bibliografica;

-- Limpieza previa
DROP TABLE IF EXISTS t_articulos_referencias;
DROP TABLE IF EXISTS t_autor_articulo;
DROP TABLE IF EXISTS t_referencias_formato;
DROP TABLE IF EXISTS t_referencias;
DROP TABLE IF EXISTS t_tipo_publicacion;
DROP TABLE IF EXISTS t_articulos;
DROP TABLE IF EXISTS t_autor;

-- --------------------------------------------------------
-- Tabla: t_articulos
-- --------------------------------------------------------
CREATE TABLE t_articulos (
  id_articulo INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(255) NOT NULL,
  fecha_publicacion DATE DEFAULT CURRENT_DATE
);

-- --------------------------------------------------------
-- Tabla: t_autor
-- --------------------------------------------------------
CREATE TABLE t_autor (
  id_autor INT PRIMARY KEY AUTO_INCREMENT,
  apellidos VARCHAR(255) NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  tipo_autor ENUM('Empleado', 'Colaborador') DEFAULT 'Colaborador'
);

-- --------------------------------------------------------
-- Tabla: t_tipo_publicacion
-- --------------------------------------------------------
CREATE TABLE t_tipo_publicacion (
  id_tipo_publicacion INT PRIMARY KEY AUTO_INCREMENT,
  tipo_publicacion VARCHAR(50) NOT NULL
);

-- --------------------------------------------------------
-- Tabla: t_referencias
-- --------------------------------------------------------
CREATE TABLE t_referencias (
  id_referencia INT PRIMARY KEY AUTO_INCREMENT,
  cod_articulo INT NOT NULL,
  fecha_publicacion DATE NOT NULL,
  cod_tipo_publicacion INT DEFAULT 1,
  n_paginas VARCHAR(20) DEFAULT NULL
);

-- --------------------------------------------------------
-- Tabla: t_referencias_formato
-- --------------------------------------------------------
CREATE TABLE t_referencias_formato (
  id_referencia INT NOT NULL,
  formato ENUM('APA', 'Chicago', 'IEEE', 'ISO690') NOT NULL,
  texto VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_referencia, formato)
);

-- --------------------------------------------------------
-- Tabla: t_autor_articulo
-- --------------------------------------------------------
CREATE TABLE t_autor_articulo (
  cod_articulo INT NOT NULL,
  cod_autor INT NOT NULL,
  PRIMARY KEY (cod_articulo, cod_autor)
);

-- --------------------------------------------------------
-- Tabla: t_articulos_referencias
-- --------------------------------------------------------
CREATE TABLE t_articulos_referencias (
  cod_articulo INT NOT NULL,
  cod_referencia INT NOT NULL,
  orden INT NOT NULL,
  PRIMARY KEY (cod_articulo, cod_referencia)
);

-- --------------------------------------------------------
-- Foreign Keys
-- --------------------------------------------------------
ALTER TABLE t_referencias
  ADD CONSTRAINT fk_referencias_tipo FOREIGN KEY (cod_tipo_publicacion) REFERENCES t_tipo_publicacion(id_tipo_publicacion),
  ADD CONSTRAINT fk_referencias_articulo FOREIGN KEY (cod_articulo) REFERENCES t_articulos(id_articulo);

ALTER TABLE t_referencias_formato
  ADD CONSTRAINT fk_ref_formato_ref FOREIGN KEY (id_referencia) REFERENCES t_referencias(id_referencia);

ALTER TABLE t_autor_articulo
  ADD CONSTRAINT fk_autor_articulo_articulo FOREIGN KEY (cod_articulo) REFERENCES t_articulos(id_articulo),
  ADD CONSTRAINT fk_autor_articulo_autor FOREIGN KEY (cod_autor) REFERENCES t_autor(id_autor);

ALTER TABLE t_articulos_referencias
  ADD CONSTRAINT fk_articulos_referencias_articulo FOREIGN KEY (cod_articulo) REFERENCES t_articulos(id_articulo),
  ADD CONSTRAINT fk_articulos_referencias_referencia FOREIGN KEY (cod_referencia) REFERENCES t_referencias(id_referencia);

-- --------------------------------------------------------
-- Vista: v_articulos_referencias
-- --------------------------------------------------------
CREATE OR REPLACE VIEW v_articulos_referencias AS
SELECT
  a.id_articulo,
  a.titulo AS articulo,
  GROUP_CONCAT(CONCAT(au.nombre, ' ', au.apellidos) SEPARATOR ', ') AS autor,
  r.fecha_publicacion AS fecha_referencia,
  r.n_paginas AS rango_paginas,
  CONCAT('Ref. ', r.id_referencia, ' (', tp.tipo_publicacion, ')') AS obra_referenciada
FROM t_articulos a
JOIN t_autor_articulo aa ON a.id_articulo = aa.cod_articulo
JOIN t_autor au ON aa.cod_autor = au.id_autor
JOIN t_articulos_referencias ar ON a.id_articulo = ar.cod_articulo
JOIN t_referencias r ON ar.cod_referencia = r.id_referencia
JOIN t_tipo_publicacion tp ON r.cod_tipo_publicacion = tp.id_tipo_publicacion
GROUP BY a.id_articulo, r.id_referencia;

-- --------------------------------------------------------
-- Inserciones de ejemplo
-- --------------------------------------------------------

INSERT INTO t_articulos (id_articulo, titulo, fecha_publicacion) VALUES
(1, 'Estudio sobre el cambio climático global', '2025-01-10'),
(2, 'Avances en inteligencia artificial para la medicina', '2025-02-15'),
(3, 'Impacto de los microplásticos en la biodiversidad marina', '2025-03-20'),
(4, 'Eficiencia energética en celdas fotovoltaicas', '2025-04-05'),
(5, 'Desarrollo de vacunas de ARNm', '2025-05-12'),
(6, 'Exploración del genoma humano', '2025-06-18'),
(7, 'Nuevas teorías sobre la materia oscura', '2025-07-25'),
(8, 'Ciberseguridad en sistemas críticos', '2025-08-14'),
(9, 'Aplicaciones del blockchain en la ciencia', '2025-09-01'),
(10, 'El papel de la neurociencia en la educación', '2025-10-10');

INSERT INTO t_autor (id_autor, apellidos, nombre, tipo_autor) VALUES
(1, 'García', 'Juan', 'Empleado'),
(2, 'Martínez', 'Ana', 'Colaborador'),
(3, 'Lopez', 'Carlos', 'Colaborador'),
(4, 'Fernández', 'Lucía', 'Empleado'),
(5, 'González', 'Pedro', 'Colaborador'),
(6, 'Hernández', 'Sofía', 'Empleado'),
(7, 'Rodríguez', 'Luis', 'Colaborador'),
(8, 'Pérez', 'Laura', 'Empleado'),
(9, 'Sánchez', 'Alberto', 'Colaborador'),
(10, 'Ramírez', 'Marta', 'Empleado');

INSERT INTO t_tipo_publicacion (id_tipo_publicacion, tipo_publicacion) VALUES
(1, 'Fines Promocionales'),
(2, 'Pago Comisión'),
(3, 'Exclusividad');

INSERT INTO t_referencias (id_referencia, cod_articulo, fecha_publicacion, cod_tipo_publicacion, n_paginas) VALUES
(100, 2, '2025-01-10', 1, '78-100'),
(105, 3, '2025-02-17', 1, '178-200'),
(110, 4, '2024-05-12', 2, '15-50'),
(115, 5, '2023-03-01', 1, '1-20'),
(120, 6, '2022-08-24', 3, '300-320'),
(125, 7, '2021-12-01', 3, '50-80'),
(130, 8, '2020-11-10', 2, '90-130'),
(135, 9, '2019-10-02', 1, '200-250'),
(140, 10, '2023-02-15', 2, '50-90'),
(145, 1, '2025-03-20', 1, '100-120');

INSERT INTO t_autor_articulo (cod_articulo, cod_autor) VALUES
(1, 1), (1, 2), (2, 3), (3, 5), (4, 7), (5, 9), (6, 6), (7, 8), (8, 10), (9, 4), (10, 1);

INSERT INTO t_articulos_referencias (cod_articulo, cod_referencia, orden) VALUES
(1, 100, 1), (1, 105, 2), (2, 110, 1), (3, 115, 1), (4, 120, 1),
(5, 125, 1), (6, 130, 1), (7, 135, 1), (8, 140, 1), (9, 145, 1);
