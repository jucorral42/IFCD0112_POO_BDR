DROP Database IF EXISTS db_empresa;
CREATE TABLE IF NOT EXISTS db_empresa;
Use db_empresa;


-- -------------------------------------------------


-- ALTER TABLE t_ventas DROP FOREIGN KEY  t_ventas_fk_1;


-- ----------------------------------------------

DROP TABLE IF EXISTS t_empleado;
DROP TABLE IF EXISTS t_ventas;


-- -----------------------------------------------


CREATE TABLE IF NOT EXISTS t_empleado 
(
    id int not NULL AUTO_INCREMENT,
    first_name varchar(50),
    surname varchar(50),
PRIMARY KEY (id)
);

CREATE TABLE if NOT EXISTS t_ventas
(
    id INT NOT NULL AUTO_INCREMENT,
    producto VARCHAR(50),
    cod_empleado int NOT NULL,
    PRIMARY KEY (id)
);


-- ----------------------------------------------

ALTER TABLE t_ventas ADD CONSTRAINT t_ventas_fk_1 FOREIGN KEY (cod_empleado) REFERENCES t_empleado(id);
