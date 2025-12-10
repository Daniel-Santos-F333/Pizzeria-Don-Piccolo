-- 0000000000000000000000000000000000000000000000
-- 000000000      Examen MYSQL2      000000000000
-- 0000000000000000000000000000000000000000000000

-- ##############################################
-- Requerimientos:
-- 1. Creación de tabla de pedidos
    CREATE TABLE  pedido(
        id_pedido INT AUTO_INCREMENT PRIMARY KEY,
        id_cliente INT NOT NULL,
        fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
        metodo_pago VARCHAR(50),
        estado ENUM('efectivo', 'tarjeta', 'app') NOT NULL,
        total DOUBLE NOT NULL
        FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
            ON DELETE RESTRICT ON UPDATE CASCADE
    );
-- ###############################################
-- 2. Creación Tabla intermedia
    CREATE TABLE pedido_pizza(
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_pedido INT NOT NULL,
        id_pizza INT NOT NULL,
        cantidad INT NOT NULL
        FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
            ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (id_pizza) REFERENCES pizza(id_pizza)
            ON DELETE CASCADE ON UPDATE CASCADE
    );
-- ###############################################
-- 3. Consulta de pedidos por cliente
