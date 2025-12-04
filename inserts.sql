-- ============================================
-- PIZZERIA DON PICCOLO - INSERCIÓN DE DATOS
-- ============================================

USE pizzeria_don_piccolo;

-- ============================================
-- 1. ZONAS DE BUCARAMANGA
-- ============================================
INSERT INTO zona (nombre_zona, tarifa_base, tiempo_estimado_min) VALUES
('Centro', 3000, 15),
('Norte', 6000, 30),
('Sur', 5000, 25),
('Girón', 8000, 40);

-- ============================================
-- 2. CATEGORÍAS DE PRODUCTOS
-- ============================================
INSERT INTO categoria (nombre, descripcion, activa) VALUES
('Pizzas', 'Pizzas artesanales con ingredientes frescos', TRUE),
('Bebidas', 'Bebidas frías para acompañar', TRUE);

-- ============================================
-- 3. INGREDIENTES
-- ============================================
INSERT INTO ingrediente (nombre, stock_actual, stock_minimo, costo_unitario, unidad_medida) VALUES
('Masa para pizza', 500, 50, 1500, 'unidades'),
('Salsa de tomate', 800, 100, 50, 'gramos'),
('Queso mozzarella', 1000, 150, 80, 'gramos'),
('Pepperoni', 600, 80, 120, 'gramos'),
('Jamón', 500, 70, 90, 'gramos'),
('Champiñones', 400, 50, 60, 'gramos'),
('Pimentón', 300, 40, 40, 'gramos'),
('Cebolla', 350, 40, 30, 'gramos'),
('Aceitunas', 250, 30, 70, 'gramos'),
('Albahaca', 200, 20, 100, 'gramos');

-- ============================================
-- 4. PRODUCTOS - PIZZAS
-- ============================================
INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (1, 'Pizza Margarita Mediana', 'Pizza clásica con queso mozzarella y albahaca fresca', 25000, TRUE, TRUE);
INSERT INTO pizza (id_producto, tamano, tipo) VALUES (LAST_INSERT_ID(), 'mediana', 'clasica');

INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (1, 'Pizza Margarita Grande', 'Pizza clásica con queso mozzarella y albahaca fresca', 35000, TRUE, TRUE);
INSERT INTO pizza (id_producto, tamano, tipo) VALUES (LAST_INSERT_ID(), 'grande', 'clasica');

INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (1, 'Pizza Pepperoni Mediana', 'Deliciosa pizza con pepperoni y queso', 28000, TRUE, TRUE);
INSERT INTO pizza (id_producto, tamano, tipo) VALUES (LAST_INSERT_ID(), 'mediana', 'especial');

INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (1, 'Pizza Pepperoni Grande', 'Deliciosa pizza con pepperoni y queso', 40000, TRUE, TRUE);
INSERT INTO pizza (id_producto, tamano, tipo) VALUES (LAST_INSERT_ID(), 'grande', 'especial');

INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (1, 'Pizza Vegetariana Mediana', 'Pizza con champiñones, pimentón, cebolla y aceitunas', 27000, TRUE, TRUE);
INSERT INTO pizza (id_producto, tamano, tipo) VALUES (LAST_INSERT_ID(), 'mediana', 'vegetariana');

INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (1, 'Pizza Hawaiana Grande', 'Pizza con jamón, piña y queso', 38000, TRUE, TRUE);
INSERT INTO pizza (id_producto, tamano, tipo) VALUES (LAST_INSERT_ID(), 'grande', 'especial');

-- ============================================
-- 5. PRODUCTOS - BEBIDAS
-- ============================================
INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (2, 'Coca Cola 1.5L', 'Coca Cola Original 1.5 litros', 6000, TRUE, FALSE);
INSERT INTO bebida (id_producto, tamano) VALUES (LAST_INSERT_ID(), 'litro');

INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (2, 'Coca Cola 2L', 'Coca Cola Original 2 litros', 8500, TRUE, FALSE);
INSERT INTO bebida (id_producto, tamano) VALUES (LAST_INSERT_ID(), 'dos_litros');

INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (2, 'Jugo Hit Naranja 500ml', 'Jugo de naranja natural Hit', 4000, TRUE, FALSE);
INSERT INTO bebida (id_producto, tamano) VALUES (LAST_INSERT_ID(), 'mediana');

INSERT INTO producto (id_categoria, nombre, descripcion, precio_base, disponible, requiere_ingredientes) 
VALUES (2, 'Agua Cristal 600ml', 'Agua mineral sin gas', 2500, TRUE, FALSE);
INSERT INTO bebida (id_producto, tamano) VALUES (LAST_INSERT_ID(), 'mediana');

-- ============================================
-- 6. RECETAS - PRODUCTO_INGREDIENTE
-- ============================================
INSERT INTO producto_ingrediente (id_producto, id_ingrediente, cantidad_necesaria) VALUES
(1, 1, 1), (1, 2, 100), (1, 3, 200), (1, 10, 10),
(2, 1, 1), (2, 2, 150), (2, 3, 300), (2, 10, 15),
(3, 1, 1), (3, 2, 100), (3, 3, 180), (3, 4, 80),
(4, 1, 1), (4, 2, 150), (4, 3, 250), (4, 4, 120),
(5, 1, 1), (5, 2, 100), (5, 3, 150), (5, 6, 50), (5, 7, 40), (5, 8, 30), (5, 9, 20),
(6, 1, 1), (6, 2, 150), (6, 3, 250), (6, 5, 100);

-- ============================================
-- 7. PERSONAS - CLIENTES
-- ============================================
INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765432', 'cedula', 'María', 'García', '3201234567');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Calle 45 #27-15, Cabecera', 'maria.garcia@email.com', 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765433', 'cedula', 'Juan', 'Pérez', '3109876543');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Carrera 33 #52-18, Cabecera', 'juan.perez@email.com', 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765434', 'cedula', 'Ana', 'Rodríguez', '3157778888');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Calle 105 #23-45, Morrorico', 'ana.rodriguez@email.com', 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765435', 'cedula', 'Carlos', 'Martínez', '3205554444');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Carrera 9 #12-34, Centro', 'carlos.martinez@email.com', 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765436', 'cedula', 'Laura', 'Gómez', '3123334444');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Calle 56 #28-90, Provenza', 'laura.gomez@email.com', 0, FALSE);

INSERT INTO persona (nombre, apellido, telefono) VALUES ('Diego', 'Torres', '3186665555');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Carrera 27 #45-12, Lagos', NULL, 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765437', 'cedula', 'Sofía', 'Ramírez', '3142223333');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Calle 34 #18-56, Girón', 'sofia.ramirez@email.com', 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765438', 'cedula', 'Andrés', 'López', '3199998888');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Carrera 15 #22-33, Real de Minas', 'andres.lopez@email.com', 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765439', 'cedula', 'Valentina', 'Cruz', '3167776666');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Calle 48 #30-21, Cabecera', 'valentina.cruz@email.com', 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765440', 'cedula', 'Miguel Ángel', 'Sánchez', '3135557777');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Carrera 36 #50-40, Cabecera', 'miguel.sanchez@email.com', 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765441', 'cedula', 'Camila', 'Vargas', '3178889999');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Calle 52 #29-18, Cabecera', 'camila.vargas@email.com', 0, FALSE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098765442', 'cedula', 'Santiago', 'Mejía', '3154445555');
INSERT INTO cliente (id_persona, direccion, correo, cantidad_pedidos, es_frecuente) VALUES (LAST_INSERT_ID(), 'Carrera 28 #47-25, Provenza', 'santiago.mejia@email.com', 0, FALSE);

