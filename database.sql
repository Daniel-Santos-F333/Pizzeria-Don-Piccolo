-- 0000000000000000000000000000000000
-- 00    Pizzería Don Piccolo      00
-- 0000000000000000000000000000000000
-- Proyecto MySql2 - Campuslands

/*Comienzo con la creación de la base de datos*/

create DATABASE pizzeria_don_piccolo;

USE pizzeria_don_piccolo;

/* Lo siguiente es la creación de las tablas*/

-- 1ra Tabla: persona (La tabla padre que heredará a cliente, empleado y repartidor)

CREATE TABLE persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(20) UNIQUE,  -- Esta casilla será opcional para los clientes solamente.
    tipo_documento ENUM('cedula', 'pasaporte', 'cedula_extranjeria') DEFAULT 'cedula',
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) UNIQUE NOT NULL
);

-- 2da Tabla: cliente (es la tabla que almacenará a los clientes registrados, hereda de persona)

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT UNIQUE NOT NULL,
    direccion VARCHAR(255),
    correo VARCHAR(100) UNIQUE,
    cantidad_pedidos INT DEFAULT 0,
    es_frecuente BOOLEAN DEFAULT FALSE, 
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 3ra Tabla: empleado (almacena los empleados registrados, hereda de persona.)
CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT UNIQUE NOT NULL,
    rol ENUM('cajero', 'administrador') NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 4ta Tabla: zona (Almacena las zonas geográficas de cobertura de la pizzería.)
CREATE TABLE zona (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    nombre_zona VARCHAR(100) UNIQUE NOT NULL,
    tarifa_base DOUBLE NOT NULL,
    tiempo_estimado_min INT NOT NULL
);

-- 5ta Tabla: repartidor (Almacena los repartidores registrados. Hereda de persona y se relaciona con zona.)
CREATE TABLE repartidor (
    id_repartidor INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT UNIQUE NOT NULL,
    zona_asignada INT NOT NULL,
    estado ENUM('disponible', 'no_disponible', 'en_ruta') DEFAULT 'disponible',
    total_entregas INT DEFAULT 0,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (zona_asignada) REFERENCES zona(id_zona)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 6ta Tabla: categoria (Clasifica los productos, como 'pizzas' o 'bebidas'.)
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion TEXT,
    activa BOOLEAN DEFAULT TRUE
);

-- 7ma Tabla: producto (Tabla padre central que contiene la información base de todos los artículos del menú.)
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT,
    precio_base DOUBLE NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    requiere_ingredientes BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 8va Tabla: pizza (Detalles específicos de las pizzas, como tamaño y tipo. Hereda de producto.)
CREATE TABLE pizza (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNIQUE NOT NULL,
    tamano ENUM('personal', 'mediana', 'grande', 'familiar') NOT NULL,
    tipo ENUM('vegetariana', 'especial', 'clasica') NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 9na Tabla: bebida (Detalles específicos de las bebidas, como tamaño y volumen. Hereda de producto.)
CREATE TABLE bebida (
    id_bebida INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNIQUE NOT NULL,
    tamano ENUM('pequena', 'mediana', 'grande', 'litro', 'dos_litros') NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 10ma Tabla: ingrediente (Lista de ingredientes disponibles para la preparación y el control de inventario.)
CREATE TABLE ingrediente (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    stock_actual INT DEFAULT 0 NOT NULL,
    stock_minimo INT DEFAULT 10 NOT NULL,
    costo_unitario DOUBLE NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL
);

-- 11ra Tabla: producto_ingrediente (Define la receta y se relaciona entre productos e ingredientes.)
CREATE TABLE producto_ingrediente (
    id_producto_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    id_ingrediente INT NOT NULL,
    cantidad_necesaria INT NOT NULL CHECK (cantidad_necesaria > 0),  -- cantidad por producto
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    UNIQUE KEY unique_producto_ingrediente (id_producto, id_ingrediente)
);

-- 12da Tabla: pedido (El registro principal de cada orden realizada por un cliente.)
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    metodo_pago ENUM('efectivo', 'tarjeta', 'app') NOT NULL,
    estado ENUM('pendiente', 'en_preparacion', 'listo', 'en_ruta', 'entregado', 'cancelado') 
        DEFAULT 'pendiente',
    subtotal DOUBLE NOT NULL,
    costo_envio DOUBLE DEFAULT 0,
    iva DOUBLE NOT NULL,
    total DOUBLE NOT NULL,
    es_domicilio BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 13ra Tabla: pedido_producto (Relación Muchos a Muchos (N:M) que registra qué productos, y cuántos, tiene un pedido.)
CREATE TABLE pedido_producto (
    id_pedido_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DOUBLE NOT NULL,
    subtotal_linea DOUBLE NOT NULL,
    observaciones TEXT, 
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 14ta Tabla: domicilio (Detalles de la entrega, solo para pedidos donde es_domicilio = TRUE.)
CREATE TABLE domicilio (
    id_domicilio INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT UNIQUE NOT NULL,
    id_repartidor INT, 
    id_zona INT NOT NULL,
    hora_salida DATETIME,
    hora_entrega DATETIME,
    distancia_km DOUBLE,
    costo_envio DOUBLE NOT NULL,
    direccion_entrega VARCHAR(100) NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_repartidor) REFERENCES repartidor(id_repartidor)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (id_zona) REFERENCES zona(id_zona)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 15ta Tabla: historial_precios (Tabla de auditoría. Registra automáticamente cada vez que se cambia el precio de un producto.)
CREATE TABLE historial_precios (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    precio_anterior DOUBLE NOT NULL,
    precio_nuevo DOUBLE NOT NULL,
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
        ON DELETE RESTRICT ON UPDATE CASCADE
);