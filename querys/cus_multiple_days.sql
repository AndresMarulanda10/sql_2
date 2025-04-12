-- Esta consulta identifica clientes que han comprado en más de un día distinto.
-- Se agrupan las ventas por cliente y se cuenta el número de días distintos de compra.
SELECT 
    c.id_cliente, 
    c.nombre_cliente, 
    COUNT(DISTINCT v.fecha) AS dias_compra
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
HAVING COUNT(DISTINCT v.fecha) > 1
ORDER BY c.nombre_cliente DESC;

-- Probar la consulta:
-- SELECT 
--     c.id_cliente, 
--     c.nombre_cliente, 
--     COUNT(DISTINCT v.fecha) AS dias_compra
-- FROM clientes c
-- JOIN ventas v ON c.id_cliente = v.id_cliente
-- GROUP BY c.id_cliente, c.nombre_cliente
-- HAVING COUNT(DISTINCT v.fecha) > 1
-- ORDER BY c.nombre_cliente DESC;
```-- filepath: ./cus_multiple_days.sql
-- Esta consulta identifica clientes que han comprado en más de un día distinto.
-- Se agrupan las ventas por cliente y se cuenta el número de días distintos de compra.
SELECT 
    c.id_cliente, 
    c.nombre_cliente, 
    COUNT(DISTINCT v.fecha) AS dias_compra
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
HAVING COUNT(DISTINCT v.fecha) > 1
ORDER BY c.nombre_cliente DESC;

-- Probar la consulta:
-- SELECT 
--     c.id_cliente, 
--     c.nombre_cliente, 
--     COUNT(DISTINCT v.fecha) AS dias_compra
-- FROM clientes c
-- JOIN ventas v ON c.id_cliente = v.id_cliente
-- GROUP BY c.id_cliente, c.nombre_cliente
-- HAVING COUNT(DISTINCT v.fecha) > 1
-- ORDER BY c.nombre_cliente DESC;