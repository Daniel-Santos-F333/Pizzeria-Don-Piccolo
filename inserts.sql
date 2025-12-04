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