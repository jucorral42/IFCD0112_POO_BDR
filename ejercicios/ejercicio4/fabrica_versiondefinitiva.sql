CREATE DATABASE IF NOT EXISTS db_fabrica1;
USE db_fabrica1;

DROP TABLE IF EXISTS t_relacion_objeto_objeto;
DROP TABLE IF EXISTS t_material;
DROP TABLE IF EXISTS t_proveedor;

CREATE TABLE IF NOT EXISTS t_proveedor
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    cif varchar(10),
    direccion VARCHAR(100),
    telefono VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS t_material
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion VARCHAR(1000),
    unidadbasicademedida ENUM('g', 'kg', 't', 'unidades'),
    precio_venta INT,
    coste_fabricacion INT,
    stock_actual INT,
    stock_minimo INT,
    cod_proveedor INT DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT t_material_fk1 FOREIGN KEY (cod_proveedor) REFERENCES t_proveedor(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS t_relacion_objeto_objeto
(
    id INT NOT NULL AUTO_INCREMENT,
    cod_objeto_final INT NOT NULL,
    cod_objeto_recurso INT NOT NULL,
    cantidad INT DEFAULT 0 NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (cod_objeto_final, cod_objeto_recurso),
    CONSTRAINT t_relacion_objeto_objeto_fk1 FOREIGN KEY (cod_objeto_final) REFERENCES t_material(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT t_relacion_objeto_objeto_fk2 FOREIGN KEY (cod_objeto_recurso) REFERENCES t_material(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE OR REPLACE VIEW v_proveedor_material_producto AS
WITH RECURSIVE materiales_recursivos AS (
    SELECT 
        m.id AS cod_material_origen,
        m.nombre AS nombre_material_primario,
        m.id AS cod_material_actual,
        m.nombre AS nombre_material_actual,
        p.nombre AS nombre_proveedor
    FROM t_material m
    JOIN t_proveedor p ON m.cod_proveedor = p.id

    UNION ALL

    SELECT 
        mr.cod_material_origen,
        mr.nombre_material_primario,
        r.cod_objeto_final AS cod_material_actual,
        m2.nombre AS nombre_material_actual,
        mr.nombre_proveedor
    FROM materiales_recursivos mr
    JOIN t_relacion_objeto_objeto r
      ON r.cod_objeto_recurso = mr.cod_material_actual
    JOIN t_material m2
      ON m2.id = r.cod_objeto_final
)
SELECT DISTINCT
    nombre_proveedor,
    nombre_material_primario,
    nombre_material_actual AS nombre_producto_final
FROM materiales_recursivos
ORDER BY nombre_proveedor, nombre_material_primario, nombre_producto_final;

CREATE OR REPLACE VIEW v_aviso_stock AS 
SELECT id, nombre, stock_actual, stock_minimo
 FROM t_material WHERE stock_minimo > stock_actual;


 DROP PROCEDURE IF EXISTS p_hijo_padre;

DELIMITER //
CREATE PROCEDURE p_hijo_padre (IN nombre_padre VARCHAR(255))
BEGIN
   SELECT 
        padre.id AS id_hijo,
        padre.nombre AS nombre_hijo
    FROM 
        t_relacion_objeto_objeto r
    JOIN 
        t_material hijo ON hijo.id = r.cod_objeto_recurso
    JOIN 
        t_material padre ON padre.id = r.cod_objeto_final
    WHERE 
        padre.nombre = nombre_padre
   UNION ALL
   SELECT 
        hijo.id AS id_material,
        hijo.nombre AS nombre_material,
        'hijo_de' AS relacion,
        padre.id AS id_relacionado,
        padre.nombre AS nombre_relacionado
    FROM 
        t_relacion_objeto_objeto r
    JOIN 
        t_material hijo ON hijo.id = r.cod_objeto_recurso
    JOIN 
        t_material padre ON padre.id = r.cod_objeto_final
    WHERE 
        hijo.nombre = nombre_material;
END //

DELIMITER ;




-- Datos

INSERT INTO t_proveedor (nombre, direccion, telefono, email) VALUES
('ProveedSteel', 'Calle Falsa 123', '600111222', 'contacto@proveedsteel.com'),
('MaterialesPlus', 'Avenida Siempre Viva 742', '600333444', 'info@materialesplus.com'),
('MegaSuministros', 'Plaza Central 10', '600555666', 'ventas@megasuministros.com'),
('SuministrosGlobal', 'Calle Luna 77', '600777888', 'global@suministros.com'),
('FerreteriaTop', 'Avenida Sol 99', '600999000', 'top@ferreteriatop.com'),
('InsumosX', 'Paseo Verde 45', '601111222', 'contacto@insumosx.com'),
('MetalesWorld', 'Calle Mar 5', '601333444', 'ventas@metalesworld.com'),
('MaterialesRapidos', 'Boulevard 12', '601555666', 'rapidos@materiales.com'),
('AceroFacil', 'Calle Norte 8', '601777888', 'info@acerofacil.com'),
('ComponentesYA', 'Calle Sur 33', '601999000', 'contacto@componentesya.com');

INSERT INTO t_material 
(nombre, descripcion, unidadbasicademedida, precio_venta, coste_fabricacion, stock_actual, stock_minimo, cod_proveedor) VALUES

('Acero', 'Acero de alta resistencia', 'kg', 100, 60, 10, 100, 1),
('Aluminio', 'Aluminio ligero', 'kg', 120, 70, 8, 80, 2),
('Cobre', 'Cobre puro', 'kg', 150, 90, 600, 60, 3),
('Plastico', 'Plastico ABS', 'kg', 50, 30, 15, 150, 4),
('Vidrio', 'Vidrio templado', 'kg', 80, 40, 900, 90, 5),
('Madera', 'Madera de pino', 'kg', 40, 20, 100, 110, 6),
('Goma', 'Goma natural', 'kg', 70, 35, 700, 70, 7),
('Pintura', 'Pintura acrilica', 'kg', 60, 25, 1300, 130, 8),
('Tornillo', 'Tornillo acero inoxidable', 'unidades', 1, 1, 5000, 500, 9),
('Tuerca', 'Tuerca acero inoxidable', 'unidades', 1, 1, 5000, 500, 10),
('Chapa Acero', 'Chapa hecha de acero', 'kg', 180, 120, 300, 30, NULL),
('Panel Aluminio', 'Panel de aluminio ligero', 'kg', 200, 130, 250, 25, NULL),
('Cable Cobre', 'Cable de cobre para electricidad', 'kg', 220, 140, 400, 40, NULL),
('Botella Plastico', 'Botella moldeada en plastico', 'unidades', 5, 3, 1000, 100, NULL),
('Vidrio Laminado', 'Vidrio para ventanas', 'kg', 150, 90, 350, 35, NULL),
('Mesa Madera', 'Mesa fabricada con madera', 'unidades', 300, 200, 150, 15, NULL),
('Sello Goma', 'Sello de goma para maquinaria', 'unidades', 15, 10, 450, 45, NULL),
('Lata Pintura', 'Lata de pintura acrilica', 'unidades', 25, 15, 600, 60, NULL),
('Kit Tornillos', 'Kit con 100 tornillos', 'unidades', 50, 30, 200, 20, NULL),
('Kit Tuercas', 'Kit con 100 tuercas', 'unidades', 50, 30, 200, 20, NULL),
('Puerta Metalica', 'Puerta fabricada con chapa y tornillos', 'unidades', 500, 350, 100, 10, NULL),
('Ventana Aluminio', 'Ventana con paneles y tornillos', 'unidades', 600, 400, 80, 8, NULL),
('Cableado Electrico', 'Cableado con cobre y plastico', 'unidades', 450, 300, 120, 12, NULL),
('Botella Pintada', 'Botella con pintura y plastico', 'unidades', 40, 25, 500, 50, NULL),
('Mueble Vidrio', 'Mueble con vidrio y madera', 'unidades', 800, 550, 60, 6, NULL),
('Mesa Pintada', 'Mesa con pintura y madera', 'unidades', 350, 220, 70, 7, NULL),
('Sello Tornillo', 'Sello fijado con tornillos', 'unidades', 30, 18, 300, 30, NULL);



INSERT INTO t_relacion_objeto_objeto (cod_objeto_final, cod_objeto_recurso, cantidad) VALUES
(11, 1, 1), -- Chapa Acero usa Acero
(12, 2, 1), -- Panel Aluminio usa Aluminio
(13, 3, 1), -- Cable Cobre usa Cobre
(14, 4, 1), -- Botella Plastico usa Plastico
(15, 5, 1), -- Vidrio Laminado usa Vidrio
(16, 6, 1), -- Mesa Madera usa Madera
(17, 7, 1), -- Sello Goma usa Goma
(18, 8, 1), -- Lata Pintura usa Pintura
(19, 9, 1), -- Kit Tornillos usa Tornillo
(20, 10, 1), -- Kit Tuercas usa Tuerca

(21, 11, 1), -- Puerta Metalica usa Chapa Acero
(21, 19, 1), -- Puerta Metalica usa Kit Tornillos
(22, 12, 1), -- Ventana Aluminio usa Panel Aluminio
(22, 19, 1), -- Ventana Aluminio usa Kit Tornillos
(23, 13, 1), -- Cableado Electrico usa Cable Cobre
(23, 14, 1), -- Cableado Electrico usa Botella Plastico
(24, 14, 1), -- Botella Pintada usa Botella Plastico
(24, 18, 1), -- Botella Pintada usa Lata Pintura
(25, 15, 1), -- Mueble Vidrio usa Vidrio Laminado
(25, 16, 1), -- Mueble Vidrio usa Mesa Madera
(26, 18, 1), -- Mesa Pintada usa Lata Pintura
(26, 16, 1), -- Mesa Pintada usa Mesa Madera
(27, 17, 1), -- Sello Tornillo usa Sello Goma
(27, 19, 1); -- Sello Tornillo usa Kit Tornillos

