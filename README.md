# 🍕 Pizzería Don Piccolo - Sistema de Gestión

## Descripción
Sistema de base de datos para gestionar pedidos, domicilios, clientes y productos de una pizzería en Bucaramanga.

## Modelo Entidad-Relación

```mermaid
erDiagram
    persona ||--o| cliente : "puede ser"
    persona ||--o| empleado : "puede ser"
    persona ||--o| repartidor : "puede ser"
    categoria ||--o{ producto : "agrupa"
    producto ||--o| pizza : "puede ser"
    producto ||--o| bebida : "puede ser"
    producto ||--o{ producto_ingrediente : "puede llevar"
    ingrediente ||--o{ producto_ingrediente : "compone"
    cliente ||--o{ pedido : "realiza"
    empleado ||--o{ pedido : "registra"
    pedido ||--|{ pedido_producto : "contiene"
    producto ||--o{ pedido_producto : "se vende en"
    pedido ||--o| domicilio : "puede tener"
    repartidor ||--o{ domicilio : "entrega"
    zona ||--o{ domicilio : "se entrega en"
    zona ||--o{ repartidor : "asignada a"
```

## Tablas Principales

### Herencia de Persona
- **persona**: datos básicos (nombre, apellido, teléfono, documento)
- **cliente**: clientes que realizan pedidos
- **empleado**: personal que atiende
- **repartidor**: personal que entrega domicilios

### Herencia de Producto
- **categoria**: tipos de productos (pizzas, bebidas)
- **producto**: información general de todos los productos
- **pizza**: detalles específicos (tamaño, tipo)
- **bebida**: detalles específicos (tamaño)

### Sistema de Pedidos
- **pedido**: órdenes de clientes
- **pedido_producto**: productos en cada pedido
- **domicilio**: información de entrega
- **zona**: zonas de cobertura con tarifas

### Otros
- **ingrediente**: materia prima
- **producto_ingrediente**: recetas
- **historial_precios**: auditoría de cambios
