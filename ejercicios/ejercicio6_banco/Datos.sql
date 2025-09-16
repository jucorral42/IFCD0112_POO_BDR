-- t_ciudad
INSERT INTO t_ciudad (nombre) VALUES 
('Madrid'), ('Barcelona'), ('Valencia'), ('Sevilla'), ('Bilbao');

-- t_persona
INSERT INTO t_persona (nombre, apellido, nif, direccion, cod_ciudad, telefono, email) VALUES
('Carlos', 'Gómez', '12345678A', 'Calle Sol, 1', 1, '600000001', 'carlos@example.com'),
('Laura', 'Martín', '87654321B', 'Calle Luna, 2', 2, '600000002', 'laura@example.com'),
('Pedro', 'López', '11223344C', 'Calle Mar, 3', 3, '600000003', 'pedro@example.com'),
('Ana', 'Ruiz', '55667788D', 'Calle Tierra, 4', 4, '600000004', 'ana@example.com'),
('David', 'Santos', '99887766E', 'Calle Fuego, 5', 5, '600000005', 'david@example.com');

-- t_sucursal
INSERT INTO t_sucursal (cod_ciudad, activos) VALUES
(1, 1000000.00),
(2, 2000000.00),
(3, 1500000.00),
(4, 1800000.00),
(5, 1700000.00);

-- t_empleado
INSERT INTO t_empleado (idEmp, cod_persona, cod_jefe, incorporacion) VALUES
('EMP001', 1, NULL, '2022-01-01'),
('EMP002', 2, 'EMP001', '2022-02-01'),
('EMP003', 3, 'EMP001', '2022-03-01'),
('EMP004', 4, 'EMP002', '2022-04-01'),
('EMP005', 5, 'EMP003', '2022-05-01');

-- t_cliente
INSERT INTO t_cliente (idCli, cod_persona) VALUES
('CLI001', 1),
('CLI002', 2),
('CLI003', 3),
('CLI004', 4),
('CLI005', 5);

-- t_cuenta
INSERT INTO t_cuenta (numero_cuenta, saldo, tipo_cuenta) VALUES
(1001, 5000.00, 'Cuenta corriente'),
(1002, 7000.00, 'Cuenta ahorro'),
(1003, 1500.00, 'Cuenta corriente'),
(1004, 12000.00, 'Cuenta ahorro'),
(1005, 300.00, 'Cuenta corriente');

-- t_cuenta_corriente
INSERT INTO t_cuenta_corriente (cod_cuenta, ultimo_descubierto) VALUES
(1, '2024-07-01 10:00:00'),
(3, '2024-06-15 11:30:00'),
(5, '2024-06-20 09:45:00');

-- t_cuenta_ahorro
INSERT INTO t_cuenta_ahorro (cod_cuenta, interes_anual) VALUES
(2, 1.50),
(4, 2.00);

-- t_prestamo
INSERT INTO t_prestamo (cod_sucursal, cod_cuenta, firmado, cod_cliente_firma, importe_prestado, importe_pendiente) VALUES
(1, 1, TRUE, 1, 10000.00, 2000.00),
(2, 2, TRUE, 2, 8000.00, 1000.00),
(3, 3, FALSE, 3, 5000.00, 5000.00),
(4, 4, TRUE, 4, 12000.00, 2000.00),
(5, 5, TRUE, 5, 3000.00, 500.00);

-- tr_prestamo_cliente
INSERT INTO tr_prestamo_cliente (cod_cliente, cod_prestamo) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),  -- Cliente cofirmante
(2, 3),
(3, 4);

-- tr_cliente_empleado
INSERT INTO tr_cliente_empleado (id, cod_cliente, cod_empleado, tipo_relacion) VALUES
(1, 1, 1, 'responsable de prestamos'),
(2, 2, 1, 'asesor personal'),
(3, 3, 2, 'responsable de prestamos'),
(4, 4, 3, 'asesor personal'),
(5, 5, 4, 'responsable de prestamos');

-- tr_cuenta_cliente
INSERT INTO tr_cuenta_cliente (cod_cliente, cod_cuenta, jerarquia_titulares) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(1, 2, 2),  -- cotitular
(2, 3, 2),
(3, 4, 2);

-- tr_devolucion_prestamo
INSERT INTO tr_devolucion_prestamo (cod_prestamo, importe, pendiente, fecha) VALUES
(1, 2000.00, FALSE, '2024-07-10'),
(2, 3000.00, FALSE, '2024-07-12'),
(2, 4000.00, TRUE, '2024-07-20'),
(4, 1000.00, TRUE, '2024-07-25'),
(5, 2500.00, FALSE, '2024-07-30');
