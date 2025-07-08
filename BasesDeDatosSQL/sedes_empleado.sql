
-- Paso 2: Creación de las tablas con sus datos

CREATE TABLE t_sede (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE t_empleado (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  

  PRIMARY KEY (id)
  
);

INSERT INTO t_sede (id, nombre) VALUES (1, 'Madrid');
INSERT INTO t_sede (id, nombre) VALUES (2, 'Bilbao');
INSERT INTO t_sede (id, nombre) VALUES (3, 'Sevilla');

INSERT INTO t_empleado (id, nombre) VALUES (1, 'Ana');
INSERT INTO t_empleado (id, nombre) VALUES (2, 'Lidia');

-- Paso 3: Creación de las PK y FK

-- Paso 4: Consultas

SELECT * FROM t_sede, t_empleado;

SELECT t_sede.id, t_empleado.id FROM t_sede, t_empleado;
SELECT t_sede.nombre, t_empleado.nombre FROM t_sede, t_empleado WHERE t_empleado.cod_sede = t_sede.id;
CREATE VIEW v_empleado AS SELECT t_empleado.id, t_empleado.nombre AS `Empleado`, t_sede.nombre AS `Sede` FROM t_sede, t_empleado WHERE t_empleado.cod_sede = t_sede.id;

SELECT * FROM v_empleado;
