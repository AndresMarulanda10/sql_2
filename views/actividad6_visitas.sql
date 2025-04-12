-- Asegúrate de estar conectado a ventas_db:
\c ventas_db

-- Crear la vista ventas_clientes_proveedores que muestra todas las ventas con el nombre del cliente y del proveedor.
CREATE VIEW ventas_clientes_proveedores AS 
SELECT 
    v.id_venta,
    c.nombre_cliente,
    pr.nombre_proveedor,
    v.precio,
    v.fecha
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor;

-- Probar la vista:
SELECT * FROM ventas_clientes_proveedores;
```-- filepath: ./actividad6_vistas.sql
-- Asegúrate de estar conectado a ventas_db:
\c ventas_db

-- Crear la vista ventas_clientes_proveedores que muestra todas las ventas con el nombre del cliente y del proveedor.
CREATE VIEW ventas_clientes_proveedores AS 
SELECT 
    v.id_venta,
    c.nombre_cliente,
    pr.nombre_proveedor,
    v.precio,
    v.fecha
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor;

-- Probar la vista:
SELECT * FROM ventas_clientes_proveedores;