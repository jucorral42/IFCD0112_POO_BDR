DROP	DATABASE IF EXISTS db_empleado_movil;
CREATE DATABASE if NOT EXISTS db_empleado_movil;
USE db_empleado_movil;

DROP TABLE if EXISTS t_empleado;
DROP TABLE if EXISTS t_movil;

CREATE TABLE if NOT EXISTS t_empleado(
dni VARCHAR (9) NOT NULL PRIMARY KEY,
first_name VARCHAR (50) NOT NULL,
second_name VARCHAR (50),
lastname VARCHAR (50) NOT NULL,
email VARCHAR (50),
cod_phone_number INT UNIQUE NOT NULL
);

CREATE TABLE if NOT EXISTS t_phone(
phone_number INT NOT NULL PRIMARY KEY,
prefix VARCHAR (3) NOT NULL,
cod_dni VARCHAR (9) UNIQUE,
in_use BOOLEAN NOT NULL,
);

ALTER TABLE t_empleado add CONSTRAINT fk_empleado_01 FOREIGN KEY (cod_phone_number) REFERENCES t_phone(phone_number); 