-- ============================================
-- 8. PERSONAS - EMPLEADOS
-- ============================================
INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098111111', 'cedula', 'Roberto', 'Administrador', '3001111111');
INSERT INTO empleado (id_persona, rol, activo) VALUES (LAST_INSERT_ID(), 'administrador', TRUE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098222222', 'cedula', 'Carolina', 'Moreno', '3002222222');
INSERT INTO empleado (id_persona, rol, activo) VALUES (LAST_INSERT_ID(), 'cajero', TRUE);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098333333', 'cedula', 'Daniel', 'Ortiz', '3003333333');
INSERT INTO empleado (id_persona, rol, activo) VALUES (LAST_INSERT_ID(), 'cajero', TRUE);

-- ============================================
-- 9. PERSONAS - REPARTIDORES
-- ============================================
INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098444444', 'cedula', 'Javier', 'Mendoza', '3004444444');
INSERT INTO repartidor (id_persona, zona_asignada, estado, total_entregas) VALUES (LAST_INSERT_ID(), 1, 'disponible', 0);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098555555', 'cedula', 'Felipe', 'Castro', '3005555555');
INSERT INTO repartidor (id_persona, zona_asignada, estado, total_entregas) VALUES (LAST_INSERT_ID(), 2, 'disponible', 0);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098666666', 'cedula', 'Mauricio', 'Herrera', '3006666666');
INSERT INTO repartidor (id_persona, zona_asignada, estado, total_entregas) VALUES (LAST_INSERT_ID(), 3, 'disponible', 0);

INSERT INTO persona (documento, tipo_documento, nombre, apellido, telefono) VALUES ('1098777777', 'cedula', 'Oscar', 'Reyes', '3007777777');
INSERT INTO repartidor (id_persona, zona_asignada, estado, total_entregas) VALUES (LAST_INSERT_ID(), 4, 'disponible', 0);

-- ============================================
-- 10. PEDIDOS (25 pedidos)
-- ============================================
-- PEDIDO 1
INSERT INTO pedido (id_cliente, id_empleado, fecha_hora, metodo_pago, estado, subtotal, costo_envio, iva, total, es_domicilio) 
VALUES (1, 2, '2024-11-15 19:30:00', 'tarjeta', 'entregado', 58500, 3000, 11115, 72615, TRUE);
INSERT INTO pedido_producto (id_pedido, id_producto, cantidad, precio_unitario, subtotal_linea) VALUES
(1, 1, 2, 25000, 50000), (1, 8, 1, 8500, 8500);
INSERT INTO domicilio (id_pedido, id_repartidor, id_zona, hora_salida, hora_entrega, distancia_km, costo_envio, direccion_entrega) 
VALUES (1, 1, 1, '2024-11-15 20:00:00', '2024-11-15 20:15:00', 2.5, 3000, 'Calle 45 #27-15, Cabecera');

-- PEDIDO 2
INSERT INTO pedido (id_cliente, id_empleado, fecha_hora, metodo_pago, estado, subtotal, costo_envio, iva, total, es_domicilio) 
VALUES (2, 2, '2024-11-16 18:45:00', 'efectivo', 'entregado', 40000, 0, 7600, 47600, FALSE);
INSERT INTO pedido_producto (id_pedido, id_producto, cantidad, precio_unitario, subtotal_linea) VALUES
(2, 4, 1, 40000, 40000);

-- PEDIDO 3
INSERT INTO pedido (id_cliente, id_empleado, fecha_hora, metodo_pago, estado, subtotal, costo_envio, iva, total, es_domicilio) 
VALUES (3, 3, '2024-11-17 20:15:00', 'app', 'entregado', 35000, 6000, 6650, 47650, TRUE);
INSERT INTO pedido_producto (id_pedido, id_producto, cantidad, precio_unitario, subtotal_linea) VALUES
(3, 5, 1, 27000, 27000), (3, 9, 2, 4000, 8000);
INSERT INTO domicilio (id_pedido, id_repartidor, id_zona, hora_salida, hora_entrega, distancia_km, costo_envio, direccion_entrega) 
VALUES (3, 2, 2, '2024-11-17 20:45:00', '2024-11-17 21:20:00', 5.8, 6000, 'Calle 105 #23-45, Morrorico');

-- PEDIDO 4
INSERT INTO pedido (id_cliente, id_empleado, fecha_hora, metodo_pago, estado, subtotal, costo_envio, iva, total, es_domicilio) 
VALUES (4, 2, '2024-11-18 19:00:00', 'tarjeta', 'entregado', 122000, 3000, 23180, 148180, TRUE);
INSERT INTO pedido_producto (id_pedido, id_producto, cantidad, precio_unitario, subtotal_linea) VALUES
(4, 2, 3, 35000, 105000), (4, 8, 2, 8500, 17000);
INSERT INTO domicilio (id_pedido, id_repartidor, id_zona, hora_salida, hora_entrega, distancia_km, costo_envio, direccion_entrega) 
VALUES (4, 1, 1, '2024-11-18 19:30:00', '2024-11-18 19:48:00', 1.8, 3000, 'Carrera 9 #12-34, Centro');

-- PEDIDO 5
INSERT INTO pedido (id_cliente, id_empleado, fecha_hora, metodo_pago, estado, subtotal, costo_envio, iva, total, es_domicilio) 
VALUES (5, 3, '2024-11-19 21:00:00', 'efectivo', 'entregado', 30500, 5000, 5795, 41295, TRUE);
INSERT INTO pedido_producto (id_pedido, id_producto, cantidad, precio_unitario, subtotal_linea) VALUES
(5, 3, 1, 28000, 28000), (5, 10, 1, 2500, 2500);
INSERT INTO domicilio (id_pedido, id_repartidor, id_zona, hora_salida, hora_entrega, distancia_km, costo_envio, direccion_entrega) 
VALUES (5, 3, 3, '2024-11-19 21:25:00', '2024-11-19 21:55:00', 4.2, 5000, 'Calle 56 #28-90, Provenza');

-- PEDIDOS 6 al 25
INSERT INTO pedido (id_cliente, id_empleado, fecha_hora, metodo_pago, estado, subtotal, costo_envio, iva, total, es_domicilio) VALUES
(6, 2, '2024-11-20 18:30:00', 'efectivo', 'entregado', 76000, 0, 14440, 90440, FALSE),
(7, 3, '2024-11-21 19:45:00', 'app', 'entregado', 93000, 8000, 17670, 118670, TRUE),
(8, 2, '2024-11-22 20:00:00', 'tarjeta', 'entregado', 27000, 0, 5130, 32130, FALSE),
(9, 3, '2024-11-23 19:20:00', 'efectivo', 'entregado', 64000, 3000, 12160, 79160, TRUE),
(10, 2, '2024-11-24 18:15:00', 'app', 'entregado', 46500, 0, 8835, 55335, FALSE),
(1, 2, '2024-11-25 20:30:00', 'tarjeta', 'entregado', 53000, 3000, 10070, 66070, TRUE),
(11, 3, '2024-11-26 19:00:00', 'app', 'entregado', 76000, 3000, 14440, 93440, TRUE),
(12, 2, '2024-11-27 20:45:00', 'efectivo', 'entregado', 29500, 5000, 5605, 40105, TRUE),
(3, 3, '2024-11-28 18:30:00', 'tarjeta', 'entregado', 137000, 6000, 26030, 169030, TRUE),
(2, 2, '2024-11-29 19:15:00', 'efectivo', 'entregado', 38000, 0, 7220, 45220, FALSE),
(1, 3, '2024-11-30 20:00:00', 'app', 'entregado', 58000, 3000, 11020, 72020, TRUE),
(11, 2, '2024-12-01 19:30:00', 'tarjeta', 'entregado', 34000, 3000, 6460, 43460, TRUE),
(5, 3, '2024-12-02 18:45:00', 'efectivo', 'entregado', 62000, 5000, 11780, 78780, TRUE),
(4, 2, '2024-12-02 20:30:00', 'tarjeta', 'entregado', 80000, 0, 15200, 95200, FALSE),
(1, 3, '2024-12-03 19:00:00', 'app', 'entregado', 46500, 3000, 8835, 58335, TRUE),
(11, 2, '2024-12-03 20:15:00', 'efectivo', 'en_ruta', 50000, 3000, 9500, 62500, TRUE),
(8, 3, '2024-12-03 19:30:00', 'tarjeta', 'listo', 67000, 5000, 12730, 84730, TRUE),
(9, 2, '2024-12-03 20:45:00', 'app', 'en_preparacion', 43000, 3000, 8170, 54170, TRUE),
(12, 3, '2024-12-03 21:00:00', 'efectivo', 'pendiente', 84500, 5000, 16055, 105555, TRUE),
(6, 2, '2024-12-03 21:15:00', 'tarjeta', 'pendiente', 28000, 0, 5320, 33320, FALSE);

INSERT INTO pedido_producto (id_pedido, id_producto, cantidad, precio_unitario, subtotal_linea) VALUES
(6, 6, 2, 38000, 76000),
(7, 2, 1, 35000, 35000), (7, 4, 1, 40000, 40000), (7, 7, 3, 6000, 18000),
(8, 5, 1, 27000, 27000),
(9, 3, 2, 28000, 56000), (9, 9, 2, 4000, 8000),
(10, 6, 1, 38000, 38000), (10, 8, 1, 8500, 8500),
(11, 1, 1, 25000, 25000), (11, 3, 1, 28000, 28000),
(12, 2, 2, 35000, 70000), (12, 7, 1, 6000, 6000),
(13, 5, 1, 27000, 27000), (13, 10, 1, 2500, 2500),
(14, 4, 3, 40000, 120000), (14, 8, 2, 8500, 17000),
(15, 6, 1, 38000, 38000),
(16, 1, 2, 25000, 50000), (16, 9, 2, 4000, 8000),
(17, 3, 1, 28000, 28000), (17, 7, 1, 6000, 6000),
(18, 2, 1, 35000, 35000), (18, 5, 1, 27000, 27000),
(19, 4, 2, 40000, 80000),
(20, 6, 1, 38000, 38000), (20, 8, 1, 8500, 8500),
(21, 1, 2, 25000, 50000),
(22, 4, 1, 40000, 40000), (22, 5, 1, 27000, 27000),
(23, 2, 1, 35000, 35000), (23, 9, 2, 4000, 8000),
(24, 6, 2, 38000, 76000), (24, 8, 1, 8500, 8500),
(25, 3, 1, 28000, 28000);

INSERT INTO domicilio (id_pedido, id_repartidor, id_zona, hora_salida, hora_entrega, distancia_km, costo_envio, direccion_entrega) VALUES
(7, 4, 4, '2024-11-21 20:15:00', '2024-11-21 21:00:00', 7.5, 8000, 'Calle 34 #18-56, Girón'),
(9, 1, 1, '2024-11-23 19:50:00', '2024-11-23 20:10:00', 2.3, 3000, 'Calle 48 #30-21, Cabecera'),
(11, 1, 1, '2024-11-25 21:00:00', '2024-11-25 21:18:00', 2.5, 3000, 'Calle 45 #27-15, Cabecera'),
(12, 1, 1, '2024-11-26 19:30:00', '2024-11-26 19:50:00', 2.8, 3000, 'Calle 52 #29-18, Cabecera'),
(13, 3, 3, '2024-11-27 21:10:00', '2024-11-27 21:40:00', 4.5, 5000, 'Carrera 28 #47-25, Provenza'),
(14, 2, 2, '2024-11-28 19:00:00', '2024-11-28 19:35:00', 5.8, 6000, 'Calle 105 #23-45, Morrorico'),
(16, 1, 1, '2024-11-30 20:30:00', '2024-11-30 20:48:00', 2.5, 3000, 'Calle 45 #27-15, Cabecera'),
(17, 1, 1, '2024-12-01 20:00:00', '2024-12-01 20:20:00', 2.8, 3000, 'Calle 52 #29-18 Cabecera'),
(18, 3, 3, '2024-12-02 19:15:00', '2024-12-02 19:45:00', 4.2, 5000, 'Calle 56 #28-90, Provenza'),
(20, 1, 1, '2024-12-03 19:30:00', '2024-12-03 19:50:00', 2.5, 3000, 'Calle 45 #27-15, Cabecera'),
(21, 1, 1, '2024-12-03 20:45:00', NULL, 2.8, 3000, 'Calle 52 #29-18, Cabecera'),
(22, 3, 3, NULL, NULL, 3.8, 5000, 'Carrera 15 #22-33, Real de Minas'),
(23, NULL, 1, NULL, NULL, 2.3, 3000, 'Calle 48 #30-21, Cabecera'),
(24, NULL, 3, NULL, NULL, 4.5, 5000, 'Carrera 28 #47-25, Provenza');