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
    cod_boss int,    
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

CREATE TABLE if NOT EXISTS t_empleado_departamento
(
    cod_departament  INT,
    cod_employee INT,
    PRIMARY KEY (cod_departament,cod_employee)
);


-- ----------------------------------------------

ALTER TABLE t_empleado ADD CONSTRAINT t_empleado_fk1 FOREIGN KEY (cod_sede) REFERENCES t_sede(id);
ALTER TABLE t_empleado ADD CONSTRAINT t_empleado_fk2 FOREIGN KEY (cod_boss) REFERENCES t_empleado(id);
ALTER TABLE t_departamento ADD CONSTRAINT t_departamento_fk1 FOREIGN KEY (cod_director) REFERENCES t_empleado(id);
ALTER TABLE t_empleado_departamento ADD CONSTRAINT t_empleado_departamento_fk1 FOREIGN KEY (cod_departament) REFERENCES t_departamento(id);
ALTER TABLE t_empleado_departamento ADD CONSTRAINT t_empleado_departamento_fk2 FOREIGN KEY (cod_employee) REFERENCES t_empleado(id);



-- Inserts --
USE db_em_se_de;

-- Sedes
INSERT INTO t_sede (adress) VALUES ('Madrid');
INSERT INTO t_sede (adress) VALUES ('Barcelona');

-- Directores/jefes
INSERT INTO t_empleado (first_name, surname, cod_sede, cod_boss)
VALUES ('Carlos', 'GranJefe', 1, NULL);  -- no tiene jefe

INSERT INTO t_empleado (first_name, surname, cod_sede, cod_boss)
VALUES ('Ana', 'JefaMarketing', 2, 1);  -- su jefe es Carlos

-- Empleados
INSERT INTO t_empleado (first_name, surname, cod_sede, cod_boss)
VALUES ('Luis', 'EmpleadoVentas', 1, 1);  -- jefe Carlos

INSERT INTO t_empleado (first_name, surname, cod_sede, cod_boss)
VALUES ('Pedro', 'EmpleadoMarketing', 2, 2);  -- jefe Ana

INSERT INTO t_empleado (first_name, surname, cod_sede, cod_boss)
VALUES ('Sonia', 'SinJefe', 2, NULL);  -- no jefe

-- Departamentos
INSERT INTO t_departamento (departament, cod_director) VALUES ('Ventas', 1);
INSERT INTO t_departamento (departament, cod_director) VALUES ('Marketing', 2);

-- Relaciones empleados-departamentos
INSERT INTO t_empleado_departamento (cod_departament, cod_employee) VALUES (1, 1); -- Carlos → Ventas
INSERT INTO t_empleado_departamento (cod_departament, cod_employee) VALUES (1, 3); -- Luis → Ventas

INSERT INTO t_empleado_departamento (cod_departament, cod_employee) VALUES (2, 2); -- Ana → Marketing
INSERT INTO t_empleado_departamento (cod_departament, cod_employee) VALUES (2, 4); -- Pedro → Marketing
INSERT INTO t_empleado_departamento (cod_departament, cod_employee) VALUES (2, 5); -- Sonia → Marketing


-- Consulta 1 --
SELECT e.id, e.first_name, e.surname, s.adress AS sede
FROM t_empleado e
JOIN t_sede s ON e.cod_sede = s.id
ORDER BY e.id;


-- Consulta 2 --

SELECT e.id, e.first_name, e.surname,
       j.first_name AS jefe_first_name, j.surname AS jefe_surname
FROM t_empleado e
LEFT JOIN t_empleado j ON e.cod_boss = j.id
ORDER BY e.id;
