
--
-- Base de datos: `db_bibliografica`
--
-- --------------------------------------------------------
DROP DATABASE IF EXISTS db_bibliografica;
CREATE DATABASE db_bibliografica;
USE db_bibliografica;

DROP TABLE IF EXISTS t_articulos;
DROP TABLE IF EXISTS t_articulos_referencias;
DROP TABLE IF EXISTS t_autor;
DROP TABLE IF EXISTS t_autor_articulo;
/* DROP TABLE IF EXISTS */

--
-- Estructura de tabla para la tabla `t_articulos`
--

CREATE TABLE t_articulos (
  id_articulo INT  primary key NOT NULL AUTO_INCREMENT ,
  titulo VARCHAR(255) NOT NULL,
  fecha_publicacion date DEFAULT CURRENT_DATE 
);


CREATE TABLE t_autor (
  id_autor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  apellidos VARCHAR (255) NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  tipo_autor ENUM ('Empleado','Colaborador') DEFAULT 'Colaborador'
);


CREATE TABLE t_tipo_publicacion (
  id_tipo_publicacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  tipo_publicacion VARCHAR(20) NOT NULL
);



CREATE TABLE t_referencias (
  id_referencia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cod_articulo INT NOT NULL,
  fecha_publicacion date NOT NULL,
  cod_tipo_publicacion INT DEFAULT 1,
  n_paginas VARCHAR(20) DEFAULT NULL,
  txt_apa VARCHAR(255) DEFAULT NULL,
  txt_chicago VARCHAR(255) DEFAULT NULL,
  txt_ieee VARCHAR(255) DEFAULT NULL,
  txt_iso690 VARCHAR(255) DEFAULT NULL
);


  

CREATE TABLE t_autor_articulo (
  cod_articulo INT NOT NULL,
  cod_autor INT NOT NULL,
  PRIMARY KEY (cod_articulo,cod_autor)
);



CREATE TABLE t_articulos_referencias (
  cod_articulo INT NOT NULL,
  cod_referencias INT NOT NULL,
  orden INT NOT NULL,
  primary key (cod_articulo,cod_referencias)
);  





/*CREATE VIEW v_articulos_refencias (
id_articulo INT,
articulo VARCHAR (255),
autor VARCHAR(511),
fecha_referencia DATE,
rango_paginas VARCHAR(20),
obra_referenciada VARCHAR(255),
ADD PRIMARY KEY (id_articulo,id_referencia)
);*/


INSERT INTO t_articulos( id_articulo, titulo, fecha_publicacion) VALUES
(1, 'Estudio sobre el cambio climático global', '2025-01-10'),
(2, 'Avances en inteligencia artificial para la medicina', '2025-02-15'),
(3, 'Impacto de los microplásticos en la biodiversidad marina', '2025-03-20'),
(4, 'Eficiencia energética en celdas fotovoltaicas', '2025-04-05'),
(5, 'Desarrollo de vacunas de ARNm', '2025-05-12'),
(6, 'Exploración del genoma humano', '2025-06-18'),
(7, 'Nuevas teorías sobre la materia oscura', '2025-07-25'),
(8, 'Ciberseguridad en sistemas críticos', '2025-08-14'),
(9, 'Aplicaciones del blockchain en la ciencia', '2025-09-01'),
(10, 'El papel de la neurociencia en la educación', '2025-10-10'),
(11, 'Robótica avanzada para exploración espacial', '2025-11-22'),
(12, 'Ingeniería genética en cultivos resistentes', '2025-12-30'),
(13, 'Big Data en investigación epidemiológica', '2025-03-15'),
(14, 'Técnicas de edición genética CRISPR', '2025-04-28'),
(15, 'Impacto del deshi elo ártico en corrientes oceánicas', '2025-06-09'),
(16, 'Nanotecnología en biomedicina', '2025-07-02'),
(17, 'Comparación de métodos de energía renovable', '2025-08-19'),
(18, 'Impacto de la inteligencia artificial en las ciencias sociales', '2025-09-24'),
(19, 'Estudio sobre el comportamiento de bacterias resistentes', '2025-10-30'),
(20, 'Avances en dispositivos de energía sostenible', '2025-11-11');


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
(10, 'Ramírez', 'Marta', 'Empleado'),
(11, 'Torres', 'Javier', 'Colaborador'),
(12, 'Delgado', 'Paula', 'Empleado'),
(13, 'Ortiz', 'Diego', 'Colaborador'),
(14, 'Moreno', 'Elena', 'Colaborador'),
(15, 'Alonso', 'José', 'Empleado'),
(16, 'Castro', 'María', 'Colaborador'),
(17, 'Rubio', 'Miguel', 'Empleado'),
(18, 'Vega', 'Clara', 'Empleado'),
(19, 'Fuentes', 'Ricardo', 'Colaborador'),
(20, 'Navarro', 'Carmen', 'Empleado');

