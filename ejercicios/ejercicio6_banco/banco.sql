DROP DATABASE IF EXISTS db_banco;
CREATE DATABASE IF NOT EXISTS db_banco;
USE db_banco;

-- Eliminamos tablas
DROP TABLE IF EXISTS t_persona;
DROP TABLE IF EXISTS t_ciudad;
DROP TABLE IF EXISTS t_empleado;
DROP TABLE IF EXISTS t_cliente;
DROP TABLE IF EXISTS t_sucursal;
DROP TABLE IF EXISTS t_cuenta;
DROP TABLE IF EXISTS t_cuenta_corriente;
DROP TABLE IF EXISTS t_cuenta_ahorro;
DROP TABLE IF EXISTS t_prestamo;
DROP TABLE IF EXISTS tr_cliente_empleado;
DROP TABLE IF EXISTS tr_cuenta_cliente;
DROP TABLE IF EXISTS tr_devolucion_prestamo;
DROP TABLE IF EXISTS tr_prestamo_cliente;


-- Creamos tablas
CREATE TABLE IF NOT EXISTS t_ciudad
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50)
);

CREATE TABLE IF NOT EXISTS t_persona
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nif varchar(10) NOT NULL,
    direccion VARCHAR(100),
    cod_ciudad INT,
    telefono VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (cod_ciudad) REFERENCES t_ciudad(id)
);


CREATE TABLE IF NOT EXISTS t_sucursal
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_ciudad INT UNIQUE NOT NULL,
    activos DECIMAL (20,2),
    FOREIGN KEY (cod_ciudad) REFERENCES t_ciudad(id)
);

CREATE TABLE IF NOT EXISTS t_empleado
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idEmp VARCHAR(20) NOT NULL UNIQUE,
    cod_persona INT NOT NULL UNIQUE,
    cod_jefe VARCHAR(20) NULL,
    incorporacion DATE DEFAULT (CURRENT_DATE)
);


CREATE TABLE IF NOT EXISTS t_cliente
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idCli VARCHAR(20) NOT NULL UNIQUE,
    cod_persona INT NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS t_cuenta
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_cuenta INT NOT NULL UNIQUE,
    saldo DECIMAL (20,2) DEFAULT 0,
    ultimo_acceso TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tipo_cuenta ENUM ('Cuenta corriente','Cuenta ahorro')
);

CREATE TABLE IF NOT EXISTS t_cuenta_corriente
(
    cod_cuenta INT PRIMARY KEY,
    ultimo_descubierto TIMESTAMP    
);

  
CREATE TABLE IF NOT EXISTS t_cuenta_ahorro
(
    cod_cuenta INT PRIMARY KEY,
    interes_anual DECIMAL (5,2)
    
);


CREATE TABLE IF NOT EXISTS t_prestamo
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_sucursal INT NOT NULL,
    cod_cuenta INT NOT NULL,
    firmado boolean DEFAULT false,
    cod_cliente_firma INT NOT NULL,
    UNIQUE(cod_cuenta,cod_cliente_firma),
    importe_prestado DECIMAL (20,2) NOT NULL,
    importe_pendiente DECIMAL(20,2) NOT NULL
);

