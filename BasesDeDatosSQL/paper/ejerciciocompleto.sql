-- -------------------------------------------------------
-- papercompany.sql
-- -------------------------------------------------------

DROP DATABASE IF EXISTS papercompany;
CREATE DATABASE papercompany;
USE papercompany;

-- Paso 1: Borrado de las tablas, si existen
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customers;

-- Paso 2: Creación de las tablas con sus PK

CREATE TABLE employees(
 employee_id INT AUTO_INCREMENT PRIMARY KEY,
 employee_name VARCHAR(16),
 employee_surname VARCHAR(16),
 employee_birthdate DATE CHECK(employee_birthdate BETWEEN '1900-01-01' AND '2014-01-01'),
 employee_email VARCHAR(36) NOT NULL UNIQUE,
 employee_position ENUM('Boss', 'Intern', 'Salesman'),
 employee_salary DECIMAL(8,2),
 employee_gender ENUM('M','F')
);

-- Intentamos insertar un empleado nacido hoy: NOW() y obtenemos un error
-- INSERT INTO employees (employee_email, employee_birthdate) VALUES ('prueba@prueba.com', NOW());

-- Intentamos insertar un empleado de categoría 'Super-Boss' (employee_position) y el registro se inserta,
-- pero no se guarda ese campo, queda vacío (no NULL)
-- INSERT INTO employees (employee_email, employee_position) VALUES ('prueba@prueba.com', 'Super-Boss');

-- Intentamos insertar un empleado con un email repetido
-- INSERT INTO employees (employee_email, employee_position) VALUES ('prueba@prueba.com', 'Salesman');
-- Error: clave duplicada

CREATE TABLE items(
 item_id INT AUTO_INCREMENT PRIMARY KEY,
 item_name VARCHAR(42) NOT NULL UNIQUE,
 item_price DECIMAL(4,2) NOT NULL
);

CREATE TABLE sales(
 sale_id INT AUTO_INCREMENT PRIMARY KEY,
 salesman_id INT NOT NULL,
 item_id INT NOT NULL,
 sale_date DATETIME NOT NULL DEFAULT '2000-01-01 12:00:00',
 sale_amount DECIMAL(4,2) NOT NULL,
 FOREIGN KEY (salesman_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
 FOREIGN KEY (item_id) REFERENCES items(item_id) ON DELETE CASCADE
);

-- Originalmente, sale_amount es el importe total vendido, es decir: Número de unidades * Precio unitario

CREATE TABLE customers(
 customer_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_name VARCHAR(12),
 customer_registration_date DATE
);

-- ************************************* --
-- CORRECCIONES SOBRE EL MODELO
-- ************************************* --

-- La tabla sales no indica el cliente a quien hemos vendido
-- Por tanto, añdimos el cliente con su FK

ALTER TABLE sales
ADD COLUMN customer_id INT NOT NULL;

ALTER TABLE sales
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

-- ************************************* --
-- MEJORAS SOBRE EL MODELO
-- ************************************* --

-- Añadimos el detalle del stock disponible
ALTER TABLE items ADD COLUMN stock INT NOT NULL DEFAULT 0;

-- Modificamos el significado de sale_amount para que ahora signifique el número de unidades vendidas
ALTER TABLE sales
MODIFY sale_amount INT NOT NULL DEFAULT 1 CHECK(sale_amount>=1);

-- ************************************* --
-- INSERTAMOS LOS DATOS
-- ************************************* --

-- INSERT INTO: inserts records into a table's specified columns. It has to conform to the constraints and remeber to do it from parents to childs
INSERT INTO employees (employee_name, employee_surname, employee_birthdate, employee_email, employee_position, employee_salary, employee_gender)
VALUES
('Michael', 'Scott', '1965-03-15', 'michael_scott@dmpc.com', 'Boss', 60000, 'M'),
('Jim', 'Halpert', '1978-10-01', 'jim_halpert@dmpc.com', 'Salesman', 45000, 'M'),
('Dwight', 'Schrute', '1970-01-20', 'dwight_schrute@dmpc.com', 'Salesman', 45500, 'M'),
('Pam', 'Beasley', '1979-03-25', 'pam_beasley@dmpc.com', 'Salesman', 30000, 'F');

INSERT INTO items (item_name, item_price)
VALUES
('pen 10 pack', 5.99),
('Paper pallet', 70.99),
('Pencil 10 pack' , 3.99);

INSERT INTO customers (customer_name, customer_registration_date)
VALUES
('Sabre', '2012-12-12'),
('Big company', '2020-10-12');

INSERT INTO sales (salesman_id, item_id, sale_amount, customer_id)
VALUES
(1, 1, 10, 1),
(1, 2, 10, 1),
(2, 2, 40, 1),
(1, 1, 10, 1),
(1, 3, 5, 1),
(3, 2, 10, 1),
(3, 2, 10, 1),
(2, 3, 100, 1),
(1, 1, 25, 1);