INSERT INTO t_referencias (id_referencia, cod_articulo, fecha_publicacion, cod_tipo_publicacion, n_paginas, txt_apa, txt_chicago, txt_ieee, txt_iso690) VALUES
(100, 2, '2025-01-10', 1, '78 - 100', NULL, NULL, NULL, NULL),
(105, 3, '2025-02-17', 1, '178 - 200', NULL, NULL, NULL, NULL),
(110, 4, '2024-05-12', 2, '15 - 50', NULL, NULL, NULL, NULL),
(115, 5, '2023-03-01', 1, '1 - 20', NULL, NULL, NULL, NULL),
(120, 6, '2022-08-24', 3, '300 - 320', NULL, NULL, NULL, NULL),
(125, 7, '2021-12-01', 3, '50 - 80', NULL, NULL, NULL, NULL),
(130, 8, '2020-11-10', 2, '90 - 130', NULL, NULL, NULL, NULL),
(135, 9, '2019-10-02', 1, '200 - 250', NULL, NULL, NULL, NULL),
(140, 10, '2023-02-15', 2, '50 - 90', NULL, NULL, NULL, NULL),
(145, 1, '2025-03-20', 1, '100 - 120', NULL, NULL, NULL, NULL); 

INSERT INTO t_autor_articulo (cod_articulo, cod_autor) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(6, 11),
(6, 12),
(7, 13),
(8, 15),
(9, 17),
(10, 19),
(10, 20),
(11, 1),
(11, 3),
(12, 2),
(12, 4),
(13, 5),
(14, 7),
(14, 8),
(15, 9),
(15, 10),
(16, 11),
(16, 12),
(17, 13),
(18, 15),
(19, 17),
(20, 19);

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `t_articulos_referencias`
--


INSERT INTO t_tipo_publicacion (id_tipo_publicacion, tipo_publicacion) VALUES
(1, 'Fines Promocionales'),
(2, 'Pago Comisión'),
(3, 'Exclusividad');

INSERT INTO t_articulos_referencias (cod_articulo, cod_referencias, orden) VALUES
(1, 100, 1),
(1, 105, 2),
(2, 110, 1),
(3, 115, 1),
(4, 120, 1),
(5, 125, 1),
(6, 130, 1),
(7, 135, 1),
(8, 140, 1),
(9, 145, 1);

-- -------------------------------------------------------


ALTER TABLE t_referencias
  ADD CONSTRAINT t_referencias_fk1 FOREIGN KEY (cod_tipo_publicacion) REFERENCES t_tipo_publicacion (id_tipo_publicacion),
  ADD CONSTRAINT t_referencias_fk2 FOREIGN KEY (cod_articulo) REFERENCES t_articulos (id_articulo);

ALTER TABLE t_autor_articulo
  ADD CONSTRAINT t_autor_articulo_fk1 FOREIGN KEY (cod_articulo) REFERENCES t_articulos (id_articulo),
  ADD CONSTRAINT t_autor_articulo_fk2 FOREIGN KEY (cod_autor) REFERENCES t_autor (id_autor);

ALTER TABLE t_articulos_referencias
  ADD CONSTRAINT t_articulos_referencias_fk1 FOREIGN KEY (cod_articulo) REFERENCES t_articulos (id_articulo),
  ADD CONSTRAINT t_articulos_referencias_fk2 FOREIGN KEY (cod_referencias) REFERENCES t_referencias (id_referencia);