CREATE TABLE tr_prestamo_cliente (
    cod_cliente INT NOT NULL,
    cod_prestamo INT NOT NULL,
    PRIMARY KEY (cod_cliente, cod_prestamo),
    FOREIGN KEY (cod_cliente) REFERENCES t_cliente(id)
      ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (cod_prestamo) REFERENCES t_prestamo(id)
      ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS tr_cliente_empleado
(
    id INT NOT NULL,
    cod_cliente INT NOT NULL,
    cod_empleado INT NOT NULL,
    tipo_relacion ENUM ('responsable de prestamos', 'asesor personal') NOT NULL,
    PRIMARY KEY (cod_cliente, cod_empleado, tipo_relacion)
);

  


CREATE TABLE IF NOT EXISTS tr_cuenta_cliente
(
    cod_cliente INT NOT NULL,
    cod_cuenta  INT NOT NULL,
    jerarquia_titulares INT NOT NULL,
    PRIMARY KEY (cod_cliente,cod_cuenta,jerarquia_titulares)
);


CREATE TABLE IF NOT EXISTS tr_devolucion_prestamo
(   
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_prestamo INT NOT NULL,
    importe DECIMAL (10,2),
    pendiente boolean DEFAULT true,
    fecha TIMESTAMP 
);



ALTER TABLE t_empleado
  ADD CONSTRAINT fk_t_empleado_1 FOREIGN KEY (cod_persona) REFERENCES t_persona (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT fk_t_empleado_2 FOREIGN KEY (cod_jefe) REFERENCES t_empleado (idEmp)
    ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE t_cliente
  ADD CONSTRAINT fk_t_cliente_1 FOREIGN KEY (cod_persona) REFERENCES t_persona (id)
    ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE t_cuenta_corriente
  ADD CONSTRAINT fk_t_cuenta_corriente_1 FOREIGN KEY (cod_cuenta) REFERENCES t_cuenta (id)
    ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE t_cuenta_ahorro
  ADD CONSTRAINT fk_t_cuenta_ahorro_1 FOREIGN KEY (cod_cuenta) REFERENCES t_cuenta (id)
    ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE t_prestamo
  ADD CONSTRAINT fk_t_prestamo_1 FOREIGN KEY (cod_sucursal) REFERENCES t_sucursal (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT fk_t_prestamo_2 FOREIGN KEY (cod_cuenta) REFERENCES t_cuenta (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT fk_t_prestamo_3 FOREIGN KEY (cod_cliente_firma) REFERENCES t_cliente (id)
    ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE tr_cliente_empleado
  ADD CONSTRAINT fk_tr_cliente_empleado_1 FOREIGN KEY (cod_cliente) REFERENCES t_cliente (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT fk_tr_cliente_empleado_2 FOREIGN KEY (cod_empleado) REFERENCES t_empleado (id)
    ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE tr_cuenta_cliente
  ADD CONSTRAINT fk_tr_cuenta_cliente_1 FOREIGN KEY (cod_cliente) REFERENCES t_cliente (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT fk_tr_cuenta_cliente_2 FOREIGN KEY (cod_cuenta) REFERENCES t_cuenta (id)
    ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE tr_devolucion_prestamo
  ADD CONSTRAINT fk_tr_devolucion_prestamo_1 FOREIGN KEY (cod_prestamo) REFERENCES t_prestamo (id)
    ON DELETE RESTRICT ON UPDATE CASCADE;




-- Consulta 1

DELIMITER //
CREATE PROCEDURE sp_total_prestamos_por_sucursal(IN sucursal_id INT)
BEGIN
    SELECT 
        s.id AS id_sucursal,
        s.activos,
        SUM(p.importe_prestado) AS total_importe_prestado,
        SUM(p.importe_pendiente) AS total_importe_pendiente,
        COUNT(p.id) AS numero_prestamos
    FROM t_sucursal s
    LEFT JOIN t_prestamo p ON s.id = p.cod_sucursal
    WHERE s.id = sucursal_id
    GROUP BY s.id;
END //
DELIMITER ;


-- Consulta 2

CREATE OR REPLACE VIEW v_total_prestamos_por_sucursal AS
SELECT 
    s.id AS id_sucursal,
    s.activos,
    c.nombre AS ciudad,
    SUM(p.importe_prestado) AS total_importe_prestado,
    SUM(p.importe_pendiente) AS total_importe_pendiente,
    COUNT(p.id) AS numero_prestamos
FROM t_sucursal s
LEFT JOIN t_ciudad c ON s.cod_ciudad = c.id
LEFT JOIN t_prestamo p ON s.id = p.cod_sucursal
GROUP BY s.id;

-- Consulta 3

CREATE OR REPLACE VIEW v_total_prestamos_por_sucursal AS
SELECT 
    s.id AS id_sucursal,
    s.activos,
    c.nombre AS ciudad,
    SUM(p.importe_prestado) AS total_importe_prestado,
    SUM(p.importe_pendiente) AS total_importe_pendiente,
    COUNT(p.id) AS numero_prestamos
FROM t_sucursal s
LEFT JOIN t_ciudad c ON s.cod_ciudad = c.id
LEFT JOIN t_prestamo p ON s.id = p.cod_sucursal
GROUP BY s.id;


-- Consulta 4

DELIMITER //
CREATE PROCEDURE sp_prestamos_por_empleado(IN id_empleado_param INT)
BEGIN
    SELECT 
        e.id AS id_empleado,
        e.idEmp,
        per_emp.nombre AS nombre_empleado,
        per_emp.apellido AS apellido_empleado,
        
        cli.id AS id_cliente,
        cli.idCli,
        per_cli.nombre AS nombre_cliente,
        per_cli.apellido AS apellido_cliente,
        rel.tipo_relacion,

        p.id AS id_prestamo,
        p.cod_cuenta,
        c.numero_cuenta,
        p.importe_prestado,
        p.importe_pendiente,
        p.firmado,
        p.cod_sucursal,
        ciu.nombre AS ciudad_sucursal
    FROM tr_cliente_empleado rel
    JOIN t_empleado e ON rel.cod_empleado = e.id
    JOIN t_persona per_emp ON e.cod_persona = per_emp.id
    JOIN t_cliente cli ON rel.cod_cliente = cli.id
    JOIN t_persona per_cli ON cli.cod_persona = per_cli.id
    JOIN tr_prestamo_cliente pc ON cli.id = pc.cod_cliente
    JOIN t_prestamo p ON pc.cod_prestamo = p.id
    JOIN t_cuenta c ON p.cod_cuenta = c.id
    JOIN t_sucursal s ON p.cod_sucursal = s.id
    LEFT JOIN t_ciudad ciu ON s.cod_ciudad = ciu.id
    WHERE e.id = id_empleado_param
    ORDER BY p.id DESC;
END //
DELIMITER ;


    /*⃣ Si quieres un contador por grupo (categoria), debes calcularlo tú en la inserción, por ejemplo en MySQL:

sql
Copiar
Editar
INSERT INTO ejemplo (categoria, numero)
SELECT 'A', IFNULL(MAX(numero), 0) + 1
FROM ejemplo
WHERE categoria = 'A';
*/


