DROP DATABASE if EXISTS db_fabrica;
CREATE DATABASE if NOT EXISTS db_fabrica;
USE db_fabrica;

DROP TABLE IF EXISTS t_sede;

-- Tablas sencillas


CREATE TABLE if NOT EXISTS t_proveedor
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (50) UNIQUE NOT NULL ,
    direccion VARCHAR(50),
    telefono INT UNIQUE,
    email VARCHAR (50) UNIQUE,
    PRIMARY KEY (id)
);

    CREATE TABLE if NOT EXISTS t_material
    (
        id INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR (50) UNIQUE NOT NULL ,
        descripcion VARCHAR (50),
        unidadbasicademedida ENUM ('g','kg','t') NOT NULL ,
        precio INT, 
        cod_proveedor INT NOT NULL ,
        PRIMARY KEY (id)
    );


CREATE TABLE if NOT EXISTS t_componentes_sencillo
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (50) UNIQUE,
	 descripcion VARCHAR (50),
    stock INT,
	 precio INT,    
    PRIMARY KEY (id)
);

CREATE TABLE if NOT EXISTS t_componentes_compuesto
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR (50),
    stock INT,
    PRIMARY KEY (id)
);


-- TABLAS COMPUESTAS RELACIONES N_M


-- Tabla relacion material/componente_sencillo
CREATE TABLE if NOT EXISTS t_mat_comp_sencillo
(
	 id INT NOT NULL AUTO_INCREMENT UNIQUE,
    cod_componentes_sencillo INT,
    cod_material INT,
    cantidad_material INT,
    PRIMARY KEY (cod_componentes_sencillo,cod_material)
);

-- Tabla relacion componente compuesto/sencillo

CREATE TABLE if NOT EXISTS t_componentes_compuesto_sencillo
(
	 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	 cod_componente_compuesto INT,
	 cod_componente_sencillo INT,
    cantidad INT,	
    UNIQUE (cod_componente_compuesto,cod_componente_sencillo)
);


-- Tabla relacion componente compuesto/compuesto
CREATE TABLE if NOT EXISTS t_componentes_compuesto_compuesto
(
	 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	 cod_componente_compuesto_padre INT,
	 cod_componente_compuesto_hijo INT,
    cantidad INT,	
    UNIQUE (cod_componente_compuesto_padre,cod_componente_compuesto_hijo)
);

CREATE TABLE if NOT EXISTS t_componentes_compuesto_material
(
	 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	 cod_componente_compuesto INT,
	 cod_material INT,
    cantidad INT,	
    UNIQUE (cod_componente_compuesto,cod_material)
);


-- FK

ALTER TABLE t_mat_comp_sencillo ADD CONSTRAINT t_mat_comp_sencillo_fk1 FOREIGN KEY (cod_componentes_sencillo) REFERENCES t_componentes_sencillo(id);
ALTER TABLE t_mat_comp_sencillo ADD CONSTRAINT t_mat_comp_sencillo_fk2 FOREIGN KEY (cod_material) REFERENCES t_material(id);
ALTER TABLE t_material ADD CONSTRAINT t_material_fk1 FOREIGN KEY (cod_proveedor) REFERENCES t_proveedor(id);
ALTER TABLE t_componentes_compuesto_sencillo ADD CONSTRAINT t_componentes_compuesto_sencillo_fk1 FOREIGN KEY (cod_componente_sencillo) REFERENCES t_componentes_sencillo(id);
ALTER TABLE t_componentes_compuesto_sencillo ADD CONSTRAINT t_componentes_compuesto_sencillo_fk2 FOREIGN KEY (cod_componente_compuesto) REFERENCES t_componentes_compuesto(id);
ALTER TABLE t_componentes_compuesto_compuesto ADD CONSTRAINT t_componentes_compuesto_compuesto_fk1 FOREIGN KEY (cod_componente_compuesto_padre) REFERENCES t_componentes_compuesto(id);
ALTER TABLE t_componentes_compuesto_compuesto ADD CONSTRAINT t_componentes_compuesto_compuesto_fk2 FOREIGN KEY (cod_componente_compuesto_hijo) REFERENCES t_componentes_compuesto(id);
ALTER TABLE t_componentes_compuesto_material ADD CONSTRAINT t_componentes_compuesto_material_fk1 FOREIGN KEY (cod_componente_compuesto) REFERENCES t_componentes_compuesto(id);
ALTER TABLE t_componentes_compuesto_material ADD CONSTRAINT t_componentes_compuesto_material_fk2 FOREIGN KEY (cod_material) REFERENCES t_material(id);

-- Views para consultas

-- Necesidades fabricacion componente sencillo

CREATE OR REPLACE VIEW fabricacion_comp_sencillo AS
SELECT
    t_componentes_sencillo.id AS id_componente_sencillo,
    t_componentes_sencillo.nombre AS nombre_componente_sencillo,
    t_material.id AS id_material,
    t_material.nombre AS nombre_material,
    t_material.descripcion,
    t_material.unidadbasicademedida,
    t_mat_comp_sencillo.cantidad_material
FROM
    t_mat_comp_sencillo 
JOIN
    t_componentes_sencillo
    ON t_mat_comp_sencillo.cod_componentes_sencillo = t_componentes_sencillo.id
