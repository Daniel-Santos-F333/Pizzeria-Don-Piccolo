-- 0000000000000000000000000000000000000000000000
-- 000000000      Examen MYSQL2      000000000000
-- 0000000000000000000000000000000000000000000000

-- ##############################################
-- Requerimientos:
-- 1. Creación de tabla de pedidos

    DROP TABLE pedido;

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
        FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
        FOREIGN KEY (id_pizza) REFERENCES pizza(id_pizza)
        );
-- ###############################################
-- 3. Consulta de pedidos por cliente
        SELECT
            PE.nombre,
            cliente,
            PD.total
            PD.estado
        FROM
            persona PE
        INNER JOIN
            cliente C ON PE.id_persona = C.id_persona
        INNER JOIN 
            pedido PD ON C.id_cliente = PD.id_cliente;