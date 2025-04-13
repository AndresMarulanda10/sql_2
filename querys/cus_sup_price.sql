-- Esta consulta identifica clientes cuyo precio de pedido (promedio de sus ventas)
-- es superior al promedio de todas las ventas.
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    AVG(v.precio) AS avg_precio_cliente
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
HAVING AVG(v.precio) > (SELECT AVG(precio) FROM ventas);

-- Probar la consulta:
-- SELECT 
--     c.id_cliente,
--     c.nombre_cliente,
--     AVG(v.precio) AS avg_precio_cliente
-- FROM ventas v
-- JOIN clientes c ON v.id_cliente = c.id_cliente
-- GROUP BY c.id_cliente, c.nombre_cliente
-- HAVING AVG(v.precio) > (SELECT AVG(precio) FROM ventas);