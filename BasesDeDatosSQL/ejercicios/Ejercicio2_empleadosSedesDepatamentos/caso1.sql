DROP DATABASE if EXISTS db_em_se_de;
CREATE DATABASE if NOT EXISTS db_em_se_de;
USE db_em_se_de;


-- -------------------------------------------------


-- ALTER TABLE t_ventas DROP FOREIGN KEY  t_ventas_fk_1;


-- ----------------------------------------------

DROP table if exists t_empleado;
DROP TABLE IF EXISTS t_sede;
DROP TABLE IF EXISTS t_departamento;


-- -----------------------------------------------


create table IF NOT EXISTS t_empleado 
(
    id int not NULL AUTO_INCREMENT,
    first_name varchar(50),
    surname varchar(50), 
    cod_sede INT,
    cod_departament INT ,    
	 PRIMARY KEY (id)
);

CREATE TABLE if NOT EXISTS t_sede
(
    id INT NOT NULL AUTO_INCREMENT,
    adress VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE if NOT EXISTS t_departamento
(
    id INT NOT NULL AUTO_INCREMENT,
    departament VARCHAR(50),
    cod_director int UNIQUE,
    PRIMARY KEY (id)
);



-- ----------------------------------------------

ALTER TABLE t_empleado ADD CONSTRAINT t_empleado_fk1 FOREIGN KEY (cod_sede) REFERENCES t_sede(id);
ALTER TABLE t_empleado ADD CONSTRAINT t_empleado_fk2 FOREIGN KEY (cod_departament) REFERENCES t_departamento(id);
ALTER TABLE t_departamento ADD CONSTRAINT t_departamento_fk1 FOREIGN KEY (cod_director) REFERENCES t_empleado(id);


USE db_em_se_de;

-- Sedes
INSERT INTO t_sede (adress) VALUES ('Madrid');
INSERT INTO t_sede (adress) VALUES ('Barcelona');

-- Gran jefe (director de Ventas)
INSERT INTO t_empleado (first_name, surname, cod_sede, cod_departament)
VALUES ('Carlos', 'GranJefe', 1, NULL);

-- Empleados sin departamento
INSERT INTO t_empleado (first_name, surname, cod_sede, cod_departament)
VALUES ('Pedro', 'SinDepto', 2, NULL);

-- Empleados que estarán en departamentos
INSERT INTO t_empleado (first_name, surname, cod_sede, cod_departament)
VALUES ('Luis', 'EmpleadoVentas', 1, NULL);
INSERT INTO t_empleado (first_name, surname, cod_sede, cod_departament)
VALUES ('Ana', 'EmpleadoMarketing', 2, NULL);

-- Crear departamentos y asignar director
INSERT INTO t_departamento (departament, cod_director) VALUES ('Ventas', 1); -- Carlos director
INSERT INTO t_departamento (departament, cod_director) VALUES ('Marketing', 4); -- Ana directora

-- Asignar empleados a departamentos
UPDATE t_empleado SET cod_departament = 1 WHERE id = 3; -- Luis en Ventas
UPDATE t_empleado SET cod_departament = 2 WHERE id = 4; -- Ana en Marketing

-- Primera consulta --
SELECT e.id, e.first_name, e.surname, s.adress AS sede
FROM t_empleado e
JOIN t_sede s ON e.cod_sede = s.id
ORDER BY e.id;

-- Segunda consulta --
SELECT e.id, e.first_name, e.surname,
       j.first_name AS jefe_first_name, j.surname AS jefe_surname
FROM t_empleado e
LEFT JOIN t_departamento d ON e.cod_departament = d.id
LEFT JOIN t_empleado j ON d.cod_director = j.id
ORDER BY e.id;