JOIN
    t_material
    ON t_mat_comp_sencillo.cod_material = t_material.id;
    
-- Necesidades fabricacion componente compuesto

CREATE OR REPLACE VIEW fabricacion_comp_compuesto AS
SELECT
    t_componentes_compuesto.id AS id_componente_compuesto,
	 t_componentes_compuesto.nombre AS nombre_componente_compuesto,
	 t_componentes_compuesto_compuesto.cantidad  AS Cantidad_componente_compuesto,
     t_componentes_sencillo.id AS id_componente_sencillo,
     t_componentes_sencillo.nombre AS nombre_componente_sencillo,
     t_componentes_compuesto_sencillo.cantidad  AS Cantidad_componente_sencillo,
     t_material.id AS id_material,
     t_material.nombre AS nombre_material,
    t_componentes_compuesto_material.cantidad AS Cantidad_material
FROM
    t_componentes_compuesto
LEFT JOIN
    t_componentes_compuesto_compuesto
    ON t_componentes_compuesto_compuesto.cod_componente_compuesto_padre = t_componentes_compuesto.id
LEFT JOIN
    t_componentes_compuesto_sencillo
    ON t_componentes_compuesto_sencillo.cod_componente_compuesto = t_componentes_compuesto.id
LEFT JOIN 
	 t_componentes_sencillo
    ON t_componentes_sencillo.id = t_componentes_compuesto_sencillo.cod_componente_sencillo
LEFT JOIN
    t_componentes_compuesto_material
    ON t_componentes_compuesto_material.cod_componente_compuesto = t_componentes_compuesto.id
LEFT JOIN 
	 t_material
    ON t_material.id = t_componentes_compuesto_material.cod_material;


CREATE OR REPLACE VIEW consulta_1 AS
SELECT
    t_proveedor.nombre AS proveedor,
    t_material.id AS id_material,
    t_material.nombre AS material,
    t_componentes_sencillo.id AS id_componente_sencillo,
    t_componentes_sencillo.nombre AS nombre_componente_sencillo,
    t_componente_compuesto.id AS id_componente_compuesto,
    t_componente_compuesto.nombre AS nombre_componente_compuesto
FROM





-- Proveedores
INSERT INTO t_proveedor (nombre, direccion, telefono, email) VALUES
('Proveedor A', 'Calle Uno', 111111111, 101),
('Proveedor B', 'Calle Dos', 222222222, 102);

-- Materiales
INSERT INTO t_material (nombre, descripcion, unidadbasicademedida, cod_proveedor) VALUES
('Acero', 'Plancha de acero', 'kg', 1),
('Madera', 'Tablón de madera', 'kg', 1),
('Plástico', 'Granulado plástico', 'kg', 2);

-- Componentes sencillos
INSERT INTO t_componentes_sencillo (nombre, descripcion, stock, precio) VALUES
('Tornillo', 'Tornillo estándar', 1000, 0.10),
('Tuerca', 'Tuerca estándar', 800, 0.05),
('Arandela', 'Arandela metálica', 500, 0.02);

-- Componentes compuestos
INSERT INTO t_componentes_compuesto (nombre, descripcion, stock) VALUES
('Puerta', 'Puerta ensamblada', 50),
('Ventana', 'Ventana ensamblada', 70);

-- Material–componente sencillo
INSERT INTO t_mat_comp_sencillo (cod_componentes_sencillo, cod_material, cantidad_material) VALUES
(1, 1, 2),   -- Tornillo usa 2 kg de acero
(2, 1, 1),   -- Tuerca usa 1 kg de acero
(3, 1, 0.5); -- Arandela usa 0.5 kg de acero

-- Componente compuesto–sencillo
INSERT INTO t_componentes_compuesto_sencillo (cod_componente_compuesto, cod_componente_sencillo, cantidad) VALUES
(1, 1, 10),  -- Puerta usa 10 tornillos
(1, 2, 10),  -- Puerta usa 10 tuercas
(2, 1, 8),   -- Ventana usa 8 tornillos
(2, 3, 4);   -- Ventana usa 4 arandelas

-- Componente compuesto–compuesto
INSERT INTO t_componentes_compuesto_compuesto (cod_componente_compuesto_padre, cod_componente_compuesto_hijo, cantidad) VALUES
(1, 2, 1);   -- Puerta


-- Consultas basicas, modificar la id por lo que se esta deseando mostrar 
SELECT * FROM fabricacion_comp_sencillo WHERE id_componente_sencillo = 1;

SELECT * FROM fabricacion_comp_compuesto WHERE id_componente_compuesto = 1;
--	
-- ¿Existe el compuesto 1?
SELECT * FROM t_componentes_compuesto WHERE id = 1;

-- ¿Componentes sencillos asociados al compuesto 1?
SELECT * FROM t_componentes_compuesto_sencillo WHERE cod_componente_compuesto = 1;

-- ¿Componentes compuestos hijos del compuesto 1?
SELECT * FROM t_componentes_compuesto_compuesto WHERE cod_componente_compuesto_padre = 1;

-- ¿Materiales asociados al compuesto 1?
SELECT * FROM t_componentes_compuesto_material WHERE cod_componente_compuesto = 1;

